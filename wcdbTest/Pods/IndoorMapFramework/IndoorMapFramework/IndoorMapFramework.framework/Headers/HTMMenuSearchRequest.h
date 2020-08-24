//
//  HTMMenuSearchRequest.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/9/29.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN


/// 根据当前位置获取POI菜单
@interface HTMMenuSearchRequest : NSObject

/// 经纬度
@property(nonatomic, assign) CLLocationCoordinate2D coor2D;
@end

NS_ASSUME_NONNULL_END
