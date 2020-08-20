//
//  GCDSourceVC.m
//  TimerImpTest
//
//  Created by LongMa on 2020/8/20.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "GCDSourceVC.h"

@interface GCDSourceVC ()

@end

@implementation GCDSourceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark -  action
- (IBAction)startBtnDC:(id)sender{
    
}

- (IBAction)pauseBtnDC:(id)sender{
    
}

- (IBAction)resumeBtnDC:(id)sender{
    
}

- (IBAction)dismissBtnDC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
          
      }];
}

@end
