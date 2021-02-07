//
//  ToastTool.h
//  HuaTuPark
//
//  Created by LongMa on 2018/4/28.
//  Copyright © 2018年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSingleton.h"
#import <UIKit/UIKit.h>

@interface HTMToastTool : NSObject
HMSingleton_h(HTMToastTool);

/** 是否打开toast */
@property (nonatomic, assign) BOOL gIsOpenToast;

- (void)tool4MakeToast:(NSString *)message
                toView:(UIView *)view;

- (void)tool4MakeToast:(NSString *)message
              duration:(NSTimeInterval)duration
              position:(id)position
                toView:(UIView *)view;

- (void)tool4MakeToast2KeyWindowWithMsg:(NSString *)message;

- (void)tool4MakeToast2KeyWindowWithMsg:(NSString *)message
                               duration:(NSTimeInterval)duration
                               position:(id)position;

@end

