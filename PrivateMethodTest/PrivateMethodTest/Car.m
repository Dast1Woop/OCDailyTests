//
//  Car.m
//  PrivateMethodTest
//
//  Created by LongMa on 2022/8/25.
//

#import "Car.h"

@implementation Car

- (instancetype)init{
    if (self = [super init]) {
        [self p_transportSomething];
        
        [self pCar_description];
    }
    return self;
}

///❌，p开头难以避免与父类方法同名
- (void)p_transportSomething {
    NSLog(@"Car: p_transportSomething");
}

///✅，p+类名信息为前缀，可以有效避免与父类方法同名，防止私有方法误覆盖
- (void)pCar_description {
    NSLog(@"I am Car");
}

@end
