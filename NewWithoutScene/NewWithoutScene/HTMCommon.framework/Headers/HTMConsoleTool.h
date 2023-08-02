//
//  HTMConsoleTool.h
//  HTMCommon
//
//  Created by LongMa on 2021/5/15.
//  Copyright © 2021 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSingleton.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 只 log 效果，五指双击屏幕关闭，需自己实现window上加手势 toggle 触发 log 视图
@interface HTMConsoleTool : NSObject
HMSingleton_h(HTMConsoleTool);


/// 使用 log 前必须先调用此方法配置
/// @param window log 界面显示时被加到的 window
/// @param isShakeGestureEnabled 是否使用摇一摇触发 log 界面显隐
- (void)configureInWindow:(UIWindow *)window isShakeGestureEnabled:(BOOL)isShakeGestureEnabled;


/// 打印字符串
/// @param func 方法名，传""或  __func__  ，用于log时显示log所在方法。慎用__func__，看起来 log 会比较多
/// @param str 字符串，后面跟 format，valist的形式
- (void)logInFunc:(char const *)func str:(NSString *)str, ...;


/// 切换 log 视图显隐
- (void)toggle;

@end

NS_ASSUME_NONNULL_END
