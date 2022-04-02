//
//  ViewController.m
//  OCGCDTest
//
//  Created by LongMa on 2022/2/22.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) dispatch_semaphore_t sema;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];

//    dispatch_after(2, dispatch_get_global_queue(0, 0), ^{
//        [self test];
//    });
    
    [self test];

    
//    [self testDispatchApply];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

/**
 ?? 为何会在执行完毕后才执行 viewWillAppear
 log:
 2022-02-22 17:48:50.307519+0800 OCGCDTest[18203:2339609] 4:<NSThread: 0x281500e40>{number = 6, name = (null)}
 2022-02-22 17:48:50.307515+0800 OCGCDTest[18203:2339608] 0:<NSThread: 0x281500240>{number = 4, name = (null)}
 2022-02-22 17:48:51.312670+0800 OCGCDTest[18203:2339609] 5:<NSThread: 0x281500e40>{number = 6, name = (null)}
 2022-02-22 17:48:51.312668+0800 OCGCDTest[18203:2339602] 1:<NSThread: 0x281518080>{number = 3, name = (null)}
 2022-02-22 17:48:51.313165+0800 OCGCDTest[18203:2339602] 8:<NSThread: 0x281518080>{number = 3, name = (null)}
 2022-02-22 17:48:52.312661+0800 OCGCDTest[18203:2339604] 2:<NSThread: 0x281504280>{number = 7, name = (null)}
 2022-02-22 17:48:52.312662+0800 OCGCDTest[18203:2339610] 6:<NSThread: 0x28150adc0>{number = 8, name = (null)}
 2022-02-22 17:48:52.317721+0800 OCGCDTest[18203:2339602] 9:<NSThread: 0x281518080>{number = 3, name = (null)}
 2022-02-22 17:48:52.318106+0800 OCGCDTest[18203:2339602] 12:<NSThread: 0x281518080>{number = 3, name = (null)}
 2022-02-22 17:48:53.312883+0800 OCGCDTest[18203:2339607] 3:<NSThread: 0x281504980>{number = 9, name = (null)}
 2022-02-22 17:48:53.323507+0800 OCGCDTest[18203:2339602] 13:<NSThread: 0x281518080>{number = 3, name = (null)}
 2022-02-22 17:48:54.318285+0800 OCGCDTest[18203:2339604] 10:<NSThread: 0x281504280>{number = 7, name = (null)}
 */
- (void)test{
    dispatch_queue_t q = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    //常用信号量来控制线程数，避免线程爆炸！推荐！
    //只能使用 n+1（n>=0） 个随机线程;线程使用原理同 pv 操作（类比停车场车位数）
    //wait-signal 必须一一对应
    //n为0时，相当于串行队列顺序执行任务的效果。
    int semaNum = 4;
    self.sema = dispatch_semaphore_create(semaNum);
    
    for (int i = 0; i < 29; i++) {
        dispatch_async(q, ^{
            int j = i%4;
            [NSThread sleepForTimeInterval:j];
            NSLog(@"%d:%@",i, [NSThread currentThread]);
            
            dispatch_semaphore_signal(self.sema);
        });
        dispatch_semaphore_wait(self.sema, DISPATCH_TIME_FOREVER);
    }
}


/**
 2022-02-22 17:53:39.617574+0800 OCGCDTest[18208:2341580] 0:<NSThread: 0x2805717c0>{number = 4, name = (null)}
 2022-02-22 17:53:39.617615+0800 OCGCDTest[18208:2341586] 4:<NSThread: 0x280576e00>{number = 7, name = (null)}
 2022-02-22 17:53:40.618725+0800 OCGCDTest[18208:2341588] 5:<NSThread: 0x280578c80>{number = 8, name = (null)}
 2022-02-22 17:53:40.618721+0800 OCGCDTest[18208:2341581] 1:<NSThread: 0x28056c2c0>{number = 5, name = (null)}
 2022-02-22 17:53:40.619012+0800 OCGCDTest[18208:2341581] 8:<NSThread: 0x28056c2c0>{number = 5, name = (null)}
 2022-02-22 17:53:41.618709+0800 OCGCDTest[18208:2341582] 2:<NSThread: 0x280525640>{number = 3, name = (null)}
 2022-02-22 17:53:41.618829+0800 OCGCDTest[18208:2341580] 6:<NSThread: 0x2805717c0>{number = 4, name = (null)}
 2022-02-22 17:53:41.619040+0800 OCGCDTest[18208:2341580] 12:<NSThread: 0x2805717c0>{number = 4, name = (null)}
 2022-02-22 17:53:41.620045+0800 OCGCDTest[18208:2341588] 9:<NSThread: 0x280578c80>{number = 8, name = (null)}

 */
- (void)testDispatchApply{
//    dispatch_queue_t q = dispatch_queue_create("test1", DISPATCH_QUEUE_CONCURRENT);
    
    /**
     Submits a single block to the dispatch queue and causes the block to be executed the specified number of times.
     */
    dispatch_apply(999,  DISPATCH_APPLY_AUTO , ^(size_t iteration) {
        int j = iteration%4;
        [NSThread sleepForTimeInterval:j];
        NSLog(@"%zu:%@",iteration, [NSThread currentThread]);
    });
}


@end
