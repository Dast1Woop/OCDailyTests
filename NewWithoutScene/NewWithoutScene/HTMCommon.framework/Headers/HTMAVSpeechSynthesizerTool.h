//
//  AVSpeechSynthesizerTool.h
//  离线语音的探索
//
//  Created by 马玉龙 on 16/5/4.
//  Copyright © 2016年 huatu. All rights reserved.
/*
 1.导入AVFoundation
 */

#import <AVFoundation/AVFoundation.h>
#import "HTMSpeechSynthesizer.h"
#import "HMSingleton.h"

@interface HTMAVSpeechSynthesizerTool :HTMSpeechSynthesizer
HMSingleton_h(HTMAVSpeechSynthesizerTool);
/** 本单例 初始化比较耗时，可能会导致界面卡顿。最好提前调用此方法确保提前创建好单例。
 方法内部创建了单例对象。
 */
+ (void)ensureSpeechToolBeAlloced;

@end
