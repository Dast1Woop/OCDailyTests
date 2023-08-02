//
//  NSTimer+Category.h
//  LiveGlassesService
//
//  Created by mayl on 2017/9/21.
//  Copyright © 2017年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Category)

/** 创建后记得加入 运行循环 */
+ (instancetype)ca4ScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                            block:(void(^)(void))tiemrBlock
                                          repeats:(BOOL)yesOrNo;

@end
