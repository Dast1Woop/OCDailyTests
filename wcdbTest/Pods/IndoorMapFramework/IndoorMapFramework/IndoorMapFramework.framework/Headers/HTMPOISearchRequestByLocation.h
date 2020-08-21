//
//  HTMPOISearchRequestByLocation.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/26.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMGeoCoor;

NS_ASSUME_NONNULL_BEGIN


/**
 根据当前位置获取POI信息,未注明“非必须”的属性必须有值
 */
@interface HTMPOISearchRequestByLocation : NSObject

/// 每页记录数
@property (nonatomic, assign) int pageSize;

/// 当前页码
@property (nonatomic, assign) int pageNum;

/// 当前位置经纬度坐标，floorID 非必须
@property(nonatomic, strong) HTMGeoCoor *crtGeoCoor;

/// 范围（米）
@property (nonatomic, assign) double meter;

///分类id, 非必须
@property(nonatomic, copy) NSString *type;

/// 模糊搜索关键字， 非必须
@property(nonatomic, copy) NSString *keyword;

/// 指定地图（建筑）id, 非必须
@property(nonatomic, copy) NSString *mapId;

@end

NS_ASSUME_NONNULL_END
