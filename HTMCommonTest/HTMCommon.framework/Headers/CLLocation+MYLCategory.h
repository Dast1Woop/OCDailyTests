//
//  CLLocation+MYLCategory.h
//  HTMCommon
//
//  Created by LongMa on 2019/8/12.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLLocation (MYLCategory)

/**
 获取距离当前位置墨卡托坐标x方向 +x 米的CLLocation对象

 @param distance 距离
 @return CLLocation对象
 */
- (instancetype)getNearLocationWithDistance:(float)distance;
@end

NS_ASSUME_NONNULL_END
