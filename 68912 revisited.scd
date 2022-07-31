


(
{
	var a=0 , pang=a.wrap(0,360),x=0,y=1;
	4.do{
		Out.ar(0,Pan2.ar(SinOsc.ar(440*y,phase:pang.degrad,mul:1/y),pos:LFSaw.ar(y)));
		Out.ar(0,Pan2.ar(SinOsc.ar(440*y,phase:pang.neg.degrad,mul:1/y),pos:LFSaw.ar(y)));
		Out.ar(0,Pan2.ar(SinOsc.ar(220*y,phase:pang.degrad,mul:1/y),pos:SinOsc.ar(y)));
		Out.ar(0,Pan2.ar(SinOsc.ar(220*y,phase:pang.neg.degrad,mul:1/y),pos:SinOsc.ar(y)));

		x=x+1;
		y=(x+1)/x;
		y.postln;

		a=a+137.5;
		pang=a.wrap(0,360);
	}
}.play

)