//
//  SecondViewController.m
//  NSTimerTest1
//
//  Created by LongMa on 2022/3/24.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic, weak) NSTimer *xTimer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.xTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:true completion:nil];
    
    [self.xTimer invalidate];
}



- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
    
    [self.xTimer invalidate];
}

- (void)timerAction{
    NSLog(@"adfasf");
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
