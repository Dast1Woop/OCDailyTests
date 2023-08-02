//
//  HTMSpeechSynthesizer.h
//  HTMCommon
//
//  Created by LongMa on 2019/7/25.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^VoicePlayEndBlock)(void);

@interface HTMSpeechSynNotRelateVoiceOver : AVSpeechSynthesizer

/** 对象初始化后，必须调用此方法，设置默认播报参数。然后需要修改时，单独修改各属性的值即可。
      self.gIsNeedVoice = YES;
      self.defalutSpeakLanguage = @"zh-CN";
      self.gRate = 0.52; */
- (void)initDefalutSpeakParameters;

// 语音播放完毕block
@property (nonatomic, copy) VoicePlayEndBlock playEndBlock;

@property(nonatomic, strong) AVSpeechSynthesizer *xspeechSyn;


/**设置语音播报的语言:
 
 当检测到手机系统为繁体时，默认播报粤语；
 当检测到手机系统为简体或其他语言时，默认播报普通话；
 当重新赋值时，使用赋值对应语言。
 
 传@"zh-CN",播报普通话;
 传@"zh-HK",播报粤语;

 ...
 
 A BCP 47 code specifying language and locale for a voice.
 */
@property(nonatomic, copy) NSString *gDefalutSpeakLanguage;

/** 是否需要合成语音。
 默认为YES
 */
@property (nonatomic, assign) BOOL gIsNeedVoice;

/// 语音播报速度，默认0.52，值越大播报越快
@property (nonatomic, assign) float gRate;


/** 当voiceOver开启时：直接让voiceOver延迟delayTime后，读toSpeakText文字 */
- (void)startSpeakUtt:(NSString *)toSpeakText
           afterDelay:(NSTimeInterval)delayTime
   isNeedStopSpeaking:(BOOL)isNeedStopSpeaking;

- (BOOL)stopSpeaking;


/**系统自带方法
 - (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary;
 - (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary;
 - (BOOL)continueSpeaking;
 */

@end

NS_ASSUME_NONNULL_END
