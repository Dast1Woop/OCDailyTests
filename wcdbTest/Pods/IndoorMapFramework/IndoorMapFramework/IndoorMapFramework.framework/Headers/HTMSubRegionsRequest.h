//
//  HTMSubRegionsRequest.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/9/9.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMSubRegionsRequest : NSObject<NSCoding, NSCopying>

///区域id，如：市区编码
@property(nonatomic, copy) NSString *idCustom;

- (instancetype)initWithID:(NSString *)idCustom;
+ (instancetype)requestWithID:(NSString *)idCustom;
@end

NS_ASSUME_NONNULL_END
