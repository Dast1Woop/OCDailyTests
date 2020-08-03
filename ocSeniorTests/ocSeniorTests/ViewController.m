//
//  ViewController.m
//  ocSeniorTests
//
//  Created by LongMa on 2020/7/30.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self autoreleasepoolExplain];
}

/** 1.
 Important
 If you use Automatic Reference Counting (ARC), you cannot use autorelease pools directly. Instead, you use @autoreleasepool blocks. For example, in place of:
 
 NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
 // Code benefitting from a local autorelease pool.
 [pool release];
 
 you would write:
 
 @autoreleasepool {
 // Code benefitting from a local autorelease pool.
 }
 
 @autoreleasepool blocks are more efficient than using an instance of NSAutoreleasePool directly; you can also use them even if you do not use ARC.
 */
- (void)autoreleasepoolExplain{
        [self testDispatchGroup];
//    [self testDispatchGroupWait];
}

/** log://更推荐 notify，少用wait。notify代码格式易读。
2020-08-03 14:17:02.333371+0800 ocSeniorTests[53968:41010208] for out
2020-08-03 14:17:02.333511+0800 ocSeniorTests[53968:41010208] bottom
2020-08-03 14:17:04.333437+0800 ocSeniorTests[53968:41010417] i = 3
2020-08-03 14:17:04.333430+0800 ocSeniorTests[53968:41010416] i = 0
2020-08-03 14:17:04.333430+0800 ocSeniorTests[53968:41010414] i = 2
2020-08-03 14:17:04.333430+0800 ocSeniorTests[53968:41010419] i = 1
2020-08-03 14:17:04.333458+0800 ocSeniorTests[53968:41010431] i = 4
2020-08-03 14:17:04.333747+0800 ocSeniorTests[53968:41010208] done
 */
- (void)testDispatchGroup{
    dispatch_group_t lGroup = dispatch_group_create();
    
    for (int i = 0; i < 5; ++i) {
        dispatch_group_enter(lGroup);// enter leave
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            NSLog(@"i = %d", i);
            dispatch_group_leave(lGroup);
        });
    }
    
    NSLog(@"for out");
    dispatch_group_notify(lGroup, dispatch_get_main_queue(), ^{
        NSLog(@"done");
    });
    
    NSLog(@"bottom");
}

/** log:
 2020-08-03 14:15:12.215254+0800 ocSeniorTests[53870:41002579] for out
 2020-08-03 14:15:14.216662+0800 ocSeniorTests[53870:41002677] i = 4
 2020-08-03 14:15:14.216662+0800 ocSeniorTests[53870:41002674] i = 1
 2020-08-03 14:15:14.216678+0800 ocSeniorTests[53870:41002675] i = 3
 2020-08-03 14:15:14.216662+0800 ocSeniorTests[53870:41002679] i = 0
 2020-08-03 14:15:14.216700+0800 ocSeniorTests[53870:41002676] i = 2
 2020-08-03 14:15:14.217077+0800 ocSeniorTests[53870:41002579] done
 2020-08-03 14:15:14.217177+0800 ocSeniorTests[53870:41002579] bottom
*/
- (void)testDispatchGroupWait{
    dispatch_group_t lGroup = dispatch_group_create();
    
    for (int i = 0; i < 5; ++i) {
        dispatch_group_enter(lGroup);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            NSLog(@"i = %d", i);
            dispatch_group_leave(lGroup);
        });
    }
    
    NSLog(@"for out");
    
    //dispatch_group_wait会阻塞当前线程，直到第二个参数时间到或调度组中任务全部完成。
    dispatch_group_wait(lGroup, DISPATCH_TIME_FOREVER);
    NSLog(@"done");
    
    NSLog(@"bottom");
    
}


@end

