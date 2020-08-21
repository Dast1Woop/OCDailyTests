//
//  HTMSearchAPI.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HTMPoiCategory;
@class HTMRouteSearchRequest;
@class HTMRouteSearchResponse;

@class HTMPOISearchRequestByID;
@class HTMPOISearchRequestByLocation;
@class HTMPOISearchRequestByMultiCombine;
@class HTMPOISearchResponse;


@class HTMPOICategorySearchRequest;
@class HTMPOICategorySearchResponse;
@class HTMPOICategorySearchRequestByType;

@class HTMRegionLocationRequest;
@class HTMSubRegionsRequest;
@class HTMRegionInfoResponse;

@class HTMMenuSearchRequest;
@class HTMMenuSearchResponse;

@protocol HTMSearchDelegate;


NS_ASSUME_NONNULL_BEGIN

/**
 搜索接口管理器
 */
@interface HTMSearchAPI : NSObject

/**
 实现了 `HTMSearchDelegate` 协议的对象指针
 */
@property (nonatomic, weak) id<HTMSearchDelegate> delegateCustom;

///**
// * @brief 建筑物查询接口
// * @param request 查询选项。具体属性字段请参考 `HTMBuildingSearchRequest` 类。
// */
//- (void)HTMBuildingSearch:(HTMBuildingSearchRequest *)request;

/**
 * @brief POI分类查询接口
 * @param request  HTMPOICategorySearchRequest类对象
 */
- (void)HTMPoiCategorySearch:(HTMPOICategorySearchRequest *)request;


/**
 根据type获取POI类别

 @param request HTMPOICategorySearchRequestByType对象
 */
- (void)HTMPoiCategorySearchByType:(HTMPOICategorySearchRequestByType *)request;

/**
 * @brief 根据地图id或区域id查询POI信息
 * @param request 查询选项。具体属性字段请参考 `HTMPOISearchRequestByID` 类。
 */
- (void)HTMPOISearchByID:(HTMPOISearchRequestByID *)request;

/**
 * @brief  根据当前位置获取POI信息
 * @param request 查询选项。具体属性字段请参考 `HTMPOISearchRequestByID` 类。
 */
- (void)HTMPOISearchByLocation:(HTMPOISearchRequestByLocation *)request;


/**
 根据多种组合条件 获取POI信息

 @param request HTMPOISearchRequestByMultiCombine对象
 */
- (void)HTMPOISearchByMultiCombine:(HTMPOISearchRequestByMultiCombine *)request;

/**
 * @brief 路线查询接口
 * @param request 查询选项。具体属性字段请参考 `HTMRouteSearchRequest` 类。
 */
- (void)HTMRouteSearch:(HTMRouteSearchRequest *)request;

/**
 根据当前GPS查询所在区域列表

 @param request HTMRegionLocationRequest对象
 */
- (void)HTMRegionLocationSearch:(HTMRegionLocationRequest *)request;

/**
 根据 HTMSubRegionsRequest 获取子区域信息
 
 @param request HTMSubRegionsRequest对象
 */
- (void)HTMSubRegionsSearch:(HTMSubRegionsRequest *)request;


/// 根据当前位置获取POI菜单
/// @param request HTMMenuSearchRequest对象
- (void)HTMMenuSearch:(HTMMenuSearchRequest *)request;

@end



/**
 HTMSearchDelegate协议，定义了搜索结果的回调方法，及发生错误时的回调方法。
 */
@protocol HTMSearchDelegate <NSObject>

@optional

/**
 * @brief 请求错误回调方法
 * @param request 查询选项。
 * @param error 错误信息。
 */
- (void)HTMSearchRequest:(id)request didFailWithError:(NSError *)error;

///**
// * @brief 建筑查询回调方法
// * @param request 查询选项。具体属性字段请参考 `HTMBuildingSearchRequest` 类。
// * @param response 查询结果。具体属性字段请参考 `HTMBuildingSearchResponse` 类。
// */
//- (void)onBuildingSearchDone:(HTMBuildingSearchRequest *)request response:(HTMBuildingSearchResponse *)response;

/**
 * @brief POI分类查询回调方法
 * @param request 查询选项。具体属性字段请参考 `HTMPOICategorySearchRequest` 类。
 * @param response 查询结果。具体属性字段请参考 `HTMPoiSearchResponse` 类。
 */
- (void)onPOICategorySearchDone:(HTMPOICategorySearchRequest *)request response:(HTMPOICategorySearchResponse *)response;


/**
 根据type获取POI类别回调

 @param request HTMPOICategorySearchRequestByType对象
 @param responsePoiCategory HTMPoiCategory对象
 */
- (void)onPOICategorySearchByTypeDone:(HTMPOICategorySearchRequestByType *)request response:(HTMPoiCategory *)responsePoiCategory;

/**
 * @brief 根据id查询POI回调方法
 * @param request 查询选项。具体属性字段请参考 `HTMPOISearchRequestByID` 类。
 * @param response 查询结果。具体属性字段请参考 `HTMPOISearchResponse` 类。
 */
- (void)onPOISearchDoneByID:(HTMPOISearchRequestByID *)request response:(HTMPOISearchResponse *)response;

/**
 * @brief 根据Location查询POI回调方法
 * @param request 查询选项。具体属性字段请参考 `HTMPOISearchRequestByLocation` 类。
 * @param response 查询结果。具体属性字段请参考 `HTMPOISearchResponse` 类。
 */
- (void)onPOISearchDoneByLocation:(HTMPOISearchRequestByLocation *)request response:(HTMPOISearchResponse *)response;


/**
 
 根据多种组合条件 获取POI信息 异步回调
 @param request HTMPOISearchRequestByMultiCombine 对象
 @param response HTMPOISearchResponse 对象
 */
- (void)onPOISearchDoneByMultiCombine:(HTMPOISearchRequestByMultiCombine *)request response:(HTMPOISearchResponse *)response;

/**
 * @brief 路线回调方法
 * @param request 查询选项。具体属性字段请参考 `HTMRouteSearchRequest` 类。
 * @param response 查询结果。具体属性字段请参考 `HTMRouteSearchResponse` 类。
 */
- (void)onRouteSearchDone:(HTMRouteSearchRequest *)request response:(HTMRouteSearchResponse *)response;


/**
 根据当前GPS获取所在区域列表 结果

 @param request HTMRegionLocationRequest 请求对象
 @param responseArr HTMRegionLocationResponse对象组成的数组
 */
- (void)onRegionLocationSearchDone:(HTMRegionLocationRequest *)request responseArray:(NSArray<HTMRegionInfoResponse *> *)responseArr;

/**
 根据区域id 获取树状区域
 
 @param request HTMRegionLocationRequest 请求对象
 @param responseArr HTMRegionLocationResponse对象组成的数组
 */
- (void)onSubRegionsSearchDone:(HTMSubRegionsRequest *)request responseArray:(NSArray<HTMRegionInfoResponse *> *)responseArr;


/// 根据当前位置获取POI菜单结果
/// @param request HTMMenuSearchRequest请求对象
/// @param response HTMMenuSearchResponse响应对象
- (void)onMenuSearchDone:(HTMMenuSearchRequest *)request
                response:(HTMMenuSearchResponse *)response;

@end

NS_ASSUME_NONNULL_END
