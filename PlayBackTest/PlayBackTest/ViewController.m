//
//  ViewController.m
//  PlayBackTest
//
//  Created by LongMa on 2020/9/3.
//  Copyright © 2020 my. All rights reserved.
//

/**
 # 回放功能简单介绍
 为控制出差人员数量、减低出差成本，一般只派项目经理或测试人员去现场进行地图的定位和导航功能测试。当现场人员发现app功能不符合预期时，远程沟通不利于开发人员找到问题原因。
 于是就有了回放功能。即：在现场测试时，app需要记录现场实时检测到的相关信息，如gps坐标等。记录完毕后，把手机带回公司。开发人员通过选择已记录路段并点击”模拟回放“按钮（更改app系统数据输入源为本地记录数据），可以对现场记录的某个路段的相关信息进行从头到尾的顺序回放，从而实现从起点到终点的路线回放效果，通过观察app回放效果和相关log，方便开发人员推理问题原因。
 
 # 回放代码实现原理：
 * app数据库存储时，现场记录的数据类型可能有多种，把所有不同种类信息统计记录到一种模型中，用一个字段区分是哪种数据；用其他字段记录相关信息和存储时间戳。
 * 存储数据量不大时，可以直接读取某条路所有条目模型到内存；数据量较大时，需要切割，分批读取，以免内存暴增导致app被杀。
 * 根据相邻模型的时间戳差值进行模拟回放。
 
 回放技术难点：
 * 每一种数据的相邻数据的时间间隔（最短零点几秒）不固定。
 * 数据量较大时，需要切割，分批读取
 
 # 如何实现不同时间间隔的数据回放
 ## 思路
 ### 使用较准确的gcd相关定时器实现每 0.1s 一次回调；
 ### 在回调方法中判断是否需要真的进行回放操作；
 定义私有属性：倒计时次数、正在执行的数组下标
 首先计算相邻模型的时间戳差值，比如0.5s，然后为了实现0.5后才真正进行回放，需要定时器跳过4次，在第五次再真正回放，同时计算
 
 ## log
 
 ## 小结
 > demo地址：
 */
#import "ViewController.h"
#import "MYLTimer.h"

@interface ViewController ()
@property (nonatomic, copy) NSArray *gArrData;
@property(nonatomic, strong) MYLTimer *gTimer;

///倒计时次数，为0时，才执行一次方法+重新初始化；初始化后，每0.1s自减1。当执行完毕时，停止定时器。
@property (nonatomic, assign) int gCountDownNum;

///正在执行的数组下标
@property (nonatomic, assign) int gExcutingIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self testPlayBack];
    
    [self startPlayBackByGcdTimer];
}

#pragma mark -  action
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"self.gTimer = %@", self.gTimer);
}

#pragma mark -  method
- (void)startPlayBackByGcdTimer{
    if ([self.gTimer isValid]) {
        [self.gTimer invalidate];
    }
    
    [self initPlaybackData];
    self.gTimer = [MYLTimer timerWithTimeInterval:0.1 target:self selector:@selector(timer:) repeats:YES];
}

- (void)initPlaybackData{
    self.gCountDownNum = 0;
    self.gExcutingIndex = 0;
}

- (void)timer:(MYLTimer *)timer{
    
    //数组元素执行完毕
    if (self.gArrData.count == self.gExcutingIndex) {
        [self.gTimer invalidate];
        [self initPlaybackData];
        return;
    }
    
    if (self.gCountDownNum > 0) {
        self.gCountDownNum -= 1;
    }else{// <= 0
        //当前执行下标后面的模型是否有效：当后面日期晚于当前模型时，才有效。
        static BOOL lIsModelAvailable = YES;
        
        //下次模型有效时，才真正地执行一次回放操作
        if (lIsModelAvailable) {
            [self playBackReallyWithIndex:self.gExcutingIndex];
        }
        
        //初始化下一次回调:1.时间间隔 对应 gCountDownNum 2.数组执行下标
        int lCrtIndex = self.gExcutingIndex;
        
        
        //下次被比较的模型下标差值
        static int lNextComparedModelIndexDiff = 1;
        
        //目前已经是数组中最后一个元素
        if (self.gExcutingIndex + lNextComparedModelIndexDiff == self.gArrData.count) {
            
            //为了下次调用此方法时，可以销毁定时器
            self.gExcutingIndex = (int)self.gArrData.count;
            return;
        }
        
        int lNextComparedModelIndex = lCrtIndex + lNextComparedModelIndexDiff;

        float lInterval = [self getTimeIntervalWithArr:self.gArrData crtIndex:lCrtIndex nextComparedIndex:lNextComparedModelIndex];
        
        if (lInterval >= 0) {
            lIsModelAvailable = YES;
            int lInter = (int)(ceilf)(lInterval * 10);
            
            //当记录的时间间隔刚好为0时，self.gCountDownNum = 0,效果是0.1s后真正执行；若大于0，都会被ceilf向上取整，此时，需要减 1。（此处赋值后到下次timer:被调用，需要花费0.1s）
            int lTemp = (0 == lInter ? 0 : lInter - 1);
            self.gCountDownNum = lTemp;
            
            self.gExcutingIndex = lNextComparedModelIndex;
            lNextComparedModelIndexDiff = 1;
        }else{
             NSLog(@"下一模型的时间戳早于当前模型时间戳，认为无效。gExcutingIndex:%d,判定下标：%d", self.gExcutingIndex, lNextComparedModelIndex);
            
            lIsModelAvailable = NO;
            lNextComparedModelIndexDiff += 1;
        }
        
    }
}

//实际中，修改此方法实现。计算数组中模型的时间差(为负值时，认为nextIndex对应模型无效，timer中算法自动把crtIndex模型与之后模型依次对比)。
- (float)getTimeIntervalWithArr:(NSArray *)arr crtIndex:(int)crtIndex nextComparedIndex:(int)nextIndex{
    return  [arr[nextIndex] floatValue] - [arr[crtIndex] floatValue];
}

- (void)playBackReallyWithIndex:(int)index{
    NSLog(@"playBackReally,arr index:%d", index);
}

- (void)testPlayBack{
    for (int i = 0; i < self.gArrData.count; ++i) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"i = %@", self.gArrData[i]);
        });
    }
}

#pragma mark -  getter
- (NSArray *)gArrData{
    if (nil == _gArrData) {
        
        //第1组：模拟 5 组，差值都是 1 s
        NSMutableArray *lArrM = [NSMutableArray array];
        for (int i = 0; i < 5; ++i) {
            [lArrM addObject:@(i)];
        }
        
        //第2组：模拟 5 组，差值都是 2 s
        for (int i = 6; i < 16; i += 2) {
            [lArrM addObject:@(i)];
        }
        
        //第3组：模拟 5 组，差值都是 0.54 s，预期效果：间隔0.6s依次回放
        //设置17(5组)，测试后面数据时间更早的不合理情况；
        //设置16.2(4组，临界值16.66)，测试后面数据时间更晚的合理情况；
        float lTopNum = 17;
        for (float i = 14.5; i < lTopNum; i += 0.54) {
            [lArrM addObject:@(i)];
        }
        
        //第4组：模拟 5 组，差值都是 0.01 s，预期效果：0.1后一次回放
        for (float i = 16.54; i < 16.59; i += 0.01) {
            [lArrM addObject:@(i)];
        }
        
        //第5组：模拟 5 组，差值都是 0 s，预期效果：0.1后一次回放
        for (float i = 16.59, j = 0; j < 5; j++) {
            [lArrM addObject:@(i)];
        }
        
        //第6组： 肯定能执行的 5 组。
        for (float i = 20, j = 0; j < 5; j++) {
            [lArrM addObject:@(i)];
        }
        
        _gArrData = [lArrM copy];
    }
    return _gArrData;
}
@end
