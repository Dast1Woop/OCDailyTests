//
//  NSNumber+Category.h
//  EnvAccess
//
//  Created by 马玉龙 on 16/3/25.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

@interface NSNumber (Category)

+ (instancetype)number4DecimalStyleFromString:(NSString *)string;

/** 角度转为弧度 */
+ (CGFloat)number4AngleToRadian:(CGFloat)angle;

/** 弧度转为角度 */
+ (CGFloat)number4RadianToAngle:(CGFloat)radian;

@end
