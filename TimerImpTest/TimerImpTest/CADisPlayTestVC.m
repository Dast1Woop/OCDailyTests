//
//  CADisPlayTestVC.m
//  TimerImpTest
//
//  Created by LongMa on 2020/8/19.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "CADisPlayTestVC.h"
#import "MYLWeakProxy.h"

@interface CADisPlayTestVC ()

//限制性：执行频率太快，最慢也要1s一次。
@property(nonatomic, strong) CADisplayLink *gCADLink;
@end

@implementation CADisPlayTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testCADisLink];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)dealloc{
    
    //Removes the object from all runloop modes (releasing the receiver if it has been implicitly retained) and releases the 'target' object.
    [self.gCADLink invalidate];
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)testCADisLink{
    
    //注意说明：The newly constructed display link retains the target.用弱代理，优雅的解决循环引用问题。
    CADisplayLink *lCAD = [CADisplayLink displayLinkWithTarget:[MYLWeakProxy proxyWithTarget:self] selector:@selector(m4cadlink:)];
    lCAD.preferredFramesPerSecond = 1;
    
    self.gCADLink = lCAD;
}

- (void)m4cadlink:(CADisplayLink *)cadLink{
    NSLog(@"%@", cadLink);
}

#pragma mark -  action
- (IBAction)startBtnDC:(id)sender{
    [self.gCADLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (IBAction)pauseBtnDC:(id)sender{
    self.gCADLink.paused = YES;
}

- (IBAction)resumeBtnDC:(id)sender{
    self.gCADLink.paused = NO;
}

- (IBAction)dismissBtnDC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
