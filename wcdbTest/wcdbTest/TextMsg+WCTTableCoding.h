//
//  TextMsg+WCTTableCoding.h
//  wcdbTest
//
//  Created by LongMa on 2020/8/21.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "TextMsg.h"
#import <WCDB/WCDB.h>

@interface TextMsg (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(name)
//WCDB_PROPERTY(<#property2#>)
//WCDB_PROPERTY(<#property3#>)
//WCDB_PROPERTY(<#property4#>)
//WCDB_PROPERTY(<#..........#>)

@end
