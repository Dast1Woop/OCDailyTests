//
//  NSString+Category.h
//  logToolTest
//
//  Created by 马玉龙 on 16/8/8.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

/** 拼接到特定路径后面 */
- (NSString *)ca4AppendDocumentPath;
- (NSString *)ca4AppendCachePath;
- (NSString *)ca4AppendTempPath;

- (BOOL)isNotNullAndNotEmpty;


/// 验证手机号格式是否正确,创建于191112
- (BOOL)checkIsPhoneNumber;

/** 根据字体返回文本size */
- (CGSize)ca4SizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)ca4SizeWithFont:(UIFont *)font;

+ (NSString *)string4DocumentsPath;

/** doc文件目录下加上文件名来创建doc下名为fileName的路径 */
+ (NSString *)string4FilePathAtDocWithAppendingFileName:(NSString *)fileName;

/** NSNumber转为NSString */
+ (instancetype)string4GetStrFromNumber:(NSNumber *)number;

/** 获取当前手机系统语言 */
+ (NSString *)string4GetCurrentPhoneLanguage;

+ (NSString *)string4GetBinaryStrWithDecimalStr:(NSString *)decimal;

- (void)toiConsole;
- (void)toiConsoleWarning;
- (void)toiConsoleError;

//如果米数大于1000，返回xkm(%.1f);0m时,返回@"";否则，返回xm
+ (NSString *)getDistanceStrWithMeters:(unsigned int)meter;
@end
