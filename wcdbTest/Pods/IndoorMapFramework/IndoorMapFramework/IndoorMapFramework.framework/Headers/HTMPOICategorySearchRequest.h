//
//  HTMPOICategorySearchRequest.h
//  IndoorMapFramework
//
//  Created by LongMa on 2019/7/11.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface HTMPOICategorySearchRequest : NSObject

/// 建筑id，必须
@property(nonatomic, copy) NSString *buildingID;

/// floorId,非必须。
@property(nonatomic, copy) NSString *floorId;

@end

NS_ASSUME_NONNULL_END
