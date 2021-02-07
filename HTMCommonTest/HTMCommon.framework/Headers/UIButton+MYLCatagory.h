//
//  UIButton+YLCatagory.h
//  EnvAccess
//
//  Created by 马玉龙 on 16/5/6.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLCatagory)

+ (instancetype)buttonWithNormalImgName:(NSString *)nmlImgName
                     highlightedImgName:(NSString *)hltedImgName
                                  title:(NSString *)title;

+ (instancetype)buttonWithNormalImgName:(NSString *)nmlImgName
                     highlightedImgName:(NSString *)hltedImgName
                             hidentitle:(NSString *)hidentitle;

    @end
