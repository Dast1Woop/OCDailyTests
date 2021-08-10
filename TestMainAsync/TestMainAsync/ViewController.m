//
//  ViewController.m
//  TestMainAsync
//
//  Created by LongMa on 2021/8/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 异步加入到主队列的任务，执行时间好像由系统主队列控制的，不一定在代码块结束后立即执行；
 下面log：
 2021-08-10 13:58:55.259814+0800 TestMainAsync[47765:4248959] 111
 2021-08-10 13:58:55.259896+0800 TestMainAsync[47765:4248959] 222
 2021-08-10 13:58:55.259954+0800 TestMainAsync[47765:4248959] 444
 2021-08-10 13:58:55.263915+0800 TestMainAsync[47765:4248959] -[ViewController viewWillAppear:]
 2021-08-10 13:58:55.271344+0800 TestMainAsync[47765:4248959] 333
 2021-08-10 13:58:55.272673+0800 TestMainAsync[47765:4248959] -[ViewController viewDidAppear:]

 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"111");
    NSLog(@"222");
    //sync main会崩溃，死锁
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"333");
    });
    NSLog(@"444");
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}


@end
