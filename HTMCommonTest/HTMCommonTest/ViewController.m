//
//  ViewController.m
//  HTMCommonTest
//
//  Created by LongMa on 2020/12/23.
//

#import "ViewController.h"
#import <HTMCommon/HTMCommon.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    
    [[HTMAVSpeechSynthesizerTool sharedHTMAVSpeechSynthesizerTool] startSpeakUtt:@"123" afterDelay:0 isNeedStopSpeaking:NO];
    NSLog(@"uuid:%@", [NSString getUUID]);
}


@end
