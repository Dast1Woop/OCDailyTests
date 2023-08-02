//
//  UILabel+Category.h
//  ZJDriver
//
//  Created by 马玉龙 on 2016/11/25.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 修改lbl frame,当需要使文字与lbl顶部没有一点空隙时，使用此方法。
 实现原理：修改lbl高度为文本高度（之前未设置高度的话，方法中会给高度赋值）
 */
- (void)ca4AlignTopWithNoMargin;

/**
 使得lbl文字顶部对齐，当允许文字与lbl顶部有一点空隙时，可使用此方法，此方法不会改变lbl原有高度！
 若lbl未被设置高度，则文字只显示一点点。
 实现原理：在文本前添加计算出来的非文本占用行数个 "\n "
 */
- (void)ca4AlignTopWithLittleMargin;


/**
 使得lbl文字底部对齐，实现原理：在文本前添加计算出来的非文本占用行数个 " \n"
 */
- (void)ca4AlignBottom;

/**
 *  改变行间距
 */
+ (void)ca_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)ca_changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)ca_changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;
@end
