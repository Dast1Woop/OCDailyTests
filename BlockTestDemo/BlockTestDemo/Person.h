//
//  Person.h
//  ImgDownloadDemo
//
//  Created by LongMa on 2020/8/31.
//  Copyright © 2020 my. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic, copy) NSString *gStr4Name;
@property (nonatomic, assign) NSUInteger gAge;

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age;

- (NSString *)description;
@end

NS_ASSUME_NONNULL_END
