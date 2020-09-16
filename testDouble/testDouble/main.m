//
//  main.m
//  testDouble
//
//  Created by LongMa on 2020/9/16.
//  Copyright © 2020 ht. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        float a = 4.1;
        int b = 2;
        double c = 5.0;
        
        NSLog(@"a:%lu",sizeof(a));
        NSLog(@"b:%lu",sizeof(b));
        NSLog(@"afadf:%lu",sizeof(a + b/(int)c));
        NSLog(@"c:%lu",sizeof(c));
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
