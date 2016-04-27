//
//  Girl.m
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "Girl.h"

@implementation Girl

-(void)setBoyFriend:(JSValue *)boyFriend{

    _boyFriend = [JSManagedValue managedValueWithValue:boyFriend];
    return;
}

@end
