//
//  UIFont+TJCategory.h
//  TJMapKitDevJoin
//
//  Created by LongMa on 2018/9/12.
//  Copyright © 2018年 tongji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (TJCategory)

+ (NSAttributedString *)ca4Setup2String:(NSString *)text oneHighlightText:(NSString *)highlightText;
+ (NSAttributedString *)ca4Setup2String:(NSString *)text highlightTextArr:(NSArray *)strArr;

@end
