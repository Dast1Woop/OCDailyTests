//
//  ViewController.m
//  CopyItemsTest
//
//  Created by LongMa on 2020/10/27.
//  Copyright © 2020 ht. All rights reserved.
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

- (void)test{
    NSMutableArray *lArrM = [[NSMutableArray alloc] initWithArray:@[@0] copyItems:YES];
    
    [lArrM addObject:@1];
    
    NSLog(@"%@", lArrM);
}


@end
