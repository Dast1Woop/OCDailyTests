//
//  HTMPOISearchResponse.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/6/21.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMPoi;

NS_ASSUME_NONNULL_BEGIN

@interface HTMPOISearchResponse : NSObject

///数据库中 总记录数, >= _poisArr.count。注意：当HTMPOISearchRequestByMultiCombine搜索时，此值无效。
//@property (nonatomic, assign) long total;

///搜索到的poi模型数组，注意：数组长度 == pageSize  <= total(总记录数)
@property (nonatomic, copy) NSArray<HTMPoi *> *poisArr;

@end

NS_ASSUME_NONNULL_END
