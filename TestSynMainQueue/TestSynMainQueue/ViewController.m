//
//  ViewController.m
//  TestSynMainQueue
//
//  Created by LongMa on 2020/10/27.
//  Copyright © 2020 ht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}


//为避免死锁，使用dispatch_sync(dispatch_get_main_queues时，必须进行if ([NSThread isMainThread]) 判断，否则可能导致死锁。需求中暂时还没遇到必须用 dispatch_sync(dispatch_get_main_queue()的情况
- (void)test{
    
    /*Submits a block to the specified dispatch queue for synchronous execution. Unlike dispatch_async, this function does not return until the block has finished. Calling this function and targeting the current queue results in deadlock.
     Unlike with dispatch_async, no retain is performed on the target queue. Because calls to this function are synchronous, it "borrows" the reference of the caller. Moreover, no Block_copy is performed on the block.
     As a performance optimization, this function executes blocks on the current thread whenever possible, with one obvious exception. Specifically, blocks submitted to the main dispatch queue always run on the main thread.
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([NSThread isMainThread]) {
            NSLog(@"afasf");
            for (int i = 0; i < 10000; i++) {
                NSLog(@"i = %d", i);
            }
        }else{
            
            //使用dispatch_sync(dispatch_get_main_queues时，必须进行if ([NSThread isMainThread]) 判断，否则可能导致死锁。
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSLog(@"2,%@", [NSThread currentThread]);
                for (int i = 0; i < 10000; i++) {
                    NSLog(@"i = %d", i);
                }
            });
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1,%@", [NSThread currentThread]);
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            /*This function is the fundamental mechanism for submitting blocks to a dispatch queue. Calls to this function always return immediately after the block has been submitted and never wait for the block to be invoked. The target queue determines whether the block is invoked serially or concurrently with respect to other blocks submitted to that same queue. Independent serial queues are processed concurrently with respect to each other.
             */
            //        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"2,%@", [NSThread currentThread]);
            for (int i = 0; i < 10000; i++) {
                NSLog(@"i = %d", i);
            }
        });
        
        NSLog(@"notice me when logged!");
    });
}


//死锁示例
- (void)test1{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //此处会死锁，导致程序崩溃
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2,%@", [NSThread currentThread]);
            for (int i = 0; i < 10000; i++) {
                NSLog(@"i = %d", i);
            }
        });
        
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1,%@", [NSThread currentThread]);
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2,%@", [NSThread currentThread]);
            for (int i = 0; i < 10000; i++) {
                NSLog(@"i = %d", i);
            }
        });
        
        NSLog(@"notice me when logged!");
    });
}


@end
