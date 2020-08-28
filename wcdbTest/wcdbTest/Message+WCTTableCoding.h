//
//  Message+WCTTableCoding.h
//  wcdbTest
//
//  Created by LongMa on 2019/5/31.
//  Copyright © 2019 hautu. All rights reserved.
//

#import "Message.h"
#import <WCDB/WCDB.h>

@interface Message (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(name)
WCDB_PROPERTY(age)
WCDB_PROPERTY(gArr4TextMsgM)
//WCDB_PROPERTY(<#property4#>)
//WCDB_PROPERTY(<#..........#>)

@end
