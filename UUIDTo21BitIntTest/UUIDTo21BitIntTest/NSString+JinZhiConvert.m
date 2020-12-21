//
//  NSString+JinZhiConvert.m
//  UUIDTo21BitIntTest
//
//  Created by LongMa on 2020/12/18.
//

#import "NSString+JinZhiConvert.h"

@implementation NSString (JinZhiConvert)
//计算字节长度
+(NSInteger) computeStringLength:(NSString *)string{
    
    NSInteger length = [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    //    length -= (length - string.length) / 2;
    //    length = (length +1) / 2;
    
    return length;
    
}
 
 
//普通字符串转换为二进制。
+(NSString *)StingToBinary:(NSString *)string{
    
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    
    return [self getBinaryByhex:hexStr];
    
}
 
 
//普通字符串转换为十六进制。
+ (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}
 
 
// 十六进制转换为普通字符串。
+ (NSString *)convertHexStrToString:(NSString *)hexString{
    if (!hexString || [hexString length] == 0) {
        return nil;
    }
    NSLog(@"line : %d, func: %s ",__LINE__, __func__);
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[[NSScanner alloc] initWithString:hexCharStr] init];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    //NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString;
}
 
 
// 十六进制转二进制
+(NSString *)getBinaryByhex:(NSString *)hex
{
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [hexDic setObject:@"0000" forKey:@"0"];
    [hexDic setObject:@"0001" forKey:@"1"];
    [hexDic setObject:@"0010" forKey:@"2"];
    [hexDic setObject:@"0011" forKey:@"3"];
    [hexDic setObject:@"0100" forKey:@"4"];
    [hexDic setObject:@"0101" forKey:@"5"];
    [hexDic setObject:@"0110" forKey:@"6"];
    [hexDic setObject:@"0111" forKey:@"7"];
    [hexDic setObject:@"1000" forKey:@"8"];
    [hexDic setObject:@"1001" forKey:@"9"];
    [hexDic setObject:@"1010" forKey:@"A"];
    [hexDic setObject:@"1011" forKey:@"B"];
    [hexDic setObject:@"1100" forKey:@"C"];
    [hexDic setObject:@"1101" forKey:@"D"];
    [hexDic setObject:@"1110" forKey:@"E"];
    [hexDic setObject:@"1111" forKey:@"F"];
    [hexDic setObject:@"1010" forKey:@"a"];
    [hexDic setObject:@"1011" forKey:@"b"];
    [hexDic setObject:@"1100" forKey:@"c"];
    [hexDic setObject:@"1101" forKey:@"d"];
    [hexDic setObject:@"1110" forKey:@"e"];
    [hexDic setObject:@"1111" forKey:@"f"];
    NSMutableString *binaryString=[[NSMutableString alloc] init];
    
    for (int i=0; i<[hex length]; i++) {
        NSRange rage;
        rage.length = 1;
        rage.location = i;
        NSString *key = [hex substringWithRange:rage];
        binaryString = [NSMutableString stringWithFormat:@"%@%@",binaryString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
    }
    return binaryString;
}
 
 
//十进制转十六进制
+ (NSString *)ToHex:(uint16_t)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    uint16_t ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    return str;
}
 
 
//  十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal
{
    int num = [decimal intValue];
    int remainder = 0;      //余数
    int divisor = 0;        //除数
    
    NSString * prepare = @"";
    
    while (true)
    {
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%d",remainder];
        
        if (divisor == 0)
        {
            break;
        }
    }
    
    NSString * result = @"";
    for (int i = (int)prepare.length - 1; i >= 0; i --)
    {
        result = [result stringByAppendingFormat:@"%@",
                  [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    
    return result;
}
//  二进制转十进制
+ (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary
{
    int ll = 0 ;
    int  temp = 0 ;
    for (int i = 0; i < binary.length; i ++)
    {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    
    return result;
}
 
 
//二进制转十六进制
+ (NSString *)BinaryToHex:(NSData *)data {
    if (!data) {
        return nil;
    }
    
    NSString * binary=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [hexDic setObject:@"0" forKey:@"0000"];
    [hexDic setObject:@"1" forKey:@"0001"];
    [hexDic setObject:@"2" forKey:@"0010"];
    [hexDic setObject:@"3" forKey:@"0011"];
    [hexDic setObject:@"4" forKey:@"0100"];
    [hexDic setObject:@"5" forKey:@"0101"];
    [hexDic setObject:@"6" forKey:@"0110"];
    [hexDic setObject:@"7" forKey:@"0111"];
    [hexDic setObject:@"8" forKey:@"1000"];
    [hexDic setObject:@"9" forKey:@"1001"];
    [hexDic setObject:@"A" forKey:@"1010"];
    [hexDic setObject:@"B" forKey:@"1011"];
    [hexDic setObject:@"C" forKey:@"1100"];
    [hexDic setObject:@"D" forKey:@"1101"];
    [hexDic setObject:@"E" forKey:@"1110"];
    [hexDic setObject:@"F" forKey:@"1111"];
    
    NSMutableString *hexString=[[NSMutableString alloc] init];
    
    for (int i=0; i<[binary length]; i+=4) {
        NSRange rage;
        rage.length = 4;
        rage.location = i;
        NSString *key = [binary substringWithRange:rage];
        hexString = [NSMutableString stringWithFormat:@"%@%@",hexString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
    }
    
    return hexString;
}
 
 
//二进制转字符串
+ (NSString *)BinaryToNSString:(NSData *)data {
    
    NSString * str=[self BinaryToHex:data];
    
    NSString *tmp=[self convertHexStrToString:str];
    
    return tmp;
}

+ (NSString *)getSubHexStrWithLastBitsNum:(int)bitsNum ofOriginHexStr:(NSString *)originHexStr{
    NSString *lStr = nil;
    if ([originHexStr hasPrefix:@"0x"]
        ||[originHexStr hasPrefix:@"0X"]) {
        if (originHexStr.length <= 2) {
            return  nil;
        }
        lStr = [originHexStr substringFromIndex:2];
    }
    
    NSUInteger length = lStr.length;
    if (bitsNum >= length * 4) {
        return lStr;
    }
    
    int notChangeLastNums = bitsNum / 4;
    NSString *lNotChangeLastStr = [lStr substringWithRange:(NSMakeRange(lStr.length - notChangeLastNums, notChangeLastNums))];
    NSString *lSpecialOneCha = [lStr substringWithRange:NSMakeRange(lStr.length - notChangeLastNums - 1, 1)];
    
    //附加的需截取的字符数
    int lChaNum4Append = bitsNum % 4;
    NSString *lBinaryStr = [self getBinaryByhex:lSpecialOneCha];
    NSString *lCha4Append = [lBinaryStr substringWithRange:NSMakeRange(4 - lChaNum4Append, lChaNum4Append)];
    
    //不足4位，前位补0
    for (int i = 0; i < 4 - lChaNum4Append; i++) {
        lCha4Append = [@"0" stringByAppendingString:lCha4Append];
    }
    NSData *lData = [lCha4Append dataUsingEncoding:(NSUTF8StringEncoding)];
    NSString *lHexStr4AtFirst = [NSString BinaryToHex:lData];
    
    return [lHexStr4AtFirst stringByAppendingString:lNotChangeLastStr];
}

@end
