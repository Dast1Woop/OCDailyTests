//
//  HTMGetDirTool.h
//  HTMCommon
//
//  Created by LongMa on 2019/5/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMGetDirTool : NSObject

/** 用户磁偏角度转换为x正到用户方向的夹角;
magneticHeading:此刻的磁偏角大小
mapCorrectAngle:当人面向地图大门时，指南针显示的角度（北方顺时针转到手机方向的角度）
*/
+ (int) tool4GetDestiAngleOfXP2UserFromMagneticHeading:(double)magneticHeading
                                       mapCorrectAngle:(int)mapCorrectAngle;
@end

NS_ASSUME_NONNULL_END
