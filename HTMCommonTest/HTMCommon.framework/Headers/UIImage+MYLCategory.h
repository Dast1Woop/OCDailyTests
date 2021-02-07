//
//  UIImage+Category.h
//  logToolTest
//
//  Created by 马玉龙 on 16/8/8.
//  Copyright © 2016年 huatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  根据图片名称拉伸图片
 *
 *  @param imageName 要拉伸的图片名
 *
 *  @return 拉伸好的图片
 */
+ (instancetype)image4ResizableImageWithName:(NSString *)imageName;

@end
