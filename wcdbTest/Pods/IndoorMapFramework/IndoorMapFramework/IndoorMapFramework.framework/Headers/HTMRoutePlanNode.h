//
//  RoutePlanNode.h
//  IndoorMapFramework
//
//  Created by Xd Huang on 2019/2/22.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMGeoCoor.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMRoutePlanNode : HTMGeoCoor<NSCoding, NSCopying>

/** 名称 */
@property(nonatomic, copy) NSString *name;

/** mapID */
@property(nonatomic, copy) NSString *mapId;

/**
 通过经纬度创建路径规划点

 @param lng 经度
 @param lat 纬度
 @return HTMRoutePlanNode 对象
 */
- (instancetype)initWithLng:(double)lng lat:(double)lat;

/**
  通过经纬度创建路径规划点

 @param lng 经度
 @param lat 纬度
 @return TMRoutePlanNode 对象
 */
+ (instancetype)nodeWithLng:(double)lng lat:(double)lat;

/**
 通过经纬度等参数创建路径规划点

 @param lng 经度
 @param lat 纬度
 @param floorID 楼层id
 @param name 节点名
 @param mapId 节点所在地图id
 @return TMRoutePlanNode 对象
 */
+ (instancetype)nodeWithLng:(double)lng
                        lat:(double)lat
                    floorID:(int)floorID
                       name:(NSString *)name
                      mapId:(NSString *)mapId;
@end

NS_ASSUME_NONNULL_END
