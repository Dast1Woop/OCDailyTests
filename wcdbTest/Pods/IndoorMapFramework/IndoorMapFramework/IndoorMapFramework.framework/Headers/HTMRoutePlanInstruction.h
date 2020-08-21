//
//  RoutePlanInstruction.h
//  IndoorMapFramework
//
//  Created by Xd Huang on 2019/2/24.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMRoutePlanNode;

NS_ASSUME_NONNULL_BEGIN

@interface HTMRoutePlanInstruction : NSObject

/**
 获取路径规划信息
 值    说明    示意图标    备注
 -99
 未知
 UNKNOWN
 
 -98
 未知U型拐弯
 U_TURN_UNKNOWN
 
 -8    U_TURN_LEFT
 -7
 保持向左
 KEEP_LEFT
 
 -3
 左急转
 TURN_SHARP_LEFT
 偏角约大于103度
 -2
 左转
 TURN_LEFT
 偏角约40~103度
 -1
 偏左转
 TURN_SLIGHT_LEFT
 偏角约11~40度
 0
 继续
 CONTINUE
 偏角约小于11度
 1
 偏右转
 TURN_SLIGHT_RIGHT
 偏角约11~40度
 2
 右转
 TURN_RIGHT
 偏角约40~103度
 3
 右急转
 TURN_SHARP_RIGHT
 偏角约大于103度
 4
 终点到达
 FINISH
 
 5
 途径
 REACHED_VIA
 
 6
 拐弯
 USE_ROUNDABOUT
 
 7
 保持向右
 KEEP_RIGHT
 
 8
 U型向右拐弯
 U_TURN_RIGHT
 
 以下是自定义类型
 200
 步行楼梯向上
 UP_stair
 暂无
 201
 步行楼梯向下
 DOWN_stair
 暂无
 210
 乘坐自动扶梯向上
 UP_escalator
 暂无
 211
 乘坐自动扶梯向下
 DOWN_escalator
 暂无
 220
 乘坐电梯向上
 UP_elevator
 暂无
 221
 乘坐电梯向下
 DOWN_elevator
 暂无
 以下是无障碍类别
 300    步行无障碍楼梯向上    暂无
 301    步行无障碍楼梯向下    暂无
 310    乘坐无障碍自动扶梯向上    暂无
 311    乘坐无障碍自动扶梯向下    暂无
 320    乘坐无障碍电梯向上    暂无
 321
 乘坐无障碍电梯向下
 
 暂无
 无障碍类别结束
 500
 继续步行到xx
 continue_walk_onto
 
 偏角约小于11度
 */
@property (nonatomic) int sign;

/** 导航文字描述 */
@property (nonatomic, copy) NSString *text;

/** 距离，单位为米。保留1位小数 */
@property (nonatomic) float distance;

/** 时间，单位为毫秒 */
@property (nonatomic) long time;

/** 方向角。取整
 Headings are given as north based clockwise angle between 0 and 360 degree. */
@property (nonatomic) float heading;

/** 数组中两元素 对应HTMRoutePath对象的pointsArr 数组的下标，方便判断是哪个段的点。如[0,2]表示pointsArr[0], pointsArr[1], pointsArr[2]*/
@property (nonatomic, copy) NSArray<NSString*> *interval;

/** 地图（建筑）id */
@property(nonatomic, copy) NSString *mapId;

/** 楼层id */
@property (nonatomic, copy) NSString *floorId;

/** 路段名称 */
@property (nonatomic, copy) NSString *name;

/** 当前路段 起点,定位拐点为指示的起点或终点 */
@property(nonatomic, strong) HTMRoutePlanNode *startNode;

/** 当前路段 终点，定位拐点为指示的起点或终点 */
@property(nonatomic, strong) HTMRoutePlanNode *endNode;

///路径号码：路径规划成功后，每段路径会被编号，从0开始。
@property (nonatomic, assign) int pathNumber;

@end

NS_ASSUME_NONNULL_END
