//
//  NSArray+YLCategory.h
//  EnvAccess
//
//  Created by 马玉龙 on 16/5/19.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YLCategory)

- (NSArray *)removeFirstObj;
- (NSArray *)removeLastObjAndReturnArr;

/** 获取前多少个item的数组 */
- (NSArray *)ca4GetFirstNumberItems:(int)number;

@end
