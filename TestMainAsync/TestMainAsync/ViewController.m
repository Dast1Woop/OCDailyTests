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
    [self test2];
}
- (void)test2{
    NSLog(@"111");
    NSLog(@"222");
    
    //sync main会崩溃，死锁
//    dispatch_sync(dispatch_get_global_queue(0, 0), ^{//似乎没意义，在主线程
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{//在子线程
        dispatch_async(dispatch_get_main_queue(), ^{//在主线程，runloop自动开启，performSelector会根据runloop执行
        NSLog(@"thread:%@", [NSThread currentThread]);
        NSLog(@"333");
        
        //少用。底层是timer，任务加入当前线程runloop，等runloop开启（主线程默认开启，子线程需要手动开启），且为 defaultmode 再执行。延迟0s不意味着立即执行。
        [self performSelector:@selector(log) withObject:nil afterDelay:0];
        NSLog(@"bbb");
    });
    NSLog(@"444");
}

- (void)log{
    NSLog(@"%s", __func__);
}

- (void)test{
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
