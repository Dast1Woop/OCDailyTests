//
//  HTEnumDefines.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/3/18.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 路径规划类型枚举
  @warning 优先策略不一定完全经过无障碍、盲道等。建议使用仅无障碍、仅盲道通行

 */
typedef NS_ENUM(NSInteger,RoutePlanType){
    ///时间优先,路径规划算法默认使用时间优先
    BY_TIME = 1,
    ///距离优先
    BY_DISTANCE,
    ///楼梯优先
    BY_STAIR,
    ///自动扶梯优先
    BY_ESCALATOR,
    ///电梯优先
    BY_ELEVATOR,
    ///步行优先
    BY_WALK,
    ///(行车优先) 【暂不支持】
    BY_DRIVE,
    ///无障碍优先
    BY_ACCESSIBILITY,
    ///仅无障碍通行
    BY_ACCESSIBILITY_ONLY,
    /// (盲道优先)
    BY_BLIND,
    ///仅盲道通行
    BY_BLIND_ONLY,
    /// ( 通道优先) new
    BY_WHEELCHAIR,
    /// (仅轮椅通道通行) new
    BY_WHEELCHAIR_ONLY
};

NS_ASSUME_NONNULL_BEGIN

@interface HTMEnumDefines : NSObject

@end

NS_ASSUME_NONNULL_END
