//
//  HTMRoadNetModel.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/4/28.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 路网线段模型
@interface HTMRoadNetModel : NSObject

#pragma mark -  常用
///起点x坐标
@property(nonatomic, copy) NSString *startX;
    
//////起点y坐标
@property(nonatomic, copy) NSString *startY;
    
///终点x坐标
@property(nonatomic, copy) NSString *endX;
    
///终点y坐标
@property(nonatomic, copy) NSString *endY;

/** 路宽 */
@property(nonatomic, copy) NSString *width;

/** 楼层名字 */
@property(nonatomic, copy) NSString *floorName;
    
///版本号
@property(nonatomic, copy) NSString *version;

#pragma mark -  不常用
///地图id
@property(nonatomic, copy) NSString *mapId;
    
///地图名
@property(nonatomic, copy) NSString *mapName;
    
///起点z坐标
@property(nonatomic, copy) NSString *startZ;
    
///起点经度
@property(nonatomic, copy) NSString *startLog;
    
///起点纬度
@property(nonatomic, copy) NSString *startLat;
    
///终点z坐标
@property(nonatomic, copy) NSString *endZ;
    
///终点经度
@property(nonatomic, copy) NSString *endLog;
    
///终点纬度
@property(nonatomic, copy) NSString *endLat;
    
///路网长度
@property(nonatomic, copy) NSString *length;


@end

NS_ASSUME_NONNULL_END
