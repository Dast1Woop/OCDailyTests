//
//  RoutePath.h
//  IndoorMapFramework
//
//  Created by Xd Huang on 2019/2/24.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMRoutePlanNode;
@class HTMRoutePlanInstruction;

NS_ASSUME_NONNULL_BEGIN

/** 总路径相关模型 */
@interface HTMRoutePath : NSObject

/** 路径总长，单位为米。保留1位小数 */
@property (nonatomic) float distance;

/** 上坡总长，单位为米。保留1位小数 */
@property (nonatomic) float ascend;

/** 下坡总长，单位为米。保留1位小数 */
@property (nonatomic) float descend;

/** 路径总时长，单位为毫秒 */
@property (nonatomic) long time;

/** 路径上用于画线的所有点模型的集合 */
@property (nonatomic, copy) NSArray<HTMRoutePlanNode*> *pointsArr;

/** 路径上指示数组，一个指示可能对应多个画线点。定位拐点：每条指示的起点和终点 */
@property (nonatomic, copy) NSArray<HTMRoutePlanInstruction*> *instructions;
@end

NS_ASSUME_NONNULL_END
