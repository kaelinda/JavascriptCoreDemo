//
//  Point3D.h
//  JavascriptCore-Demo
//
//  Created by Kael on 16/4/26.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


//JSExport  遵守了这个协议之后  这里面的属性  才能暴露给JS代码中  js 代码中才能  直接调用这个对象的 暴露的属性。
@protocol Point3DExport <JSExport>

@property double x;
@property double y;
@property double z;

-(double)length;

@end

@interface Point3D : NSObject<Point3DExport>{

    JSContext *context;
}


@property (nonatomic,assign) double X;
@property (nonatomic,assign) double Y;
@property (nonatomic,assign) double Z;

-(id)initWithContext:(JSContext *)ctx;

@end
