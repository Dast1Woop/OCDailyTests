//
//  ViewController.m
//  TimerImpTest
//
//  Created by LongMa on 2020/8/19.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "ViewController.h"
#import "NSTimerTestVC.h"

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



@end
