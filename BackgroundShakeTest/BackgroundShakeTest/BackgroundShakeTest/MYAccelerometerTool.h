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

extern NSString *const KNTFY_SHAKE_SUCCESS;


@interface MYAccelerometerTool : NSObject
HMSingleton_h(MYAccelerometerTool);

- (void)startMonitorShake;
@end

NS_ASSUME_NONNULL_END
