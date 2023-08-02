//
//  UIAlertController+Category.h
//  logToolTest
//
//  Created by 马玉龙 on 16/8/8.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Category)

/** 不包含“取消”按钮的弹窗 */
+ (void)alertC4ShowConfirmAlert2VC:(UIViewController *)vc
                             title:(NSString *)title
                               msg:(NSString *)msg
                 sureBtnClickBlock:(void (^)(void))sureBlock;

/** 确认 弹窗，防止误操作 */
+ (void)alertC4ShowConfirmAlert2VC:(UIViewController *)vc
                             title:(NSString *)title
                               msg:(NSString *)msg
                 sureBtnClickBlock:(void (^)(void))sureBlock
               cancelBtnClickBlock:(void (^)(void))cancelBlock;

/** DatePicker */
+ (void)alertCShowActiontoVC:(UIViewController *)vc
            chooseDateOrTime:(UIDatePickerMode)dateMode
                    miniDate:(NSDate *)miniDate
                    maxiDate:(NSDate *)maxiDate
           sureBtnClickBlock:(void (^)(NSString *, NSDate *))block
         cancelBtnClickBlock:(void (^)(void))cancelBlock;

+ (void)alertCShowAction4ChooseDateThenTimetoVC:(UIViewController *)vc
                                       miniDate:(NSDate *)miniDate
                                       maxiDate:(NSDate *)maxiDate
                              sureBtnClickBlock:(void (^)(NSString *, NSDate *))
                                                    dateThenTimeBlock
                            cancelBtnClickBlock:(void (^)(void))cancelBtnClickBlock;

/** IDAndPassWord TF */

/**
 *  @param presentVC 负责present UIAlertController对象的控器，一般是self
 *  @param sureBlock 参数是 账户、密码TF中的文本内容
 *
 *  @return UIAlertController对象，一般用不到。
 */
+ (instancetype)alert4InputIDAndPassWord2PresentVC:(UIViewController *)presentVC
                              WithSureActionHandle:
                                  (void (^)(NSArray *))sureBlock;

/** PickerView */

/** 注意是否需要重置self.gSltedRow;
 pickerV的代理和数据源方法需要控制器中实现,需要遵守代理协议
 <UIPickerViewDelegate, UIPickerViewDataSource>
 ps：代理对象已在下面方法中指定。
 */
+ (UIPickerView *)alertCShowWithPickerV2VC:(UIViewController *)vc
                         sureBtnClickBlock:(void (^)(void))sureBlock
                       cancelBtnClickBlock:(void (^)(void))cancelBlock;

@end
