//
//  HTMPoiCategory.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/7/11.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMFloorModel;

NS_ASSUME_NONNULL_BEGIN

/** poi类别 */
@interface HTMPoiCategory : NSObject<NSCoding, NSCopying>

/** 地图模型类别 */
@property(nonatomic, copy) NSString *type;

/** 类别分类-大类 */
@property(nonatomic, copy) NSString *bigCategory;

/** 类别分类-中类 */
@property(nonatomic, copy) NSString *midCategory;

/** 类别分类-小类 */
@property(nonatomic, copy) NSString *subCategory;

/// 此类别存在于 室内建筑中的哪些层。
@property (nonatomic, copy) NSArray<HTMFloorModel *> *floorModels;

@end

NS_ASSUME_NONNULL_END
