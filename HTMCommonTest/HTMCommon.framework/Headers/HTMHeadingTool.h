//
//  HeadingTool.h
//  EnvAccess
//
//  Created by 马玉龙 on 16/3/16.
//  Copyright © 2016年 huatu. All rights reserved.
//

/** 注意:
 1、在didfinishlaunching中开始监听方向:
 [[HTMHeadingTool sharedHTMHeadingTool] startGetHeading];
 2、在willterminate中停止方向监听:
 [[HTMHeadingTool sharedHTMHeadingTool] stopGetHeading];
 */

#import <Foundation/Foundation.h>
#import "HMSingleton.h"
#import <CoreLocation/CoreLocation.h>

@interface HTMHeadingTool : NSObject
HMSingleton_h(HTMHeadingTool);

/** 方向不是隐私，不需要请求授权 */
- (void)startGetHeading;

- (void)stopGetHeading;

/** 磁偏角度 */
@property (nonatomic, assign) CLLocationDirection gMagneticHeading;

/** 磁偏弧度 */
@property (nonatomic, assign) CLLocationDirection gRadianMagneticHeading;

@end
