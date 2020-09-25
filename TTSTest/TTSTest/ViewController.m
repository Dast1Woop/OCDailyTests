//
//  ViewController.m
//  TTSTest
//
//  Created by LongMa on 2020/9/25.
//  Copyright © 2020 ht. All rights reserved.
//

#import "ViewController.h"
#import "HTMSpeechSynNotRelateVoiceOver.h"

@interface ViewController ()
@property(nonatomic, strong) HTMSpeechSynNotRelateVoiceOver *gTTSObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HTMSpeechSynNotRelateVoiceOver *lTTSObj = [[HTMSpeechSynNotRelateVoiceOver alloc] init];
    
    [lTTSObj initDefalutSpeakParameters];
    
    lTTSObj.playEndBlock = ^{
        NSLog(@"播完了");
    };
    
    self.gTTSObj = lTTSObj;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.gTTSObj startSpeakUtt:@"奥利给，今天的不开心就到此为止吧！" afterDelay:0 isNeedStopSpeaking:YES];
}


@end
