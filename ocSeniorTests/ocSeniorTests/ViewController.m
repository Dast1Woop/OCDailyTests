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
    
}


@end
