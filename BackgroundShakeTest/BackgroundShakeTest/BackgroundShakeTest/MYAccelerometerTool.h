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

/// 开始监听摇一摇动作：检测成功时，发送 KNTFY_SHAKE_SUCCESS 通知，为防止频繁回调，每次检测成功后，停止摇动1s后才继续响应下次摇一摇。返回值标识是否监听成功。
- (BOOL)startMonitorShake;

/// 停止监听摇一摇动作
- (void)stopMonitorShake;
@end

NS_ASSUME_NONNULL_END
