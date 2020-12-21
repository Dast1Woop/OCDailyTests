//
//  ViewController.m
//  UUID+keyChainTest
//
//  Created by LongMa on 2020/12/21.
//

#import "ViewController.h"
#import "NSString+UUIDStoredInKeyChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSString *lUUIDStr = [NSString getUUID];
    NSLog(@"%@", lUUIDStr);
}


@end
