//
//  Point3D.m
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "Point3D.h"

@implementation Point3D

@synthesize X;
@synthesize Y;
@synthesize Z;


-(id)initWithContext:(JSContext *)ctx{
    self = [super init];
    if (self) {
        context  = ctx;
        context[@"point3D"] = [Point3D class];
        
    }
    return self;
}


-(double)length {

    return sqrt(self.X*self.X+self.Y*self.Y+self.Z*self.Z);

}

@end
