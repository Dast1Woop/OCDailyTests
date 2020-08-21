//
//  HTMBuildingModel+MYCategory.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/19.
//  Copyright © 2019 huatu. All rights reserved.
//

#import "HTMBuildingModel.h"
#import <Mapbox/Mapbox.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMBuildingModel (MYCategory)


/**
 把MGLPolygonFeature数组转换为HTMBuildingModel数组

 @param featuresArr MGLPolygonFeature数组
 @return HTMBuildingModel数组
 */
+ (NSArray<HTMBuildingModel*>*)getModelsArrWithFeaturesArr:(NSArray<MGLPolygonFeature*> *)featuresArr;
@end

NS_ASSUME_NONNULL_END
