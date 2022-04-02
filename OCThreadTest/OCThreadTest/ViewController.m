//
//  ViewController.m
//  OCThreadTest
//
//  Created by LongMa on 2022/2/24.
//

#import "ViewController.h"
#import "BaiduTest.h"

@interface ViewController ()
@property (nonatomic,strong) BaiduTest  *test1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.test1 = [[BaiduTest alloc] initObj:1];
    self.test1 = [[BaiduTest alloc] initObj:20];
    
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(bai) object:nil];
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(du) object:nil];
    NSThread *t3 = [[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil];
    t1.threadPriority = 0.5;
    t2.threadPriority = 0.3;
    t3.threadPriority = 0.1;
    
    [t1 start];
    [t2 start];
    [t3 start];
    
}

- (void)bai{
    [self.test1 bai];
}
- (void)du{
    [self.test1 du];
}
- (void)test{
    [self.test1 test];
}


@end
