//
//  SecViewController.m
//  TestMainAsync
//
//  Created by LongMa on 2021/8/10.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"haha");
//    }];
    
    //repeats If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
    //Stops the timer from ever firing again and requests its removal from its run loop.  - (void)invalidate;
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timer) userInfo:nil repeats:false];
}

- (void)timer{
    NSLog(@"%s", __func__);
}

- (void)dealloc{
    NSLog(@"%s", __func__);
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
