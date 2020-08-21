//
//  ViewController.m
//  wcdbTest
//
//  Created by LongMa on 2019/5/30.
//  Copyright © 2019 hautu. All rights reserved.
//

#import "ViewController.h"
#import "wcdbTest-Swift.h"
#import <WCDB.h>
#import "Message.h"
#import "Message+WCTTableCoding.h"
#import "TextMsg.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstVC *lVC = [[FirstVC alloc] init];
    lVC.view.backgroundColor = [UIColor orangeColor];
    
    
//    NSMutableArray *lArrM = [NSMutableArray arrayWithCapacity:<#(NSUInteger)#>];
    
    
//    Message *lMsg = [[Message alloc] init];
//    lMsg.name;
    NSString *lPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, NO) firstObject] stringByAppendingPathComponent:@"oc.db"];
    WCTDatabase *lDBOC = [[WCTDatabase alloc] initWithPath:lPath];
    [lDBOC createTableAndIndexesOfName:@"msgs" withClass:Message.class];
    
    Message *lMsg1 = [[Message alloc] init];
    lMsg1.name = @"1";
    lMsg1.age = @"2";
    
    TextMsg *lTM0 = [[TextMsg alloc] init];
    lTM0.name = @"lTM0";
    TextMsg *lTM1 = [[TextMsg alloc] init];
    lTM1.name = @"lTM1";
    
    lMsg1.gArr4TextMsgM = @[lTM0, lTM1];
    
//    [lDBOC insertObject:lMsg1  into:@"oc.db"];
    [lDBOC insertObject:lMsg1 into:@"msgs"];
    NSLog(@"oc path = %@",lDBOC.path);
    
    [self addChildViewController:lVC];
    [self.view addSubview:lVC.view];
    
    lVC.view.frame = self.view.bounds;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      NSArray *lArr =  [lDBOC getAllObjectsOfClass:[Message class] fromTable:@"msgs"];
        
        NSLog(@"lArr:%@",lArr);
    });
}




@end
