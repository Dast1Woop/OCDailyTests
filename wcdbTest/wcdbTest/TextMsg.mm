//
//  TextMsg.mm
//  wcdbTest
//
//  Created by LongMa on 2020/8/21.
//  Copyright © 2020 hautu. All rights reserved.
//

#import "TextMsg+WCTTableCoding.h"
#import "TextMsg.h"
#import <WCDB/WCDB.h>

@implementation TextMsg

WCDB_IMPLEMENTATION(TextMsg)
WCDB_SYNTHESIZE(TextMsg, name)
//WCDB_SYNTHESIZE(TextMsg, <#property2#>)
//WCDB_SYNTHESIZE(TextMsg, <#property3#>)
//WCDB_SYNTHESIZE(TextMsg, <#property4#>)
//WCDB_SYNTHESIZE_COLUMN(TextMsg, <#property5#>, "<#column name#>") // Custom column name
//WCDB_SYNTHESIZE_DEFAULT(TextMsg, <#property6#>, <#default value#>) // Default to WCTDefaultTypeCurrentTime, WCTDefaultTypeCurrentDate, WCTDefaultTypeCurrentTimestamp or your custom literal value

//WCDB_PRIMARY_ASC_AUTO_INCREMENT(TextMsg, <#property2#>)
//WCDB_UNIQUE(TextMsg, <#property3#>)
//WCDB_NOT_NULL(TextMsg, <#property4#>)

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) {
       self.name = [coder decodeObjectForKey:@"name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
     [coder encodeObject:self.name forKey:@"name"];
}


  
@end
