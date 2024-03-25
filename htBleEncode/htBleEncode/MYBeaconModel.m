//
//  BeaconModel.m
//  BusGuideBlind
//
//  Created by hujun on 15/11/5.
//  Copyright © 2015年 huatu. All rights reserved.
//

#import "MYBeaconModel.h"

@implementation MYBeaconModel

#pragma mark -  isEqual
- (BOOL)isEqual:(id)object{
    if (self == object) {
        return YES;
    }
    
    if (![self isKindOfClass:[MYBeaconModel class]]) {
        return NO;
    }
    
    return [self isEqualToObj2:object];
}

- (BOOL)isEqualToObj2:(MYBeaconModel *)object{
    if (nil == object) {
        return NO;
    }
    if (self.major == object.major
        && self.minor == object.minor) {
        return YES;
    }
    
    return NO;
}

- (NSUInteger)hash{
    return self.major ^ self.minor;
}


@end
