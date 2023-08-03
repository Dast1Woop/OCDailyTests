//
//  ViewController.m
//  NSOperationTest
//
//  Created by LongMa on 2023/8/3.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test];
}


/**
 log:
 2023-08-03 14:55:25.248906+0800 NSOperationTest[7112:494881] after add Opes
 2023-08-03 14:55:25.249139+0800 NSOperationTest[7112:495255] op0 begin line
 2023-08-03 14:55:25.249187+0800 NSOperationTest[7112:495257] op1 begin line
 2023-08-03 14:55:25.249234+0800 NSOperationTest[7112:495255] op0 end line
 2023-08-03 14:55:25.249242+0800 NSOperationTest[7112:495257] op1 end line
 2023-08-03 14:55:25.249313+0800 NSOperationTest[7112:495255] op0 CompletionBlock
 2023-08-03 14:55:25.249319+0800 NSOperationTest[7112:495257] op1 CompletionBlock
 2023-08-03 14:55:25.249339+0800 NSOperationTest[7112:495256] barrier block
 2023-08-03 14:55:27.354700+0800 NSOperationTest[7112:494881] op1 2s后 done
 2023-08-03 14:55:28.401046+0800 NSOperationTest[7112:494881] op0 3s后 done
 */
- (void)test {
    NSBlockOperation *op0 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op0 begin line");
        
        //异步执行的（底层实现未开线程，异步：不阻塞当前线程）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"op0 3s后 done");
        });
        NSLog(@"op0 end line");
    }];
    
    [op0 setCompletionBlock:^{
        NSLog(@"op0 CompletionBlock");
    }];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op1 begin line");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"op1 2s后 done");
        });
        NSLog(@"op1 end line");
    }];
    
    [op1 setCompletionBlock:^{
        NSLog(@"op1 CompletionBlock");
    }];
    
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    [q addOperations:@[op0, op1] waitUntilFinished:NO];
    NSLog(@"after add Opes");
    
    [q addBarrierBlock:^{
        NSLog(@"barrier block");
    }];
}


@end
