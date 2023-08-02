//
//  NSArray+YLCategory.h
//  EnvAccess
//
//  Created by 马玉龙 on 16/5/19.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YLCategory)


/// @warning 一定要接收返回的数组
- (NSArray *)ca4RemoveFirstObjByReturnNewUnmutableArr;

/// @warning 一定要接收返回的数组
- (NSArray *)ca4RemoveLastObjByReturnNewUnmutableArr;

/** 获取前多少个item的数组 */
- (NSArray *)ca4GetFirstNumberItems:(int)number;

/// @warning 一定要接收返回的数组;且使用前判定数组是否为nil
- (NSArray *)ca4AddItem:(id)item;

@end
