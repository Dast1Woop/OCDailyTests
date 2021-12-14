//
//  NSString+LanguageTransform.m
//  LanguageTransformTest
//
//  Created by LongMa on 2021/12/14.
//

#import "NSString+LanguageTransform.h"

@implementation NSString (LanguageTransform)

- (NSArray<NSString *> *)ca_getHansAndHantStrArr {
    NSString *hantStr = [self stringByApplyingTransform:@"hans-hant" reverse:NO];
    NSString *hansStr = [hantStr stringByApplyingTransform:@"hant-hans" reverse:NO];
    return @[hansStr, hantStr];
}

@end
