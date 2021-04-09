//
//  ViewController.m
//  JinZhiCal
//
//  Created by LongMa on 2021/4/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int a = 512;
    int b = (a>>8)&0b11;
    NSLog(@"%d",b);
    
    int a1 = 256;
    int b1 = (a1>>8)&0b11;
    NSLog(@"%d",b1);
    
    int a2 = 768;
    int b2 = (a2>>8)&0b11;
    NSLog(@"%d",b2);
}


@end
