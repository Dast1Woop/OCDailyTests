//
//  BaiduTest.m
//  OCThreadTest
//
//  Created by LongMa on 2022/2/24.
//

#import "BaiduTest.h"

@interface BaiduTest ()
@property (nonatomic,assign) int n;
@end

@implementation BaiduTest

- (instancetype)initObj:(int)n{
    BaiduTest *m = [[BaiduTest alloc] init];
    m.n = n;
    return m;
}

//- (instancetype)init{
//    if (self = [super init]) {
//        self.n = 1;
//    }
//    return self;
//}

- (void)bai{
    for (int i = 0; i < self.n; i++) {
        NSLog(@"bai");
        [NSThread sleepForTimeInterval:0.5];
    }
}

- (void)du{
    for (int i = 0; i < self.n; i++) {
        NSLog(@"du");
        [NSThread sleepForTimeInterval:0.5];
    }
}

- (void)test{
    for (int i = 0; i < self.n; i++) {
        NSLog(@"test");
        [NSThread sleepForTimeInterval:0.5];
    }
}

@end
