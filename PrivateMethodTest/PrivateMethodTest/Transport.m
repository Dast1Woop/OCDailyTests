//
//  Transport.m
//  PrivateMethodTest
//
//  Created by LongMa on 2022/8/25.
//

#import "Transport.h"

@implementation Transport

- (instancetype)init{
    if (self = [super init]) {
        [self p_transportSomething];
        
        [self pTs_description];
    }
    return self;
}

///❌，p开头难以避免与父类方法同名:  OC 的私有方法并不安全，会被子类同名方法覆盖，因此最好保持私有方法命名唯一，否则没意识到被子类同名方法覆盖，会导致莫名bug，且难以调试；
- (void)p_transportSomething {
    NSLog(@"Transport: transportSomething");
}

///✅，p+类名信息为前缀，可以有效避免与父类方法同名，防止私有方法误覆盖
- (void)pTs_description {
    NSLog(@"I am a Transport");
}

@end
