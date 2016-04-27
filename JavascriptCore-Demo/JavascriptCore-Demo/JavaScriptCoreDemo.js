
var foo = function(a){

    return "Hello OC I'm foo in JS +"+a;

}

var bar = function(a){
    
    return "Hello OC I'm bar in JS +"+a;
    
}


//var Point3D_model = new Point3D();

console.log(bar(321));

console.log (language());//这里调用的是OC 通过 JavaScriptCore 插入的JS代码---》language()方法

console.log( "point3D.consttructor----->>"+point3D.constructor);
console.log( "typeof point3D.consttructor------->>"+(typeof point3D.constructor));


//console.log(Date.now());
//console.time("sum");
//var sum = 0;
//for (var i=0;i<1E5;i++){
//    sum+=i;
//    
//}
//
//console.info(sum);
//console.timeEnd("sum");




