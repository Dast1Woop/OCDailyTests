//
//  ViewController.m
//  AOATestOC
//
//  Created by LongMa on 2021/4/8.
//

#import "ViewController.h"
#import "AOATestOC-Swift.h"

static inline void ht_dispatch_main(void(^block)(void)) {
    if ([NSThread isMainThread]) {
        block();
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }
}

@interface ViewController ()
@property (nonatomic,strong) AOABle *gAOABleObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self aoaTest];
    [self addGes];
}

- (void)addGes{
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
    
    tapG.numberOfTouchesRequired = 3;
    tapG.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:tapG];
}

- (void)tapGes:(UITapGestureRecognizer *)ges {
    static BOOL onOrOff = NO;
    onOrOff = !onOrOff;
    
    if (onOrOff) {
        [self.gAOABleObj stop];
        self.view.backgroundColor = [UIColor redColor];
    }else{
        [self.gAOABleObj start];
        self.view.backgroundColor = [UIColor greenColor];
    }
}

- (void)aoaTest{
    self.gAOABleObj = [[AOABle alloc] init];
    
    __weak typeof(self) weakSelf = self;
    self.gAOABleObj.bleStartFailed = ^(NSError * err) {
        NSLog(@"err:bleStartFailed");
    };
    self.gAOABleObj.blePowerOn = ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf.gAOABleObj.id = 0x6666;
            strongSelf.gAOABleObj.alarm = NO;
            strongSelf.gAOABleObj.battery = 10;
            [strongSelf.gAOABleObj start];
            
            ht_dispatch_main(^{
                strongSelf.view.backgroundColor = [UIColor greenColor];
            });
        }
    };
}




@end
