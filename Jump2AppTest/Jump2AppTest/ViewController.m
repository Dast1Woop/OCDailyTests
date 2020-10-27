//
//  ViewController.m
//  Jump2AppTest
//
//  Created by LongMa on 2020/10/12.
//  Copyright © 2020 ht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self jumpToBusGuideBlind4Macao];
}

///跳转到 “视障助乘巴士报站” 的代码
- (void)jumpToBusGuideBlind4Macao{
    NSURL *lUrl = [NSURL URLWithString:@"BusGuideBlind4Macao://"];
    if ([[UIApplication sharedApplication] canOpenURL:lUrl]) {
        
        //iOS 10以上 api
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:lUrl
                                               options:@{UIApplicationOpenURLOptionUniversalLinksOnly : @(NO)}
                                     completionHandler:^(BOOL success) {
                if (success) {
                    //跳转成功
                    NSLog(@"跳转“视障助乘巴士报站”成功");
                }else{
                    //跳转失败
                    NSLog(@"跳转“视障助乘巴士报站”失败");
                }
            }];
        }else{//iOS 10以下 api
            BOOL success = [[UIApplication sharedApplication] openURL:lUrl];
            if (success) {
                //跳转成功
                NSLog(@"跳转“视障助乘巴士报站”成功");
            }else{
                //跳转失败
                NSLog(@"跳转“视障助乘巴士报站”失败");
            }
        }
    }
}
@end
