//
//  HTMRouteSearchRequest.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMGeoCoor;
#import "HTMEnumDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMRouteSearchRequest : NSObject

/**
 起点所在地点的地图（建筑）id
 1.如果是室内则非空值，室外无需赋值
 2.若是和终点所在地图相同，则应该fromMapId=toMapId
 */
@property(nonatomic, copy) NSString *fromMapId;

/** 终点所在地点的地图（建筑）id
 1.如果是室内则非空值，室外无需赋值
 2.若是和起点所在地图相同，则应该toMapId=fromMapId
 */
@property(nonatomic, copy) NSString *toMapId;

/// 起点模型：必须对经纬度和floorID属性赋值
@property(nonatomic, strong) HTMGeoCoor *fromGeoCoor;

/// 终点模型：必须对经纬度和floorID属性赋值
@property(nonatomic, strong) HTMGeoCoor *toGeoCoor;

/// 规划策略, 默认是BY_TIME（时间优先）
@property (nonatomic, assign) RoutePlanType planType;

/**
 希望返回首要语言类型
 1.非空值，2.值为以下之一（区分大小写）：
 zh_cn (简体中文)
 zh_tw（[台湾]繁体中文）
 zh_hk （[香港] 繁体中文）
 zh_mo （[澳门] 繁体中文）
 en（英文）
 pt（葡文）
 */
@property(nonatomic, copy) NSString *lang;

@end

NS_ASSUME_NONNULL_END
