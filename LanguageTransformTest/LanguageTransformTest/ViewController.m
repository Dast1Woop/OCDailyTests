//
//  ViewController.m
//  LanguageTransformTest
//
//  Created by LongMa on 2021/12/14.
//

#import "ViewController.h"
#import "NSString+LanguageTransform.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"视力障碍助乘巴士报站a";
    
    NSArray *arr = [str ca_getHansAndHantStrArr];
    
    NSLog(@"0:%@,%@",arr.firstObject, arr.lastObject);
    
    //今天陽光明媚，车来了吗A
    NSString *str1 = @"";
    
    NSArray *arr1 = [str1 ca_getHansAndHantStrArr];
    
    NSLog(@"1:%@,%@",arr1.firstObject, arr1.lastObject);
}


@end
