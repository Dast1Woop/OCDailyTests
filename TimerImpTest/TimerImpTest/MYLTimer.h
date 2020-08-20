//
//  MYLTimer.h
//  TimerImpTest
//
//  Created by LongMa on 2020/8/20.
//  Copyright © 2020 hautu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
MYLTimer is a thread-safe timer based on GCD. It has similar API with `NSTimer`.
MYLTimer object differ from NSTimer in a few ways:

* It use GCD to produce timer tick, and won't be affected by runLoop.
* It make a weak reference to the target, so it can avoid retain cycles.
* It always fire on main thread.

*/
@interface MYLTimer : NSObject

+ (MYLTimer *)timerWithTimeInterval:(NSTimeInterval)interval
                            target:(id)target
                          selector:(SEL)selector
                           repeats:(BOOL)repeats;

- (instancetype)initWithFireTime:(NSTimeInterval)start
                        interval:(NSTimeInterval)interval
                          target:(id)target
                        selector:(SEL)selector
                         repeats:(BOOL)repeats NS_DESIGNATED_INITIALIZER;

@property (readonly) BOOL repeats;
@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;

- (void)invalidate;

- (void)fire;

@end

NS_ASSUME_NONNULL_END
