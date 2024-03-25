//
//  BeaconModel.h
//  BusGuideBlind
//
//  Created by hujun on 15/11/5.
//  Copyright © 2015年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MYBeaconModel : NSObject

@property (nonatomic,assign) int major;
@property (nonatomic,assign) int minor;


@property (readwrite, nonatomic) CLProximity proximity;

@property (readwrite, nonatomic) NSInteger rssi;

@end
