//
//  Message.mm
//  wcdbTest
//
//  Created by LongMa on 2019/5/31.
//  Copyright © 2019 hautu. All rights reserved.
//

#import "Message+WCTTableCoding.h"
#import "Message.h"
#import <WCDB/WCDB.h>
#import "TextMsg.h"

@implementation Message

WCDB_IMPLEMENTATION(Message)
WCDB_SYNTHESIZE(Message, name)
WCDB_SYNTHESIZE(Message, age)
WCDB_SYNTHESIZE(Message, gArr4TextMsgM)
//WCDB_SYNTHESIZE(Message, <#property4#>)
//WCDB_SYNTHESIZE_COLUMN(Message, <#property5#>, "<#column name#>") // Custom column name
//WCDB_SYNTHESIZE_DEFAULT(Message, <#property6#>, <#default value#>) // Default to WCTDefaultTypeCurrentTime, WCTDefaultTypeCurrentDate, WCTDefaultTypeCurrentTimestamp or your custom literal value
//
//WCDB_PRIMARY_ASC_AUTO_INCREMENT(Message, <#property2#>)
//WCDB_UNIQUE(Message, <#property3#>)
//WCDB_NOT_NULL(Message, <#property4#>)
  
@end
