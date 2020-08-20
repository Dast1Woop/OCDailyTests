//
//  GCDSourceVC.m
//  TimerImpTest
//
//  Created by LongMa on 2020/8/20.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "GCDSourceVC.h"
#import "MYLTimer.h"

@interface GCDSourceVC ()
@property(nonatomic, strong) MYLTimer *gGCDTimer;
@end

@implementation GCDSourceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)dealloc{
    [self.gGCDTimer invalidate];
    self.gGCDTimer = nil;
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)m4GCDTimer:(MYLTimer *)timer {
    NSLog(@"%@,%@", timer, [NSThread currentThread]);
}

#pragma mark -  action
- (IBAction)startBtnDC:(id)sender{
    if (self.gGCDTimer.isValid) {
        return;
    }
    
    //1.线程安全；2.不受runloop影响；3.不会循环引用；4.始终在主线程启动和执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"定时器创建线程：%@", [NSThread currentThread]);
        
        //不需要指定延迟x秒执行时，用类方法，默认Interval秒后开始自动
//        [MYLTimer timerWithTimeInterval:<#(NSTimeInterval)#> target:<#(nonnull id)#> selector:<#(nonnull SEL)#> repeats:<#(BOOL)#>]
        self.gGCDTimer = [[MYLTimer alloc] initWithFireTime:1 interval:2 target:self selector:@selector(m4GCDTimer:) repeats:YES];
    });
}

//暂停的效果，就是销毁定时器
- (IBAction)pauseBtnDC:(id)sender{
    [self.gGCDTimer invalidate];
    self.gGCDTimer = nil;
}

//继续的效果，就是新建定时器。可灵活设置延迟启动时间，设置0标识立刻激动。
- (IBAction)resumeBtnDC:(id)sender{
//    [self startBtnDC:nil];
    
       if (self.gGCDTimer.isValid) {
            return;
        }
         
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.gGCDTimer = [[MYLTimer alloc] initWithFireTime:0 interval:2 target:self selector:@selector(m4GCDTimer:) repeats:YES];
        });
}

- (IBAction)dismissBtnDC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
