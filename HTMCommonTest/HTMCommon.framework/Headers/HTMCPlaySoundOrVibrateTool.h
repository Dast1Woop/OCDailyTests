//
//  HTMCPlaySoundOrVibrateTool.h
//
//  Created by LongMa on 2020/4/21.
//  Copyright © 2020 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMCPlaySoundOrVibrateTool : NSObject
HMSingleton_h(HTBNPlaySoundTool);

/// 震动
- (void)playVibrate;

///播放 shakestart.mp3 文件（工程里需要添加）
- (void)playSound;

///震动 + 播放 shakestart.mp3 文件（工程里需要添加）
- (void)playSoundAndVibrate;
@end

NS_ASSUME_NONNULL_END
