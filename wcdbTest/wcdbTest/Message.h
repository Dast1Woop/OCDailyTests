//
//  Message.h
//  wcdbTest
//
//  Created by LongMa on 2019/5/31.
//  Copyright © 2019 hautu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TextMsg;

NS_ASSUME_NONNULL_BEGIN

@interface Message : NSObject

@property(nonatomic, copy) NSString *name;
    
@property(nonatomic, copy) NSString *age;

@property(nonatomic, strong) NSArray<TextMsg *> *gArr4TextMsgM;

@end

NS_ASSUME_NONNULL_END
