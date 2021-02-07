//
//  ViewController.m
//  DynamicCellHeightTest
//
//  Created by LongMa on 2021/2/7.
//

#import "ViewController.h"
#import "HTBNByBusGuideVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HTBNByBusGuideVC *lVC = [[HTBNByBusGuideVC alloc] init];
    [self presentViewController:lVC animated:YES completion:^{
            
    }];
}


@end
