//
//  Person.m
//  ImgDownloadDemo
//
//  Created by LongMa on 2020/8/31.
//  Copyright © 2020 my. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype) initWithName:(NSString *)name age:(NSUInteger)age{
    if (self = [super init]) {
        self.gStr4Name = name;
        self.gAge =age;
    }
    return self;
}
+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age{
    return [[self alloc] initWithName:name age:age];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"name:%@,age:%lu", self.gStr4Name, (unsigned long)self.gAge];
}
@end
