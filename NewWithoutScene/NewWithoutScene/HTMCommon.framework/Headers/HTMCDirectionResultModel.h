//
//  HTRadianTypeModel.h

//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, KNAVIGATION_DIRECTION_TYPE) {
    kGoFront = 0,//直行，人与路夹角(0,pi/8)
    kGoRightFront,//右前方直行,人与路夹角(pi/8,3*pi/8)
    kGoRight,//右转,人与路夹角(3*pi/8,5*pi/8)
    kGoRightSharp,// (5/8*pi, 7/8*pi)
    
    kGoBack,//掉头,人与路夹角(3*pi/4,pi)
    
    kGoLeftFront,//左前方直行,人与路夹角(pi/8,3*pi/8)
    kGoLeft,//左转,人与路夹角(3*pi/8,5*pi/8)
    kGoLeftSharp, // (5/8*pi, 7/8*pi)
    
    kGoUpFloor,//上行
    KGoDownFloor//下行
};

typedef NS_ENUM(NSUInteger, KPERSON_POSITION) {
    KPERSON_POSITION_AT_LEFT = 0,//人在路的左边
    KPERSON_POSITION_AT_RIGHT//人在路的右边
};


NS_ASSUME_NONNULL_BEGIN

@interface HTMCDirectionResultModel : NSObject
@property(nonatomic, assign) KNAVIGATION_DIRECTION_TYPE type;
@property(nonatomic, strong) NSNumber * gNum4Angle;

@property (nonatomic, assign) KPERSON_POSITION gPersonPosition;

@end

NS_ASSUME_NONNULL_END
