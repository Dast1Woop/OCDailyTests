//
//  HTMSpeechSynthesizer.m
//  HTMCommon
//
//  Created by LongMa on 2019/7/25.
//  Copyright © 2019 huatu. All rights reserved.
//

#import "HTMSpeechSynNotRelateVoiceOver.h"
#import <UIKit/UIKit.h>

#ifdef DEBUG
#define  NSLog(...) NSLog(__VA_ARGS__);
#else
#define NSLog(...)
#endif

@interface HTMSpeechSynNotRelateVoiceOver ()<AVSpeechSynthesizerDelegate>

/** 记录上次播报的语音内容 */
//@property(nonatomic, copy) NSString *xtoSpeekText;

@property(nonatomic, strong) AVSpeechSynthesisVoice *xavSpeechSynVoice;


@end

@implementation HTMSpeechSynNotRelateVoiceOver

- (instancetype)init{
    if (self = [super init]) {

        /** 初始化参数.😓，子类即使设为单例，在init时，也会调用父类init方法，需要保证参数设置只执行一次。否则gDefalutLanguage通过方法设置后，下次语音播报会被这里的设置重置。
            但是，此基类可能被多个子类创建对象时调用。下面代码设置默认参数只会生效一次！！！
         */
//        NSLog(@"baby come in 1");
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSLog(@"baby come in 2");
//            //初始化参数
//            self.gIsNeedVoice = YES;
//            self.defalutSpeakLanguage = @"zh-CN";
//            self.gRate = 0.52;
//        });
    }
    return self;
}

- (void)initDefalutSpeakParameters{
    self.gIsNeedVoice = YES;
    self.gDefalutSpeakLanguage = @"zh-CN";
    self.gRate = 0.52;
}

- (void)startSpeakUtt:(NSString *)toSpeakText
           afterDelay:(NSTimeInterval)delayTime
   isNeedStopSpeaking:(BOOL)isNeedStopSpeaking{
    
//    if (UIAccessibilityIsVoiceOverRunning()) {
//
//        //可以不更改界面的情况下，直接让voiceOver读一段文字！！！香港需求
//        //不延迟可能会导致系统VoiceOver读屏失败
//        NSTimeInterval lDelayT = delayTime > 0.1 ? delayTime : 0.1;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(lDelayT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, toSpeakText);
//        });
//        return;
//    }
    
    if (NO == self.gIsNeedVoice) {
        return;
    }
    
    /** 立刻清空之前播报的语音信息。 */
    if (isNeedStopSpeaking) {
        [self.xspeechSyn stopSpeakingAtBoundary:(AVSpeechBoundaryImmediate)];
    }
    
    //  /**
    //  当与上次语音播报内容一致时，不再播报。此功能选用。
    //   */
    //  if ([self.xtoSpeekText isEqualToString:toSpeakText]) {
    //    return;
    //  }
    //  self.xtoSpeekText = toSpeakText;
    
    /** 最好不用init方法，speakString为只读的。kvc也不行。 */
    AVSpeechUtterance *jspeechUtt =
    [[AVSpeechUtterance alloc] initWithString:toSpeakText];
    
    /** 语速 */
    jspeechUtt.rate = _gRate;
    jspeechUtt.voice = self.xavSpeechSynVoice;
    //  jspeechUtt.preUtteranceDelay = 2;
    
    //    delayTime += UIAccessibilityIsVoiceOverRunning()? 1 : 0;
    dispatch_after(
                   dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       [self.xspeechSyn speakUtterance:jspeechUtt];
                   });
}

- (AVSpeechSynthesizer *)xspeechSyn {
    if (!_xspeechSyn) {
        _xspeechSyn = [[AVSpeechSynthesizer alloc] init];
        _xspeechSyn.delegate = self;
        [_xspeechSyn pauseSpeakingAtBoundary:(AVSpeechBoundaryImmediate)];
    }
    return _xspeechSyn;
}

- (AVSpeechSynthesisVoice *)xavSpeechSynVoice {
    if (!_xavSpeechSynVoice) {
        
        /**  粤语
         @"zh-HK"
         普通话
         @"zh-CN" */
        //设置默认 简体中文
        NSString *lStr4Lang = @"zh-CN";
        NSString * local = [NSLocale preferredLanguages][0];
        
        if ([local containsString:@"zh-Hant"]) {
            lStr4Lang = @"zh-HK";
        } else if ([local containsString:@"zh-Hans"]) {
            lStr4Lang = @"zh-CN";
        }else{
            lStr4Lang = _gDefalutSpeakLanguage;
        }
        _xavSpeechSynVoice = [AVSpeechSynthesisVoice voiceWithLanguage:lStr4Lang];
        
    }
    
    if (NO == [_xavSpeechSynVoice.language isEqualToString:_gDefalutSpeakLanguage]) {
        _xavSpeechSynVoice = [AVSpeechSynthesisVoice voiceWithLanguage:_gDefalutSpeakLanguage];
    }
    
    return _xavSpeechSynVoice;
    
}

/** AVSpeechSynthesizer自带代理,监听何时播报结束 */
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
 didFinishSpeechUtterance:(nonnull AVSpeechUtterance *)utterance {
    NSLog(@"系统合成语音播报完毕！");
    
    !self.playEndBlock ? : self.playEndBlock();
}

- (BOOL)stopSpeaking {
    
    /** 清空 播报队列的语音信息。 */
    BOOL lStop =
    [self.xspeechSyn stopSpeakingAtBoundary:(AVSpeechBoundaryImmediate)];
    
    if (lStop) {
        NSLog(@"stopSpeakingAtBoundary成功");
    }else{
        NSLog(@"stopSpeakingAtBoundary失败");
    }
    
    return lStop;
}
@end
