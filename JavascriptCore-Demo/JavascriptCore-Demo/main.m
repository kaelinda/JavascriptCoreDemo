//
//  main.m
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Point3D.h"
#import "Console.h"


#pragma mark ------------------------

void prepareLanguage(JSContext *context){
    context [@"language"] = ^(){
        NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
        NSLog(@"language : %@",language);
        return language;
    };

};

void loadScript(JSContext *context,NSString *fileName){
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],fileName];
    NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [context evaluateScript:script];

}

void prepareConsole(JSContext *context){
    context[@"console"] = [[Console alloc] initWithContext:context];
    loadScript(context, @"mack-console.js");

}








int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        JSContext *context = [[JSContext alloc] init];
        NSString *script;
        JSValue *result;
//***************  捕捉上下文 中的异常信息
        context.exceptionHandler = ^(JSContext *ctx,JSValue *exception){
            NSLog(@"%@",exception);
        };
//        [context evaluateScript:@"a.b = 123;"];
        
//******************* 简单数值转换
//        result = [context evaluateScript:@"1 + 2"];
//        NSLog(@"1 + 2 = %f",[result toDouble]);
        
        
//*******************简单调用 JS 中的方法 并 获取其返回值
//        JSValue *sum = context [@"sum"];//注册了一个方法 “sum”
//        JSValue *result2 = [sum callWithArguments:@[@1,@2]];//给“sum”这个方法 传入两个参数
//        NSLog(@"sum(1,2) = %f",[result2 toDouble]);

        
        
//*******************  JS 代码注入：定义一个变量 并 对这一个变量进行操作
//        在context的上下文内 创建了一个 231 的值对象
//        JSValue *intVar = [JSValue valueWithInt32:231 inContext:context];
//        context[@"bar"] = intVar;//把这个值对象 赋值给js内的bar变量
//        [context evaluateScript:@"bar++"];//执行 js 代码 "bar++";
//        //----------other way
//        [context evaluateScript:@"var bar = 231"];

        
//******************** 院上代码中 字符串 操作 JS 代码
//        script = @"1+2+3";
//        result = [context evaluateScript:script];
//        NSLog(@"%@ = %f",script ,[result toDouble]);
        
//        script = @"var globalVar = 2+3;";
//        result = [context evaluateScript:script];
//        NSLog(@"var globalVar = %@",context[@"globalVar"]);
        
//********************** OC原生代码中 定义一个JS方法 并调用该方法，获取其返回值
//        script  = @"function sum(a,b){return a+b;}";
//        [context evaluateScript:script];
//        JSValue *sum = context[@"sum"];
//        result = [sum callWithArguments:@[@1,@3]];
//        NSLog(@"%@ = %f",@"sum(1,3)" ,[result toDouble]);
        
//**************** OC 中 创建一个JS对象
//通过double类型  创建一个JS 对象
//        JSValue *foo = [JSValue valueWithDouble:123 inContext:context];
//        context[@"foo"] = foo;
//        [context evaluateScript:@"foo++"];
//        NSLog(@"foo = %f",[context[@"foo"] toDouble]);
        
        
        
//---------------- JS中调用OC方法 -----------------
        // Call Native Code via Block
        
        NSString *strOut = @"outstring";
        
        //JS 中的方法 “sum”被调用的时候 这个block 就会被执行
//        context [@"sum"] = ^(int a,int b){
//            JSContext *ctx = [JSContext currentContext];//这个方法获取到 block 外部的 JSContext
//            ctx[@"add"] = ^(){};
//            NSArray *args = [JSContext currentArguments];//接收传入的参数
//            NSLog(@"222%@",args);
//            return a+b;
//        };
//        //调用这个“sum”方法  传值  1、2 进去 并得到返回值 赋值给 result
//        result = [context evaluateScript:@"sum(1,2)"];
//        NSLog(@"sum(1,2) = %f",[result toDouble]);
        
        
//---------------------- Model
//        Point3D *point3D = [[Point3D alloc] initWithContext:context];
//        point3D.X = 1;
//        point3D.Y = 2;
//        point3D.Z = 3;
//        //往JS中注入的  只能是构造好的 对象  不能 注入类和构造函数
//        context[@"point3D"] = point3D;
//        script = @"point3D.x = 2;point3D.y = 2;point3D.z = 2;point3D.length()";
//        result = [context evaluateScript:script];
//
//        NSLog(@"length = %f",[result toDouble]);
        
        
        
//-------------------自定义  将JSContext 绑定 固定的 JS文件
        context[@"console"] = [[Console alloc] initWithContext:context];
//        prepareConsole(context);
        prepareLanguage(context);//向JS上下文中 导入 language 这个方法
        loadScript(context, @"JavaScriptCoreDemo.js");
        

//JS 线程问题 一个虚拟机 代表的就是一个线程
//        JSVirtualMachine *jsvmA = [[JSVirtualMachine alloc] init];
//        JSContext *contextA1 = [[JSContext alloc] initWithVirtualMachine:jsvmA];
//        JSContext *contextA2 = [[JSContext alloc] initWithVirtualMachine:jsvmA];
//        
//        JSVirtualMachine *jsvmB = [[JSVirtualMachine alloc] init];
//        JSContext *ctxB = [[JSContext alloc] initWithVirtualMachine:jsvmB];
        //contextA1 contextA2 是同步的  但是这两个 跟 ctxB是异步的

        
        return 0;
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
