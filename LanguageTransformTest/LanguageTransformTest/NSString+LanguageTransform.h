//
//  NSString+LanguageTransform.h
//  LanguageTransformTest
//
//  Created by LongMa on 2021/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LanguageTransform)

/// 根据中文字符串（简体/繁体/简繁体混合），返回 @[简体字符串, 繁体字符串]
- (NSArray<NSString *> *)ca_getHansAndHantStrArr;

@end

NS_ASSUME_NONNULL_END
