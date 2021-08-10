//
//  ViewController.m
//  TestMainAsync
//
//  Created by LongMa on 2021/8/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"111");
    NSLog(@"222");
    
    //sync main会崩溃，死锁
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"333");
    });
    NSLog(@"444");
}


@end
