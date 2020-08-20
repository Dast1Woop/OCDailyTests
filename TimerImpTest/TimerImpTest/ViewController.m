//
//  ViewController.m
//  TimerImpTest
//
//  Created by LongMa on 2020/8/19.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "ViewController.h"
#import "NSTimerTestVC.h"
#import "CADisPlayTestVC.h"
#import "GCDSourceVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)jumpBtnDC:(id)sender {
    NSTimerTestVC *lVC = [[NSTimerTestVC alloc] initWithNibName:@"NSTimerTestVC" bundle:nil];
    [self presentViewController:lVC animated:YES completion:^{
    }];
}

- (IBAction)jump2CADisPlayBtnDC:(id)sender {
    CADisPlayTestVC *lVC = [[CADisPlayTestVC alloc] initWithNibName:@"CADisPlayTestVC" bundle:nil];
    [self presentViewController:lVC animated:YES completion:^{
    }];
}

- (IBAction)jump2GCDSourceBtnDC:(id)sender {
    GCDSourceVC *lVC = [[GCDSourceVC alloc] initWithNibName:@"GCDSourceVC" bundle:nil];
    [self presentViewController:lVC animated:YES completion:^{
    }];
}



@end
