//
//  HTMIndoorMapView+MYMapDelegate.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/4.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <IndoorMapFramework/IndoorMapFramework.h>

NS_ASSUME_NONNULL_BEGIN
@interface HTMIndoorMapView (MYMapDelegate)

@end

@protocol HTMIndoorMapDelegate <NSObject>

@required
/**
 注意：POIQuery初始化必须在此方法内/之后执行
 当mapbox的didFinishLoadingStyle回调成功触发后，回调此方法。
 建议在此方法中蒙版提示”地图加载成功“
 @param indoorMapView 包含MGLMapView *mapView属性的HTMIndoorMapView类型的indoorMapView
 **/
- (void)htmIndoorMapViewDidFinishLoading:(HTMIndoorMapView *)indoorMapView;

@optional


/**
 地图点击事件, point:the CGPoint where the user tapped.

 @param indoorMapView HTMIndoorMapView对象
 @param feature 如果isFeature为YES，feature为包含完整信息的地图feature数据；否则，为nil。
 @param isFeature 点击地图获取的是否是有效的feature数据
 @param coor 地图点击点对应的经纬度坐标
 */
-(void)htmIndoorMapView:(HTMIndoorMapView *)indoorMapView
featureOrMapDidSelected:(MGLPolygonFeature * _Nullable)feature
              isFeature:(BOOL)isFeature
            featureCoor:(CLLocationCoordinate2D)coor DEPRECATED_MSG_ATTRIBUTE("推荐使用 htmMapView: featuresArray:");

/// 地图点击事件，适用于大地图室内外poi、线路、面模型点击事件
/// @param mapView HTMMapView对象
/// @param featuresArr 包含poi、线路、面模型的数组
/// @param coor 触摸点经纬度，不一定需要使用，poi/模型坐标可通过featuresArr获取，获取不到才可能使用此属性
-(void)htmMapView:(HTMIndoorMapView *)mapView
visibleFeaturesInTouchedRect:(NSArray *)featuresArr
        touchCoor:(CLLocationCoordinate2D)coor;



/**
  建筑/楼层 切换事件

 @param indoorMapView HTMIndoorMapView对象
 @param floorM 楼层模型
 @param buildingM 建筑模型
 */
-(void)htmIndoorMapView:(HTMIndoorMapView *)indoorMapView
         didSelectFloor:(HTMFloorModel *)floorM
               building:(HTMBuildingModel *)buildingM;


@end

NS_ASSUME_NONNULL_END
