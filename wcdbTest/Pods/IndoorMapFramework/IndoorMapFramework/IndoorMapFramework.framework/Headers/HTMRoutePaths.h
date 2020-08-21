//
//  RoutePaths.h
//  IndoorMapFramework
//
//  Created by Xd Huang on 2019/2/24.
//  Copyright © 2019 huatu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTMRoutePath;
NS_ASSUME_NONNULL_BEGIN

@interface HTMRoutePaths : NSObject

/** 可行的路径集合，目前只有一个元素 */
@property (nonatomic, copy) NSArray<HTMRoutePath*> *paths;
@end

NS_ASSUME_NONNULL_END
