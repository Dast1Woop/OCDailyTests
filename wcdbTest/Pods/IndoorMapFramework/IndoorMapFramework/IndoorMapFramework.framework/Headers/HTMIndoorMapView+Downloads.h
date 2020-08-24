//
//  HTMIndoorMapView+Downloads.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/4/28.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <IndoorMapFramework/IndoorMapFramework.h>
@class HTMRoadNetModel;
NS_ASSUME_NONNULL_BEGIN

@interface HTMIndoorMapView (Downloads)

/**
 根据地图id获取路网信息

 @param areaID 地图id
 @param downProgressBlcok 下载进度回调
 @param successBlcok 成功回调
 @param failureBlcok 失败回调
 */
+ (void)getRoadNetInfoWithAreaID:(NSString *)areaID
                        progress:(void (^)(NSProgress * _Nonnull))downProgressBlcok
                    successBlcok:(void (^)(NSURLSessionDataTask *_Nonnull task, NSArray<HTMRoadNetModel *>* roadNetModelsArr))successBlcok
                    failureBlcok:(void (^)(NSURLSessionDataTask *_Nonnull task, NSError *error))failureBlcok;
@end

NS_ASSUME_NONNULL_END

