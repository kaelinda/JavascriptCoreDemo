//
//  Console.h
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ConsoleJSExport <JSExport>


-(void)log;

@end

@interface Console : NSObject<ConsoleJSExport>{
    
    JSContext *context;

}

-(id)initWithContext:(JSContext *)ctx;


@end
