//
//  ViewController.m
//  UUIDTo21BitIntTest
//
//  Created by LongMa on 2020/12/18.
//

#import "ViewController.h"

#import "NSString+JinZhiConvert.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test];
}


/*截取后21位
原始数组：
 @[                @"0x20000A",
                   @"0x400009",
                   @"0xA00008",
                   @"0x100007",
                   @"0x300006",
                   @"0x900005",
 ]
 截取后21位后：
 2020-12-21 11:36:11.076769+0800 UUIDTo21BitIntTest[86206:23513320] lArrM:(
     00000A,
     000009,
     000008,
     100007,
     100006,
     100005
 )
 十进制：
 2020-12-21 11:36:11.076986+0800 UUIDTo21BitIntTest[86206:23513320] 10
 2020-12-21 11:36:11.077148+0800 UUIDTo21BitIntTest[86206:23513320] 9
 2020-12-21 11:36:11.077311+0800 UUIDTo21BitIntTest[86206:23513320] 8
 2020-12-21 11:36:11.077464+0800 UUIDTo21BitIntTest[86206:23513320] 1048583
 2020-12-21 11:36:11.077606+0800 UUIDTo21BitIntTest[86206:23513320] 1048582
 2020-12-21 11:36:11.077757+0800 UUIDTo21BitIntTest[86206:23513320] 1048581
 */
- (void)test{
    NSArray *lArr = @[@"0x20000A",
                      @"20000A",
                      @"0x400009",
                      @"0xA00008",
                      @"0x100007",
                      @"0x300006",
                      @"0x900005",
                      @"0x12345",
                      @"0x1234",
                      @"0x123",
                      @"0x12",
                      @"0x1",
    ];
    
    //截取后21位
    NSMutableArray *lArrM = [NSMutableArray array];
    [lArr enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *lStr = [NSString getSubHexStrWithLastBitsNum:21 ofOriginHexStr:obj];
        [lArrM addObject:lStr];
    }];
    
    NSLog(@"lArrM:%@",lArrM);

    [lArrM enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *lBinaryStr = [NSString getBinaryByhex:obj];
        int lInt = [[NSString toDecimalSystemWithBinarySystem:lBinaryStr] intValue];
        NSLog(@"%d",lInt);
    }];
   
}




@end
