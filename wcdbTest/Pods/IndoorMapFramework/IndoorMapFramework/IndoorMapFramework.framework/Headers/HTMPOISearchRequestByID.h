//
//  HTMPOISearchRequestByID
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 根据 行政区域id或地图id 获取POI信息,未注明“非必须”的属性必须有值
 */
@interface HTMPOISearchRequestByID : NSObject

/// 每页记录数
@property (nonatomic, assign) int pageSize;

/// 当前页码
@property (nonatomic, assign) int pageNum;

///行政区域id，与mapId只能二选一进行赋值
@property(nonatomic, copy) NSString *regionId;

/// 地图ID，一般指的是建筑id，与regionId只能二选一进行赋值
@property(nonatomic, copy) NSString *mapId;

///分类id, 非必须
@property(nonatomic, copy) NSString *type;

/// 模糊搜索关键字， 非必须
@property(nonatomic, copy) NSString *keyword;

@end

NS_ASSUME_NONNULL_END
