//
//  SecondViewController.m
//  testNSTimerNewBlock
//
//  Created by LongMa on 2021/4/23.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic,strong) NSTimer *gTimer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSRunLoop currentRunLoop] addTimer:self.gTimer forMode:NSRunLoopCommonModes];
}

- (void)dealloc{
    [self.gTimer invalidate];
    self.gTimer = nil;
    NSLog(@"vc dead");
}

//MARK:getter
- (NSTimer *)gTimer{
    if (nil == _gTimer) {
        _gTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"haha");
        }];
    }
    return _gTimer;
}

@end
