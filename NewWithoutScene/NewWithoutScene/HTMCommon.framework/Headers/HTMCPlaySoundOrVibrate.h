//
//  HTMCPlaySoundOrVibrate.h
//
//  Created by LongMa on 15/11/16.
//  Copyright © 2015年 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

///创建的对象需要强引用，建议使用HTBNPlaySoundTool
@interface HTMCPlaySoundOrVibrate : NSObject{
    SystemSoundID soundID;
}

#pragma mark -  播放震动
- (instancetype)initForPlayingVibrate;

//播放震动，内部关联了设置中是否发出震动的判断
-(void)playVibrate;


#pragma mark -  播放语音
-(instancetype)initForPlayingSoundEffectWith:(NSString *)filename;

//播放语音，内部关联了设置中是否发出声音的判断
-(void)playSound;

@end
