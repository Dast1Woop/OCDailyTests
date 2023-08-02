//
//  UIDevice+deviceVersionCategory.h
//  EnvAccess
//
//  Created by LongMa on 16/4/26.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (deviceVersionCategory)

+ (NSString *)currentDeviceVersion;

//只能判断设置界面中wifi是否开启；无法检测控制中心关闭wifi但是设置页没有关wifi的情况
+ (BOOL)isWiFiEnabled;
@end
