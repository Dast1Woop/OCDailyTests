//
//  HTMMenuSearchResponse.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/9/29.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMMenu;

NS_ASSUME_NONNULL_BEGIN

/**  后台返回数据示例:
   {
        "id": "243068947388170240",
        "code": "poi_menu_156440100",
        "parent": "230359626896375808",
        "level": 2,
        "children": [
            {
                "id": "237598239082151932",
                "code": "poi_menu_156440100_restaurant",
                "value": "餐饮",
                "parent": "243068947388170240",
                "sort": 3,
                "level": 3
            }
        ]
    }
 */
@interface HTMMenuSearchResponse : NSObject

/** 注意，本模型value属性为nil。children数组中HTMMenu对象才有value属性。
 */
@property(nonatomic, strong) HTMMenu *menuModel;
@end

NS_ASSUME_NONNULL_END
