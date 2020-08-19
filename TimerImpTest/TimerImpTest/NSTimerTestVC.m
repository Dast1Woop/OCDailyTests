//
//  SecondVC.m
//  TimerImpTest
//
//  Created by LongMa on 2020/8/19.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "NSTimerTestVC.h"

@interface NSTimerTestVC ()
@property(nonatomic, strong) NSTimer *gNSTimer;

//注意：需要对定时器进行暂停，继续操作时，必须自定义是否正在执行的属性，否则连续点击继续按钮时，会一直重新fire并立刻调用方法，可能这会有副作用。
@property (nonatomic, assign) BOOL gIsTimerExcuting;

@property(nonatomic, copy) NSString *gStr4Test;

@end

@implementation NSTimerTestVC

#pragma mark -  lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.gStr4Test = @"用于测试循环引用";
    
    //test 创建，暂停，继续，销毁；app退到后台表现；开启后退出vc后vc是否正常dealloc
}

- (void)dealloc{
    
    //This method is the only way to remove a timer from an NSRunLoop object. The NSRunLoop object removes its strong reference to the timer, either just before the invalidate method returns or at some later point.    If it was configured with target and user info objects, the receiver removes its strong references to those objects as well.
    [self.gNSTimer invalidate];
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark -  test
- (void)creatNSTimer{
    
    if (self.gNSTimer) {
        return;
    }
    
    //口诀：“weak strong dance，strong must exists”
    //block内如果有self，易造成循环引用;__weak可以打破循环引用；
    //不建议使用带target:参数的类方法创建timer（此方法要破解循环引用，需要给NSTimer写分类，并用分类中方法创建。效果同iOS10+ 可用的，下面演示的 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block 方法）
    __weak typeof(self) weakSelf = self;
    NSTimer *lTimer = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        //__strong typeof(self)，对weakSelf进行强引用，防止后面weakSelf被销毁（eg：vc被销毁引起）引发的crash;
        //注意：不能用if(nil != weakself)代替strong行，因为多线程情况下，if判断时self未释放，但是执行 self 里面的代码时，就刚好释放了(多线程读写问题)，此时，if语句里有kvo等不兼容nil的操作时，程序会crash。
        __strong typeof(self) sSelf = weakSelf;
        
        //必须判断，因为weakself在赋值给sSelf之前可能就为nil了。（1.进来后就变为nil了；2.weakself进来时不为nil，但是多线程时，到m4NSTimerSelector方法调用时，可能weakself就为nil了。）
        if (sSelf) {
            [sSelf m4NSTimerSelector];
        }
    }];
    self.gNSTimer = lTimer;
}

- (void)m4NSTimerSelector{
    NSString *lStr = self.gStr4Test;
    NSLog(@"NSTimer come in,%@", lStr);
}

#pragma mark -  action

- (IBAction)startBtnDC:(id)sender {
    [self creatNSTimer];
    if (self.gNSTimer.valid) {
        [[NSRunLoop currentRunLoop] addTimer:self.gNSTimer forMode:NSRunLoopCommonModes];
        self.gIsTimerExcuting = YES;
    }else{
        NSLog(@"timer 无效");
    }
}

- (IBAction)pauseBtnDC:(id)sender {
    if (NO == self.gIsTimerExcuting) {
        return;
    }
    
    if (self.gNSTimer.valid) {
        self.isTimerExcuting = NO;
        self.gNSTimer.fireDate = [NSDate distantFuture];
    }else{
        NSLog(@"timer 无效");
    }
}

- (IBAction)resumeBtnDC:(id)sender {
    if (self.isTimerExcuting) {
        return;
    }
 
    if (self.gNSTimer.valid) {
        self.gIsTimerExcuting = YES;
        self.gNSTimer.fireDate = [NSDate distantPast];
    }else{
        NSLog(@"timer 无效");
    }
}

- (IBAction)dismissBtnDC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
          
      }];
}




@end
