//
//  MYAccelerometerTool.h
//  BackgroundShakeTest
//
//  Created by LongMa on 2020/9/8.
//  Copyright © 2020 my. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSingleton.h"
NS_ASSUME_NONNULL_BEGIN

@protocol MYAccelerometerToolDelegate;

@interface MYAccelerometerTool : NSObject
HMSingleton_h(MYAccelerometerTool);

@property (nonatomic, weak) id<MYAccelerometerToolDelegate> delegateCustom;
- (void)startMonitorShake;
@end

@protocol MYAccelerometerToolDelegate <NSObject>

- (void)dmMYAccelerometerTool:(MYAccelerometerTool *)tool didDetectShakeGesture:(double)accelerationCaled;

@end

NS_ASSUME_NONNULL_END
