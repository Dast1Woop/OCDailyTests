//
//  ViewController.m
//  ImgDownloadDemo
//
//  Created by LongMa on 2020/8/28.
//  Copyright © 2020 my. All rights reserved.
//

#import "ViewController.h"
#import "BlockTestDemo-Swift.h"
#import "Person.h"

typedef int (^MYLBlock) (int a, int b);
typedef void (^MYLVoidBlock) (void);

@interface ViewController ()
@property (nonatomic, assign) NSInteger gNum;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self blockDifferentDefineStyle];
    
//    [self blockAccessLocalInt];
//    [self blockChangeLocalInt];
    
//    [self blockAccessLocalStr];
//    [self blockChangeLocalStr];
    
//    [self blockAccessLocalMutStr];
//    [self blockChangeLocalMutStr];
//
//    [self blockAccessLocalModel];
    [self blockChangeLocalModel];
}

//写法参考：http://fuckingblocksyntax.com
- (void)blockDifferentDefineStyle{
    int (^myBlock)(int a, int b) = ^ (int a, int b){
        return a + b;
    };
    
    int rslt = myBlock(3, 4);
    NSLog(@"sum：%d", rslt);
    
    MYLBlock subBlock = ^(int a, int b){
        return a - b;
    };
    int subRslt = subBlock(10, 4);
    NSLog(@"sub:%d", subRslt);
    
    //敲inlineblock时会自动生成如下代码块：
    //    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
    //        <#statements#>
    //    };
}

- (void)blockAccessLocalInt{
    int i = 10;
    NSLog(@"i init: %p", &i);
    
    MYLVoidBlock testBlk = ^(){
        NSLog(@"i in block:%d, %p", i, &i);
    };
    
    i = 20;
    
    //log结果为 10，因为上面block在定义时，对访问的变量复制了一份到堆中
    //ps：经测试，此规律不适用于swift！swift里始终对应blockChangeOuterAttrTest方法中 “__block” 模式的拷贝。
    testBlk();
}

/** log:
        start: 10,0x7ffee779d0e8
 
        end: 10,0x600001f9b0b8
        in block:30, 0x600001f9b0b8
 */
- (void)blockChangeLocalInt{
    __block int i = 10;
    NSLog(@"i start: %d,%p", i, &i);
    
    //执行过此行代码后，因__block存在，i会被自动拷贝一份到 堆 中，“后续对i的访问，都是获取的 堆 中的i”
    //为何会自动拷贝到堆中？A:block可以被当做参数传递，可能在任何时间和地点执行，而在block执行时栈中变量极可能已经被销毁了。所以必须copy一份到堆中。
    MYLVoidBlock testBlk = ^(){
        i = 30;
        NSLog(@"i in block:%d, %p", i, &i);
    };
    
    NSLog(@"i end: %d,%p", i, &i);
    
    testBlk();
}

/** log:
start-0x7ffee05800e8, a
end-0x7ffee05800e8, b
in-0x600003d166c0, a
 */
- (void)blockAccessLocalStr{
    NSString *lStr = @"a";
    NSLog(@"start-%p, %@", &lStr, lStr);
    
    MYLVoidBlock lb = ^(){
        NSLog(@"in-%p, %@", &lStr, lStr);
    };
    
    lStr = @"b";
    NSLog(@"end-%p, %@", &lStr, lStr);
    lb();
}

/** log:
start-0x7ffeea9080e8, a
end-0x6000001af448, b
in-0x6000001af448, c
 */
- (void)blockChangeLocalStr{
    __block NSString *lStr = @"a";
    NSLog(@"start-%p, %@", &lStr, lStr);
    
    MYLVoidBlock lb = ^(){
        lStr = @"c";
        NSLog(@"in-%p, %@", &lStr, lStr);
    };
    
    lStr = @"b";
    NSLog(@"end-%p, %@", &lStr, lStr);
    lb();
}

/** block定义时，访问（不改变）可变字符串时，
 log:
    start-0x7ffeee6c00e8, s
    end-0x7ffeee6c00e8, s-bbb
    in-0x600001aabe30, s-bbb-aaa
 */
- (void)blockAccessLocalMutStr{
    NSMutableString *lStrM = [@"s" mutableCopy];
    NSLog(@"start-%p, %@", &lStrM, lStrM);
    
    /**  block内如果有用到“可变类对象”，分情况：
     1.若直接赋值修改，同普通属性,需要加__block；
     2.若只是调用方法，其实不会对对象进行修改；不用加__block;后续block外对对象的访问也是访问 栈 里的对象。但是对lStrM的拷贝时间，居然是在block被调用时！
     */
    MYLVoidBlock lb = ^(){
        [lStrM appendString:@"-aaa"];
        NSLog(@"in-%p, %@", &lStrM, lStrM);
    };
    
    [lStrM appendString:@"-bbb"];
    NSLog(@"end-%p, %@", &lStrM, lStrM);
    lb();
}

/** block定义时，改变 可变字符串时,效果同改变int类型局部变量:
    log:
        start-0x7ffeeaf250e8, 0
 
        end-0x600001b22a58, 0
        in-0x600001b22a58, in-aaa
 */
- (void)blockChangeLocalMutStr{
    __block NSMutableString *lStrM = [@"0" mutableCopy];
    NSLog(@"start-%p, %@", &lStrM, lStrM);
    
    /**  block内如果有用到“可变类对象”，分情况：
     1.若直接赋值修改，同普通属性,需要加__block；
     2.若只是调用方法，其实不会对对象进行修改；不用加__block;后续block外对对象的访问也是访问 栈 里的对象。但是对lStrM的拷贝时间，居然是在block被调用时！
     */
    MYLVoidBlock lb = ^(){
        lStrM = [@"in" mutableCopy];
        [lStrM appendString:@"-aaa"];
        NSLog(@"in-%p, %@", &lStrM, lStrM);
    };
    
    NSLog(@"end-%p, %@", &lStrM, lStrM);
    lb();
}


/** 从log可知，block访问的局部变量为模型时，跟访问 可变字符串 是相同规律。
 log:
start:name:liLei,age:18, 0x7ffeec28e0e8
end:name:liLei,age:22, 0x7ffeec28e0e8
in:name:hanMM,age:22, 0x6000036092b0
 */
- (void)blockAccessLocalModel{
    Person *lP = [Person personWithName:@"liLei" age:18];
    NSLog(@"start:%@, %p", lP, &lP);
    
    MYLVoidBlock lB = ^(){
        lP.gStr4Name = @"hanMM";
        NSLog(@"in:%@, %p", lP, &lP);
    };
    
    lP.gAge = 22;
    NSLog(@"end:%@, %p", lP, &lP);
    lB();
}

/** block修改局部变量时，规律相同
 log:
 start:name:liLei,age:18, 0x7ffee35280e8
 end:name:liLei,age:18, 0x600000ab4808
 in:name:hanMM,age:20, 0x600000ab4808
 */
- (void)blockChangeLocalModel{
    __block Person *lP = [Person personWithName:@"liLei" age:18];
    NSLog(@"start:%@, %p", lP, &lP);
    
    MYLVoidBlock lB = ^(){
        lP = [Person personWithName:@"hanMM" age:20];
        NSLog(@"in:%@, %p", lP, &lP);
    };
    
    NSLog(@"end:%@, %p", lP, &lP);
    lB();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TestVC *lVC = [[TestVC alloc] init];
    [self presentViewController:lVC animated:YES completion:^{
        
    }];
}


@end
