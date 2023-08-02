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


/// 弹窗 + log 效果
@interface HTMToastTool : NSObject
HMSingleton_h(HTMToastTool);

/** 是否打开弹窗 toast。 @warning 不影响方法内的 log 功能 */
@property (nonatomic, assign) BOOL gIsOpenToast;


/// toast method
/// @param message toast和log信息
/// @param view  承载视图
/// @param func 方法名，传""或  __func__  ，用于log时显示log所在方法。慎用__func__，看起来log会比较多
- (void)tool4MakeToast:(NSString *)message
                toView:(UIView *)view
                  func:(char const *)func;


/// toast method
/// @param message toast和log信息
/// @param duration 持续时间
/// @param position  位置, "CSToastPositionTop"/"CSToastPositionCenter"/"CSToastPositionBottom"
/// @param view 承载视图
/// @param func 方法名，传""或  __func__  ，用于log时显示log所在方法。慎用__func__，看起来log会比较多
- (void)tool4MakeToast:(NSString *)message
              duration:(NSTimeInterval)duration
              position:(id)position
                toView:(UIView *)view
                  func:(char const *)func;


/// toast method
/// @param message toast和log信息
/// @param func 方法名，传""或  __func__  ，用于log时显示log所在方法。慎用__func__，看起来log会比较多
- (void)tool4MakeToast2KeyWindowWithMsg:(NSString *)message
                                   func:(char const *)func;


/// toast method
/// @param message toast和log信息
/// @param duration 持续时间
/// @param position 位置, "CSToastPositionTop"/"CSToastPositionCenter"/"CSToastPositionBottom"
/// @param func 方法名，传""或  __func__  ，用于log时显示log所在方法。慎用__func__，看起来 log 会比较多
- (void)tool4MakeToast2KeyWindowWithMsg:(NSString *)message
                               duration:(NSTimeInterval)duration
                               position:(id)position
                                   func:(char const *)func;

@end

