(function(){
 console.debug = console.info = console.warn = console.error = console.log;
 
 var timers = {};
 console.time = function(name){
 
 timers[name] = Date.now();
 
 };
 
 console.tiemEnd = function (name){
 
 var timeStart = timers [name];
 if (!timeStart){
 return;
 }
 
 var timeElapsed = Date.now() - timeStart;
 console.log (name+":"+timeElapsed+"ms");
 delete timers[name];
 
 }
 console.log("======== mock console ok ===========")
 
 
 
 })();