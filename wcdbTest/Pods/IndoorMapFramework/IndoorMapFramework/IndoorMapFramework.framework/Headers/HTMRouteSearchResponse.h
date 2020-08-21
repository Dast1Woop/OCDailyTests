//
//  HTMRouteSearchResponse.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMRoutePaths;

NS_ASSUME_NONNULL_BEGIN

@interface HTMRouteSearchResponse : NSObject

///路径信息
@property(nonatomic, strong) HTMRoutePaths *routePaths;


/**
 类方法创建对象

 @param routePaths HTMRoutePaths对象
 @return HTMRouteSearchResponse对象
 */
+ (instancetype)responseWithRoutePaths:(HTMRoutePaths *)routePaths;
@end

NS_ASSUME_NONNULL_END
