//
//  Boy.m
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "Boy.h"

@implementation Boy

-(void)setGirlFrend:(JSValue *)girlFrend{

//    _girlFrend9i = [girlFrend copy];
    _girlFrend = [JSManagedValue managedValueWithValue:girlFrend];
    return;
}


@end
