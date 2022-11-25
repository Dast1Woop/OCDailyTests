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
    
    //num if nil
    if (lNum) {
        NSLog(@"num if not nil");
    }else{
        NSLog(@"num if nil");
    }
    
    //lStr is nil
    if (lStr) {
        NSLog(@"lStr is not nil");
    }else{
        NSLog(@"lStr is nil");
    }
    
    //0
    NSLog(@"str len = %lu", (unsigned long)lStr.length);
    
    //lst len == 0
    if (0 == lStr.length) {
        NSLog(@"lst len == 0");
    }
    
    NSArray *arr = nil;
    //0%lu(unsigned long)
    NSLog(@"arr.count==%lu", arr.count);
}


@end
