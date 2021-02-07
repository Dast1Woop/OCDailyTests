//
//  UIView+Category.h
//  logToolTest
//
//  Created by 马玉龙 on 16/8/8.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat width;

@property(nonatomic, assign) CGPoint origin;
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;

@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;

+ (instancetype)view4CreatWithBackgroundColor:(UIColor *)bgColor
                                    andAlphla:(CGFloat)alpha;

//灰色边框
+ (void)view4SetUpBorder2ViewArr:(NSArray *)viewArr;

+ (void)view4SetUpBorder2ViewArr:(NSArray *)viewArr color:(UIColor *)color;

+ (instancetype)viewFromXib;

- (void)ca4RemoveSubviews;

/** ------图层锚点设置------------ */
/** 如果更改了一个图层的AnchorPoint，那么这个图层会发送位移。
 原因不表，看看文档便知。问题是发生位移之后，我们用下面方法将位移修复回来。 */
- (void)ca4SetAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view;

/** 在进行完围绕AnchorPoint的变换之后，一定要切记将AnchorPoint改回默认。
 否则有些不需要特殊AnchorPoint的操作，比如拖动，就会变得乱七八糟了。 */
- (void)ca4SetDefaultAnchorPointforView:(UIView *)view;

/** Correct  UIGestureRecognizer 's view 's anchor point ,
 make the view scale or rotate correctly.
 */
- (void)ca4CorrectAnchorPointBaseOnGestureRecognizer:(UIGestureRecognizer *)gr;


/// 查找视图对象的子视图中是否包含名为name的子视图类对象
/// @param name 名为name的视图对象
/// @param resursion 是否递归查找
- (UIView *)ca4FindSubview:(NSString *)name resursion:(BOOL)resursion;


@end
