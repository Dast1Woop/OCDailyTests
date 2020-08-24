//
//  HTMRegionLocationResponse.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/9/9.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTMRegionInfoResponse : NSObject<NSCoding, NSCopying>
@property (nonatomic, copy)             NSString *idCustom;
@property (nonatomic, copy)             NSString *createTime;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, copy)             NSString *shortName;
@property (nonatomic, copy)             NSString *code;
@property (nonatomic, assign)           double lat;
@property (nonatomic, assign)           double lng;
@property (nonatomic, assign)           int level;
@property (nonatomic, assign)           int tileVersion;
@property (nonatomic, copy)             NSArray<NSNumber *> *bbox;
@property (nonatomic, copy)             NSString *parent;;
@end

NS_ASSUME_NONNULL_END



