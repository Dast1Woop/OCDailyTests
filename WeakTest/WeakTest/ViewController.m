//
//  ViewController.m
//  WeakTest
//
//  Created by LongMa on 2022/3/31.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIView *testV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.testV];
    self.testV.frame = self.view.bounds;
}

- (UIView *)testV{
    if (nil == _testV) {
        _testV = [[UIView alloc] init];
        _testV.backgroundColor = [UIColor orangeColor];
    }
    return  _testV;
}


@end
