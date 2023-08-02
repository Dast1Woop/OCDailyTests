//
//  HTMCGetDirectionTool.h

//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <HTMCommon/HTMCDirectionResultModel.h>

@interface HTMCGetDirectionTool : NSObject

/** 用户磁偏角度转换为x正到用户方向的夹角;
magneticHeading:此刻的磁偏角大小
mapCorrectAngle:当人面向地图大门时，指南针显示的角度（北方顺时针转到手机方向的角度）
*/
+ (int) tool4GetDestiAngleOfXP2UserFromMagneticHeading:(double)magneticHeading
                                       mapCorrectAngle:(int)mapCorrectAngle;

/**
 根据A点、B点 墨卡托 坐标，当前人的磁偏角，地图纠偏角，计算出下一步或纠偏的 导航方向;
 */
+ (HTMCDirectionResultModel *)tool4GetDirArrWithCrtNodeX:(double)crtX
                               CrtNodeY:(double)crtY
                              NextNodeX:(double)nextX
                              NextNodeY:(double)nextY
                        MagneticHeading:(double)magneticHeading
                        mapCorrectAngle:(int)mapCorrectAngle;

/** （注意：用墨卡托坐标 或 经纬度弧度值（x对应经度，y对应纬度））人从AB向量 走到 BC向量，怎么转 */
+ (KNAVIGATION_DIRECTION_TYPE)tool4GetDirWithANodeX:(double)xa
                            ANodeY:(double)ya
                            BNodeX:(double)xb
                            BNodeY:(double)yb
                            CNodeX:(double)xc
                            CNodeY:(double)yc;

/** （注意：用墨卡托坐标 或 经纬度弧度值（x对应经度，y对应纬度））AB代表当前路线，CD代表下一段路线。转向指的是人从AB走向CD时，应该怎么转
 so，当判断人相对于路应该怎么转时，可以理解为人向量是AB，路向量是CD
 只有3个点是，认为B和C是同一点，即：B\C坐标一样
 */
+ (KNAVIGATION_DIRECTION_TYPE)tool4GetDirWithANodeX:(double)xa
                            ANodeY:(double)ya
                            BNodeX:(double)xb
                            BNodeY:(double)yb
                            CNodeX:(double)xc
                            CNodeY:(double)yc
                            DNodeX:(double)xd
                            DNodeY:(double)yd;

/** （注意：用墨卡托坐标 或 经纬度弧度值（x对应经度，y对应纬度））计算两个向量的夹角 角度
    GLKVector2使用时有坑，测试发现有时会计算错误，不明所以。。。
*/
+ (float)tool4CalculateTowVectorAngleOfANodeX:(double)xa
                                       ANodeY:(double)ya
                                       BNodeX:(double)xb
                                       BNodeY:(double)yb
                                       CNodeX:(double)xc
                                       CNodeY:(double)yc
                                       DNodeX:(double)xd
                                       DNodeY:(double)yd;
/** （注意：用墨卡托坐标 或 经纬度弧度值（x对应经度，y对应纬度））判断AB和CD向量夹角角度 是否小于 某个角度 */
+ (BOOL)tool4JudgeTowVectorAngleIfIsSmallerThanAngle:(float)angle
                                              ANodeX:(double)xa
                                              ANodeY:(double)ya
                                              BNodeX:(double)xb
                                              BNodeY:(double)yb
                                              CNodeX:(double)xc
                                              CNodeY:(double)yc
                                              DNodeX:(double)xd
                                              DNodeY:(double)yd;



/**
 注意：必须是 84 坐标
 */
+ (HTMCDirectionResultModel *)tool4GetDirWithMagneticHeading: (double)magneticHeading userPoint: (CLLocationCoordinate2D)userPoint endPoint: (CLLocationCoordinate2D)endPoint;

#pragma mark - new 220920
///（注意：用墨卡托坐标 或 经纬度弧度值（x对应经度，y对应纬度））获取方向、夹角； c点，在ab向量的左/右等信息
+ (HTMCDirectionResultModel *)tool4GetDirAndSoOnWithANodeX:(double)xa
                            ANodeY:(double)ya
                            BNodeX:(double)xb
                            BNodeY:(double)yb
                            CNodeX:(double)xc
                                                    CNodeY:(double)yc;

///（注意：用墨卡托坐标 或 经纬度弧度值（x对应经度，y对应纬度））获取方向、夹角； cd向量的d点，在ab向量的左/右等信息(b与c移到一点)
+ ( HTMCDirectionResultModel*)tool4GetDirAndSoOnWithANodeX:(double)xa
                            ANodeY:(double)ya
                            BNodeX:(double)xb
                            BNodeY:(double)yb
                            CNodeX:(double)xc
                            CNodeY:(double)yc
                            DNodeX:(double)xd
                                                    DNodeY:(double)yd;

@end




