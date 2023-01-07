//
//  ViewController.m
//  NSTimerTest1
//
//  Created by LongMa on 2022/3/24.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Person.h"

@interface ViewController ()
@property(nonatomic, strong) Person *p1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.p1 = [[Person alloc] init];
    self.p1.name = @"lilei";
    NSLog(@"%@", self.p1);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecondViewController *secVc = [[SecondViewController alloc] init];
    [self presentViewController:secVc animated:YES completion:nil];
}




@end
