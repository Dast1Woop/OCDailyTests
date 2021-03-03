//
//  ViewController.m
//  OCNilTest
//
//  Created by LongMa on 2021/3/3.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *lNum = nil;
    NSString *lStr = nil;
    
    if (lNum) {
        NSLog(@"num if not nil");
    }else{
        NSLog(@"num if nil");
    }
    
    if (lStr) {
        NSLog(@"lStr is not nil");
    }else{
        NSLog(@"lStr is nil");
    }
}


@end
