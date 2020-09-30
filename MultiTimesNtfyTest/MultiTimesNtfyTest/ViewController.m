//
//  ViewController.m
//  MultiTimesNtfyTest
//
//  Created by LongMa on 2020/9/30.
//  Copyright © 2020 ht. All rights reserved.
//

#import "ViewController.h"

NSString *const KNTFY_TEST = @"KNTFY_TEST";
@interface ViewController ()

/// 是否只添加通知一次
@property (nonatomic, assign) NSInteger gIfAddOnce;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gIfAddOnce = NO;
    [self addNtfy];
    
    NSLog(@"5s后开始发通知");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:KNTFY_TEST object:nil];
    });
}


/// 是否只加一次通知
- (void)addNtfy{
    if (self.gIfAddOnce) {
        [self addNtfyOnlyOnce];
    }else{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ntfyMethodTest) name:KNTFY_TEST object:nil];
    }
}

- (void)addNtfyOnlyOnce {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ntfyMethodTest) name:KNTFY_TEST object:nil];
    });
}

- (void)ntfyMethodTest{
    NSLog(@"%s", __FUNCTION__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __FUNCTION__);
    [self addNtfy];
}

@end
