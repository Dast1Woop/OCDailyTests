//
//  NSString+JinZhiConvert.h
//  UUIDTo21BitIntTest
//
//  Created by LongMa on 2020/12/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JinZhiConvert)

//计算字节长度
+(NSInteger) computeStringLength:(NSString *) string;
 
//普通字符串 转换为 二进制字符串。
+(NSString *)StingToBinary:(NSString *)string;
 
//二进制 转 普通字符串。
+ (NSString *)BinaryToNSString:(NSData *)data;
 
 
//普通字符串 转换为 十六进制字符串。
+ (NSString *)hexStringFromString:(NSString *)string;
 
// 十六进制字符串 转换为 普通字符串。
+ (NSString *)convertHexStrToString:(NSString *)hexString;
 
// 十六进制字符串 转 二进制字符串
+ (NSString *)getBinaryByhex:(NSString *)hex;
 
// 二进制 转 十六进制字符串
+ (NSString *)BinaryToHex:(NSData *)data;
 
 
//十进制 转 十六进制字符串
+ (NSString *)ToHex:(uint16_t)tmpid;
 
//  十进制字符串 转 二进制字符串
+ (NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal;
 
//  二进制字符串 转 十进制字符串
+ (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary;

//  十六进制字符串 转 十进制字符串
+ (NSString *)toDecimalSystemWithHexSystem:(NSString *)hexStr;

//获取 16 进制字符串后 bitsNum 位（eg：21位 = 1 + 4*5，后5位+倒数第6位的最后1个二进制数0/1）对应的新 16 进制字符串(注意：结果不带0x前缀！)。若originHexStr长度不足时，返回不带“0x”的originHexStr
+ (nullable NSString *)getSubHexStrWithLastBitsNum:(int)bitsNum ofOriginHexStr:(NSString *)originHexStr;
@end

NS_ASSUME_NONNULL_END
