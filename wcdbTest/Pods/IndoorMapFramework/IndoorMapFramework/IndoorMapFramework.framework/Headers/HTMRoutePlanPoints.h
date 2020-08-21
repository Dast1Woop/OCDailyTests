//
//  RoutePlanPoints.h
//  IndoorMapFramework
//
//  Created by Xd Huang on 2019/2/24.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMRoutePlanNode;
NS_ASSUME_NONNULL_BEGIN

/** 为了适配后台返回格式而创建的模型 */
@interface HTMRoutePlanPoints : NSObject

/** 1.非空
 2.值只能是以下之一(19.04.10只有一种)：
 LineString，代表点组成一条线 */
@property (nonatomic, copy) NSString *type;

/** 画线点模型数组，里面的点可能不是拐点 */
@property (nonatomic, copy) NSArray<HTMRoutePlanNode *> *routePlanNodesArr;

@end

NS_ASSUME_NONNULL_END
