//
//  HTMPOICategorySearchResponse.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/7/11.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMPoiCategory;

NS_ASSUME_NONNULL_BEGIN

@interface HTMPOICategorySearchResponse : NSObject

///HTMPOICategory对象数组
@property (nonatomic, copy) NSArray<HTMPoiCategory *> *poiCategoriesArr;

@end

NS_ASSUME_NONNULL_END
