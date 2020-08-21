//
//  IndoorMapView.h
//  IndoorMap
//
//  Created by Xd Huang on 2019/1/22.
//  Copyright © 2019 Xd Huang. All rights reserved.

/**
 地图类
 @warning 外界控制器需要指定mapview属性的delegate时，不能直接对delegate赋值，会导致本类中mapbox相关代理方法无法被触发，楼层选择器无法显示等严重问题。必须使用下面类似方法（即：使用HTMIndoorMapView对象的mapView调用用addMultiDelegate方法），保证sdk内部和外部mapbox代理方法都可以被回调：
 
    [self.indoorMapView.mapView addMultiDelegate:self];
 */
#import <UIKit/UIKit.h>
#import <Mapbox/Mapbox.h>
#import <CoreLocation/CoreLocation.h>
@class HTMFloorModel;
@class HTMRoutePath;
@class HTMPoi;
@class HTMBuildingModel;

@protocol HTMIndoorMapDelegate;
NS_ASSUME_NONNULL_BEGIN

@interface HTMIndoorMapView : UIView<MGLMapViewDelegate>

/// 共3种类型：测试版、beta版、正式版
@property(nonatomic, copy) NSString *sdkType;

///代理对象
@property (nonatomic, weak)id <HTMIndoorMapDelegate> delegateCustom;

/** 楼层切换控件*/
@property (nonatomic, strong) UIPickerView *floorPickerView;

/**
 内置mapbox的MGLMapView
 */
@property (nonatomic, strong) MGLMapView *mapView;

/** 当前显示楼层配置 */
//@property (nonatomic, strong) HTMFloorConfig *currentFloorCfg;

/** 当前显示楼层id */
@property (nonatomic, assign) int floorIDMapShowing;

///当前定位楼层id
@property (nonatomic, assign) int floorIDLocated;

///获取模型时，触摸点作为查询矩形中心时的矩形范围宽度，如不设置，默认为40个点。
@property (nonatomic, assign) float pickFeatureRectWidth;

///获取模型时，触摸点作为查询矩形中心时的矩形范围高度，如不设置，默认为40个点。
@property (nonatomic, assign) float pickFeatureRectHeight;

///是否隐藏点击地图时的点注释，默认为NO，需要隐藏或自定义时，设置为YES
@property (nonatomic, assign) BOOL isHidePointAnnotationWhenTapMap;

///是否有路径正在显示,可以用于判断是否已规划路径
@property (nonatomic, assign) BOOL isRoutePathShowing;

/** 是否可选中模型 */
@property (nonatomic, assign, getter=isCanSelectFeatureOnMap) BOOL canSelectFeatureOnMap;

/// 判断当前屏幕中心区域，是否显示了无遮罩的室内建筑。kvo对此属性无效。如需监听值是否改变，可以 重写- (void)mapView:(MGLMapView *)mapView regionDidChangeAnimated:(BOOL)animated，并再里面获取此属性的值。
@property (nonatomic, assign) BOOL isIndoorBuildingShowing;

///当前地图自动显示的或通过建筑选择器选中显示的 建筑模型，不一定是距离屏幕中心点最近的模型。室内搜索 功能，需使用此建筑模型的buildingID。
@property(nonatomic, strong) HTMBuildingModel *buildingModelMapShowing;

/// 距离屏幕中心点最近的建筑,跟buildingModelMapShowing可能不是同一个建筑。
@property(nonatomic, strong) HTMBuildingModel *gNearestBuildingModel;

///当前地图显示的楼层模型，包含楼层id和楼层名
@property(nonatomic, strong) HTMFloorModel *floorModelMapShowing;

/// 当前屏幕特定可见区域包含HTMFloorConfig*对象的楼层数组
@property (nonatomic, copy) NSArray<HTMFloorModel*> *floorConfigsArr;

/// 当前屏幕特定可见区域包含HTMBuildingModel*对象的 建筑数组,已根据与屏幕中心点距离由近到远排序
@property (nonatomic, copy) NSArray<HTMBuildingModel*> *buildingModelsArrSorted;

///气泡点数组，默认每点击一次地图，就会往地图上打一个点，并往此数组中加入对应对象
@property(nonatomic, strong, nullable) NSMutableArray *gArrM4CalculateAnnotationViews;


#pragma mark -  methods

/// 通过themeID改变地图主题。地图init时，会自动设置为默认主题：0000
/// 0000 默认主题；1001 杭州专用主题
/// @param themeID 主题ID
- (void)changeMapWithThemeID:(NSString *)themeID;

/// 在屏幕可视范围内，通过楼层id，建筑id切楼层和建筑
/// @param floorID 楼层id
/// @param buildingID 建筑id
- (void)selectFloorID:(int)floorID buildingIDInCurrentScreenArea:(NSString *)buildingID;

/**
 显示规划的路径
 @param routePath HTMRoutePath对象
 @return NSError对象，为nil时代表显示路线成功，否则失败
 */
-(NSError *)showRoutePath:(HTMRoutePath *)routePath;



/**
 更新用户走过的路径为灰色，每次有新坐标时，都要调用此方法更新灰色路径。
 
 @param pathNumber 投影点所在路段在整个路径规划所有路段中的编号
 @param crtCoor 投影点坐标
 @return NSError对象
 */
- (NSError *)updateRoutePathUserWalkedWithPathNumber:(int)pathNumber
                                        crtCoor:(CLLocationCoordinate2D)crtCoor;

/** 置空routePath数据源 并 隐藏规划路径图层 */
-(void)clearRoutePath;

///清空mapview中所有 点注释
-(void)clearAllPointAnnotations;


/**
 添加一个 点注释 到mapview

 @param coor 添加点注释所在的经纬度
 */
- (void)addOnePointAnnotationToMapViewWithCoor:(CLLocationCoordinate2D)coor;

/** 显示盲道 */
- (void)showBlindRoad;

/** 隐藏盲道 */
- (void)hideBlindRoad;

/** 显示轮椅通道 */
- (void)showWheelChairRoad;

/** 隐藏轮椅通道 */
- (void)hideWheelChairRoad;

/**
 使feature高亮显示为红色,其他feature被重置为初始颜色
 @param feature MGLPolygonFeature对象
 */
- (void)highlightFeatureToRedColor:(MGLPolygonFeature *)feature;

/**
 通过传入featureID,使feature高亮显示为红色,其他feature被重置为初始颜色

 @param featureID featureID，具有唯一性
 */
- (void)highlightFeatureToRedColorWithFeatureID:(NSString *)featureID;
    
/**
 使feature高亮显示为指定颜色,其他feature被重置为初始颜色

 @param feature MGLPolygonFeature对象
 @param color 颜色，UIColor对象
 */
- (void)highlightFeature:(MGLPolygonFeature *)feature withColor:(UIColor *)color;


/**
 通过传入featureID,使feature高亮显示为指定颜色,其他feature被重置为初始颜色

 @param featureID featureID
 @param color 颜色，UIColor对象
 */
- (void)highlightFeatureWithFeatureID:(NSString *)featureID withColor:(UIColor *)color;


/**
  重置所有模型颜色
 */
- (void)resetAllFeaturesColor;


/**
 判断图层是否属于室内图层

 @param layerID 图层id
 @return YES：是；NO：不是
 */
- (BOOL)judgeIsIndoorLayers:(NSString *)layerID;


/**
 用于外界重置楼层选择器被选中楼层label的样式。当选择器被选中楼层样式错乱时，建议在控制器的viewDidAppear中调用此方法。
 */
- (void)resetColorToSeletedFloorPickersLabel;
    
    
//start:--------暴露以用于分类中-----------

/// 建筑按钮
@property(nonatomic, strong) UIButton *gBtn4Building;

///键：layerID，值：predicate
@property (nonatomic, copy) NSDictionary *gDicDefalutPredict4IndoorLayers;

///当前交叉建筑区域的建筑按钮是否被点击过。当交叉建筑区发生变化时，此属性会被重置为NO
@property (nonatomic, assign) BOOL isBtn4BuildingClickedInCrtCrossedArea;

- (void)pmy_addPolylineToStyle:(MGLStyle *)style;
- (void)pmy_addWalkedPathPolylineToStyle:(MGLStyle *)style;

/**
 给楼层选择器被选中的标签设置颜色等样式
 
 @param lLbl 标签
 */
- (void)setColorAndSoOn2FloorPikerLbl:(UILabel *)lLbl;
//end:--------暴露以用于分类中-----------

@end

NS_ASSUME_NONNULL_END
