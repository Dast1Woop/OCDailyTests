//
//  ViewController.m
//  AppendStringTest
//
//  Created by LongMa on 2020/9/16.
//  Copyright © 2020 ht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableString *lStrM = [NSMutableString new];
    
    NSString *lStr = [@"1" stringByAppendingString:lStrM];
    NSLog(@"lStr:%@", lStr);
    
//    [self test];
    
    NSString *lStr3 = nil;
    NSString *lStr3log = [NSString stringWithFormat:@"3-%@", lStr3];
    NSLog(@"lStr3log:%@", lStr3log);
}

//会崩溃
- (void)test{
    NSString *lStr2 = nil;
    NSString *lStr2log = [@"2" stringByAppendingString:lStr2];
    NSLog(@"lStr2log:%@", lStr2log);
}


@end
