//
//  HTMBuildingModel.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/14.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMFloorModel;
NS_ASSUME_NONNULL_BEGIN

@interface HTMBuildingModel : NSObject

/// 建筑id
@property(nonatomic, copy) NSString *buildingID;

/// 默认的建筑名
@property(nonatomic, copy) NSString *buildingNameDefalut;

/// 建筑简体名
@property(nonatomic, copy) NSString *buildingNameSimple;

/// 建筑繁体名
@property(nonatomic, copy) NSString *buildingNameTraditional;

/// 建筑英文名
@property(nonatomic, copy) NSString *buildingNameeEnglish;

///经度
@property(nonatomic, assign) double lng;

///纬度
@property(nonatomic, assign)  double lat;

/// 距离某个点的距离，方便计算
@property(nonatomic, strong) NSNumber *distance2SomeCoor;

///显示最小比例，当大于此比例时，才显示建筑选择器
@property(nonatomic, assign) int minZoom;

///显示最大比例，当小于此比例时，才显示建筑选择器
@property(nonatomic, assign) int maxZoom;

///默认显示的楼层id
@property(nonatomic, assign)  int defaultFloorID;

///楼层信息数组
@property(nonatomic, copy) NSArray<HTMFloorModel*> *floorModelsArr;

/// 建筑绑定的与当前建筑有水平交叉的建筑id数组。包含当前建筑id。
@property (nonatomic, copy) NSArray<NSString *> *crossBuildingIDsArr;


/**
  根据参数获取buildingID对应模型的crossBuildingIDsArr属性数组
 @param buildingID 建筑id
 @param buildingModelsArr 所有建筑模型数组
 @return 建筑id对应的crossBuildingIDsArr属性数组
 */
+ (NSArray<NSString *> *)getCrossBuildingIDsArrWithBuildingID:(NSString *)buildingID
                                            buildingModelsArr:(NSArray *)buildingModelsArr;


/**
 通过建筑id和建筑模型数组，获取建筑id对应的建筑模型
 @param buildingID 建筑id
 @param arr 建筑模型数组
 @return 建筑模型
 */
+ (instancetype)getModelWithBuildingID:(NSString *)buildingID
                       inBuildingMsArr:(NSArray<HTMBuildingModel *>*)arr;

@end

NS_ASSUME_NONNULL_END
