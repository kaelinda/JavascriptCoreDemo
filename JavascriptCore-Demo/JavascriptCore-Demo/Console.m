//
//  Console.m
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "Console.h"

@implementation Console

-(id)initWithContext:(JSContext *)ctx{
    self = [super init];
    
    if (self) {
        context = ctx;
        context[@"console"] = [Console class];
    }
    return self;
}

-(void)log{

    NSArray *args = [JSContext currentArguments];
    NSLog(@"%@",[args componentsJoinedByString:@","]);
    
}

-(void) info{

    NSLog(@"");
}

@end
