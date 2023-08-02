//
//  NSDate+Category.h
//  logToolTest
//
//  Created by 马玉龙 on 16/8/8.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)ca4IsThisYear;

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)ca4IsYesterday;

/**
 *  判断某个时间是否为今天
 */
- (BOOL)ca4IsToday;


/**
 判断本对象与参数对象是否是同一天
是否是同一天，判断方法不完备，在东8区是同天的，在0时区可能不是
 请使用框架里方法 mt_isWithinSameDay
 @return 是否是同一天，注意：使用此方法需判断date是否为空，如果为空，看需求设置是否应该是同一天。
 */
//- (BOOL)ca4IsSameDayWithDate:(NSDate *)date;

/** 根据时间格式返回字符时间 */
- (NSString *)ca4Date2StringWithDateFormat:(NSString *)format;

#pragma mark -  类方法
/** 根据时间格式和时间字符串 返回NSDate对象。返回的是当前时区对应时间。 */
+ (instancetype)dateWithFormat:(NSString *)format time:(NSString *)time;

/** 当前时区时间 */
+ (instancetype)date4CrtZone;

/**
 *  两个参数的格式要保持一致
 *
 *  @param destiDateStr 目标时间
 *  @param dateFmt      时间格式
 *
 */
+ (instancetype)date4CrtZoneFromDateStr:(NSString *)destiDateStr
                            withDateFmt:(NSString *)dateFmt;

/** 单独选择时间时，NSDate分类默认拼接的日期是2000-01-01，时间是零时区；而时间选择器默认日期是今天，时间也是零时区时间，导致时间比较时，出现“开始时间对象为2010年的，而时间选择器默认是今天，没有了可比性！”
 解决办法：nsdate分类方法生成的日期改为今天:如果是2000年，改为今天;为1999年，改为今天前一天的年月日。
 */
+ (NSDate *)ca4GetCrtDateWithNoYearGrntedDate:(NSDate *)date;

/** 把 非空的日期对象 年月日换成今天 */
+ (NSDate *)ca4ReplaceDateWithTodayYearMonthDay:(NSDate *)date;

/** 根据时间戳，返回对应格式的时间*/
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
@end
