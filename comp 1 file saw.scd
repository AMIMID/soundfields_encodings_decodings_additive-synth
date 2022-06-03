


(
(
SynthDef.new(\id1, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=120,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,12,1/1,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id2, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=120,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,12,1/1,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id3, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=160,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,9,1/2,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;

	f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id4, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=160,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,9,1/2,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;

	f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id5, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=160,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,9,1/2,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;

	f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id6, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=180 ,l=440;
	var sig,x=0,amp=1,audio=0;
		var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,8,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id7, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=180,l=440;
	var sig,x=0,amp=1,audio=0;
		var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,8,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id8, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=180,l=440;
	var sig,x=0,amp=1,audio=0;
		var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,8,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id9, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=180,l=440;
	var sig,x=0,amp=1,audio=0;
		var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,8,1/3,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
);
(
SynthDef.new(\id10, {

		arg dur=1,pr=1,pass=1,n=1,b=0,a=4,f=240,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq=4,envd;
	   envd=EnvGen.ar(Env.perc(a,6,1/1,[-4,-4]),doneAction:2);
		32.do{
		env=EnvGen.ar(Env.perc(a.rand,12.rand,1/amp,[-4,-4]));
		sig=PanAz.ar(2,SinOsc.ar(f,mul:env),LFNoise0.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=(f*freq+n);
		amp=(amp*freq+n);
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,audio*envd);
}).add;
)
)


//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(

( Pdef(\1, Pbind(\instrument, \id1,
		\dur,Pexprand(1,6,inf),
				\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id2,
		\dur,Pexprand(1,6,inf),
				\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\3, Pbind(\instrument, \id3,
		\dur,Pexprand(6,8,inf),
					\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\4, Pbind(\instrument, \id4,
		\dur,Pexprand(6,8,inf),
				\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\5, Pbind(\instrument, \id5,
		\dur,Pexprand(6,8,inf),
					\a,Pbrown(0.1,2,0.1,inf),
		\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\6, Pbind(\instrument, \id6,
		\dur,Pexprand(8,9,inf),
				\a,Pbrown(0.1,2,0.1,inf),
		\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\7, Pbind(\instrument, \id7,
		\dur,Pexprand(8,9,inf),
					\a,Pbrown(0.1,2,0.1,inf),
		\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\8, Pbind(\instrument, \id8,
		\dur,Pexprand(8,9,inf),
				\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\9, Pbind(\instrument, \id9,
		\dur,Pexprand(8,9,inf),
				\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

( Pdef(\10, Pbind(\instrument, \id10,
		\dur,Pexprand(12,12,inf),
					\a,Pbrown(0.1,2,0.1,inf),
	\n,Pbrown(1,10,1,inf);
)).play(quant:1));

)
s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=6
TempoClock.default.tempo_(60/60);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;
~a= Buffer.read(s,path:"/Users/petrostatsiopoulos/Dokuments/COMPUTER PROGRAMMING FILES/SUPERCOLLIDER/sc/2022/339326__inspectorj__bird-whistling-a mono.wav");
~a.query;
~a.numFrames

(
(
SynthDef.new(\id27, {

		arg dur=1,pr=0.1,pass=1,n=1,b=0,sp=10000,a=4,f=100;
	var sig,sum=0;
	var env,freq;

	freq=n*6*f;
	env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(6,BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(1/pass)),LFSaw.ar(2/12),width:1);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id28, {

		arg dur=1,pr=0.1,pass=1,n=1,b=0,sp=10000,a=4,f=100;
	var sig,sum=0;
	var env,freq;


	freq=n*8*f;
	env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(6,BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(1/pass)),LFSaw.ar(2/9),width:1);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id29, {

		arg dur=1,pr=0.1,pass=1,n=1,b=0,sp=10000,a=4,f=100;
	var sig,sum=0;
	var env,freq;


	freq=n*9*f;
	env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(6,BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(1/pass)),LFSaw.ar(2/8),width:1);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id30, {

		arg dur=1,pr=0.1,pass=1,n=1,b=0,sp=10000,a=4,f=100;
	var sig,sum=0;
	var env,freq;


	freq=n*12*f;
	env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(6,BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(1/pass)),LFSaw.ar(2/6),width:1);

		Out.ar(0,sig*env);
}).add;
);
)
//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(

( Pdef(\27, Pbind(\instrument, \id27,
	\dur,Pexprand(12,64,inf),
	\sp,Pbrown(0,1060000,10000,inf),
		//\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	//\f,Prand([60,80,90,120],inf),
	\pass,Pexprand(0.05,0.5,inf),
	\n,Pbrown(1,4,1,inf);)).play(quant:1));

( Pdef(\28, Pbind(\instrument, \id28,
	\dur,Pexprand(12,64,inf),
	\sp,Pbrown(0,1060000,10000,inf),
	//	\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
//\f,Prand([60,80,90,120],inf),
	\pass,Pexprand(0.05,0.5,inf),
	\n,Pbrown(1,4,1,inf);)).play(quant:1));

( Pdef(\29, Pbind(\instrument, \id29,
	\dur,Pexprand(12,64,inf),
	\sp,Pbrown(0,1060000,10000,inf),
	//	\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	//\f,Prand([60,80,90,120],inf),
	\pass,Pexprand(0.05,0.5,inf),
	\n,Pbrown(1,4,1,inf);)).play(quant:1));

( Pdef(\30, Pbind(\instrument, \id30,
	\dur,Pexprand(12,64,inf),
	\sp,Pbrown(0,1060000,10000,inf),
	//	\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
//\f,Prand([60,80,90,120],inf),
	\pass,Pexprand(0.05,0.5,inf),
	\n,Pbrown(1,4,1,inf);)).play(quant:1));

)
////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////
(SynthDef.new(\env,{var env;
//	env=EnvGen.ar(Env.sine(360,1),doneAction:2);
	Out.ar(0,PanAz.ar(6,InFeedback.ar(6),LFSaw.ar(100),width:1));
//	Out.ar(1,InFeedback.ar(3));
}).add)

Synth.new(\env);
( Pdef(\sound, Pbind(\instrument, \env,
	\dur,Pbrown(180,720,60,inf),
			)).play(quant:1));
/////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
(
SynthDef.new(\id1, {

		arg dur=1,pr=1,pass=1,n=1,b=0,sp=10000,a=4,f=5,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq;

	    env=EnvGen.ar(Env.perc(a,a,pr/6,[-4,-4]),doneAction:2);
		12.do{
		sig=PanAz.ar(6,SinOsc.ar((f*6),mul:1/amp),LFNoise1.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq*n;
		amp=amp*freq;
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,LeakDC.ar(audio*env));
}).add;
);
(
SynthDef.new(\id2, {

		arg dur=1,pr=1,pass=1,n=1,b=0,sp=10000,a=4,f=5,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq;

	    env=EnvGen.ar(Env.perc(a,a,pr/8,[-4,-4]),doneAction:2);
		4.do{
		sig=PanAz.ar(6,SinOsc.ar((f*8),mul:1/amp),LFNoise1.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq*n;
		amp=amp*freq;
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,LeakDC.ar(audio*env));
}).add;
);
(
SynthDef.new(\id3, {

		arg dur=1,pr=1,pass=1,n=1,b=0,sp=10000,a=4,f=5,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq;

	    env=EnvGen.ar(Env.perc(a,a,pr/9,[-4,-4]),doneAction:2);
		4.do{
		sig=PanAz.ar(6,SinOsc.ar((f*9),mul:1/amp),LFNoise1.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq*n;
		amp=amp*freq;
	};
	//audio=BLowPass.ar(audio,l);
		Out.ar(0,LeakDC.ar(audio*env));
}).add;
);
(
SynthDef.new(\id4, {

		arg dur=1,pr=1,pass=1,n=1,b=0,sp=10000,a=4,f=5,l=440;
	var sig,x=0,amp=1,audio=0;
	var env,freq;

	    env=EnvGen.ar(Env.perc(a,a,pr/12,[-4,-4]),doneAction:2);
		4.do{
		sig=PanAz.ar(6,SinOsc.ar((f*12),mul:1/amp),LFNoise1.ar(amp),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq*n;
		amp=amp*freq;
	};
	//audio=BLowPass.ar(audio,l);
	Out.ar(0,LeakDC.ar(audio*env));
}).add;
)
)


//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(

( Pdef(\1, Pbind(\instrument, \id1,
	\dur,Pbrown(0.02,0.04,0.01,inf),
	\l,Pbrown(440,1200,100,inf),
			\pr,Pexprand(0.125,0.25,inf),
	\a,Pbrown(0.01,0.1,0.01,inf),
	\n,Pbrown(1,10,1,inf);)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id2,
	\dur,Pbrown(0.02,0.04,0.01,inf),
	\l,Pbrown(440,1200,100,inf),
				\pr,Pexprand(0.125,0.25,inf),
	\a,Pbrown(0.01,0.1,0.01,inf),
	\n,Pbrown(1,10,1,inf);)).play(quant:1));

( Pdef(\3, Pbind(\instrument, \id3,
	\dur,Pbrown(0.02,0.04,0.01,inf),
	\l,Pbrown(440,1200,100,inf),
			\pr,Pexprand(0.125,0.25,inf),
	\a,Pbrown(0.01,0.1,0.01,inf),
	\n,Pbrown(1,10,1,inf);)).play(quant:1));

( Pdef(\4, Pbind(\instrument, \id4,
	\dur,Pbrown(0.02,0.04,0.01,inf),
	\l,Pbrown(440,1200,100,inf),
		\pr,Pexprand(0.125,0.25,inf),
	\a,Pbrown(0.01,0.1,0.01,inf),
	\n,Pbrown(1,10,1,inf);)).play(quant:1));

)