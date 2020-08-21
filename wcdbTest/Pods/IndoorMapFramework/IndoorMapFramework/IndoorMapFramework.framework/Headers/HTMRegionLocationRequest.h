//
//  HTMRegionLocationRequest.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/9/9.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMRegionLocationRequest : NSObject<NSCoding, NSCopying>

///必传，经纬度
@property(nonatomic, assign) CLLocationCoordinate2D coor2D;

/** 非必传，不传时默认值为4。
 地区级别：1国家，2省，3市，4区。级别为x时，搜索结果中就会有x个HTMRegionLocationResponse对象，排序按范围从大到小。
 eg1：level = 4时， 搜索结果回调数组:[国家, 省, 市, 区]。
 eg2: level = 3时，搜索结果回调数组:[国家, 省, 市]。拿数组中最后一个对象就能获取到市的信息。
 */
@property (nonatomic, assign) int level;

- (instancetype)initWithCoor:(CLLocationCoordinate2D)coor2D level:(int)level;
+ (instancetype)requestWithCoor:(CLLocationCoordinate2D)coor2D
                          level:(int)level;
@end

NS_ASSUME_NONNULL_END
