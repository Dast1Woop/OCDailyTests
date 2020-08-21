//
//  HTMGeoCoor.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMGeoCoor : NSObject<NSCopying, NSCoding>

/// 经度
@property (nonatomic, assign) double lng;

/// 纬度
@property (nonatomic, assign) double lat;

/// 室内地图的楼层id
@property (nonatomic, copy) NSString *floorId;

/// 墨卡托x坐标
@property (nonatomic, assign) double x;

/// 墨卡托y坐标
@property (nonatomic, assign) double y;

@end

NS_ASSUME_NONNULL_END
