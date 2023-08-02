//
//  HTMSpeechSynthesizer.h
//  HTMCommon
//
//  Created by LongMa on 2019/7/25.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@protocol HTMSpeechSynthesizerDelegate;

NS_ASSUME_NONNULL_BEGIN

typedef void(^VoicePlayEndBlock)(void);

typedef void(^VoicePlayBlock)(NSString *playText);

@interface HTMSpeechSynthesizer : NSObject

/** 对象初始化后，必须调用此方法，设置默认播报参数。然后需要修改时，单独修改各属性的值即可。
      self.gIsNeedVoice = YES;
      self.defaultSpeakLanguage = @"zh-CN";
      self.gRate = 0.52; */
- (void)initDefaultSpeakParameters;

// 语音播放完毕block;
@property (nonatomic, copy) VoicePlayEndBlock playEndBlock DEPRECATED_MSG_ATTRIBUTE("建议使用代理 - (void)dm_synthesizer:(HTMSpeechSynthesizer *)synthesizer playDidFinished:(NSString *)text;");

// 语音播放完毕block;
@property (nonatomic, copy) VoicePlayBlock playFinishBlock DEPRECATED_MSG_ATTRIBUTE("建议使用代理 - (void)dm_synthesizer:(HTMSpeechSynthesizer *)synthesizer playDidFinished:(NSString *)text;");

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

@property (nonatomic,weak) id<HTMSpeechSynthesizerDelegate> delegateCustom;

/// 开始播报。注意：未使用voiceOver引擎读文字。春芽地图需求使用。
/// @param toSpeakText 播报文本
/// @param delayTime 延迟时间
/// @param isNeedStopSpeaking 是否打断之前播报
- (void)startSpeakUtt:(NSString *)toSpeakText
           afterDelay:(NSTimeInterval)delayTime
   isNeedStopSpeaking:(BOOL)isNeedStopSpeaking;

/// 开始播报。听听巴士需求：ifUseVoiceOverEngine 传 YES
/// @param toSpeakText 播报文本
/// @param delayTime 延迟时间
/// @param isNeedStopSpeaking 是否打断之前播报
/// @param ifUseVoiceOverEngine 是否使用 voiceOver 引擎读文字，仅当 voiceOver 开启且 app 处于前台时有效
- (void)startSpeakUtt:(NSString *)toSpeakText
           afterDelay:(NSTimeInterval)delayTime
   isNeedStopSpeaking:(BOOL)isNeedStopSpeaking
ifUseVoiceOverEngineWhenVOisOn:(BOOL)ifUseVoiceOverEngine;

- (BOOL)stopSpeaking;


/**系统自带方法
 - (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary;
 - (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary;
 - (BOOL)continueSpeaking;
 */

@end

@protocol HTMSpeechSynthesizerDelegate <NSObject>

- (void)dm_synthesizer:(HTMSpeechSynthesizer *)synthesizer playDidStarted:(NSString *)text;

- (void)dm_synthesizer:(HTMSpeechSynthesizer *)synthesizer playDidFinished:(NSString *)text;


/// The system only calls this method if a speech synthesizer is speaking an utterance and the system calls its stopSpeakingAtBoundary: method. The system doesn’t call this method if the synthesizer is in a delay between utterances when speech stops, and it doesn’t call it for unspoken utterances.
- (void)dm_synthesizer:(HTMSpeechSynthesizer *)synthesizer playDidCancelled:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
