//
//  HTMMenu.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/9/29.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMMenu : NSObject

///  唯一id
@property(nonatomic, copy) NSString *idCustom;

///  菜单code
@property(nonatomic, copy) NSString *menuCode;

/// 菜单名
@property(nonatomic, copy) NSString *menuName;

/// 父类编号
@property(nonatomic, copy) NSString *parent;

/// 数据库中层级
@property (nonatomic, assign) int level;

/// 子菜单
@property(nonatomic, copy) NSArray<HTMMenu *> *children;
@end

NS_ASSUME_NONNULL_END
