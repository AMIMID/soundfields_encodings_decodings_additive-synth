


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

(
{
	var a=0 , pang=a.wrap(0,360),x=0,y=1;
	4.do{
		Out.ar(1,SinOsc.ar(440*y,mul:1/y));

		x=x+1;
		y=(x+1)/x;
		y.postln;

		a=a+137.5;
		pang=a.wrap(0,360);
	}
}.play

)


(
//b = Buffer.alloc(s,2048);
//(
//~sig = Signal.sineFill(1024,[1,(2/3),(4/3),(1/2)],[1.degrad,(3/2).degrad,(4/3).degrad,2.degrad]);
//~wt = ~sig.asWavetable;
//b.loadCollection(~wt);
//);
//~sig.plot;
//b.plot;
{
	var a=0 , pang=a.wrap(0,360),x=0,y=1;
	24.do{
		Out.ar(0,Pan2.ar(Osc.ar(b,110*y,phase:pang.degrad,mul:1/y),pos:0));
		Out.ar(0,Pan2.ar(Osc.ar(b,110*y,phase:pang.neg.degrad,mul:1/y),pos:0));

		x=x+1;
		y=(x+1)/1;
		y.postln;

		a=a+137.5;
		pang=a.wrap(0,360);
	}
}.play

)

b = Buffer.alloc(s,2048);
(
~sig = Signal.sineFill(1024,[1,(2/3),(4/3),(1/2)],[2.degrad,(3/2).degrad,(4/3).degrad,1.degrad]);
~wt = ~sig.asWavetable;
b.loadCollection(~wt);
);
~sig.plot;
b.plot;

s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(60/20);
s.options.memSize = 8192*8;
(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1;
var a=1,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 24);
	var  x = 0, amp = (0.3/n), fund = (110 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = 3*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);

	//envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	24.do {
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		s2 = Pan2.ar(Osc.ar(b,freq:((ii*over)+envf),phase:pang.degrad,mul: envb), pos: SinOsc.ar(pos),level:presence);
		s4 = Pan2.ar(Osc.ar(b,freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), pos: SinOsc.ar(pos),level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


	x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 24, 1/3, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);

		trig = TDelay.ar(trig, under);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1;
var a=10,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 24);
	var  x = 0, amp = (0.6/n), fund = (55 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = 3*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);

	//envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	24.do {
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		s2 = Pan2.ar(Osc.ar(b,freq:((ii*over)+envf),phase:pang.degrad,mul: envb), pos: SinOsc.ar(pos),level:presence);
		s4 = Pan2.ar(Osc.ar(b,freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), pos: SinOsc.ar(pos),level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


		x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 24, 1/3, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);

		trig = TDelay.ar(trig, under);
	};
}).add;
)
)

(
~aPattern = Pexprand(1, 2, inf);

Pdef(\1, Pbind(\instrument, \id1,
\dur, Pexprand(1, 1.2, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(24, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,26,14,20,22], inf),
	\presence, Pexprand(1, 1.5, inf),
	///\delay, Pexprand(1000,1000,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);

Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(2, 8, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(24, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,26,14,20,22], inf),
	\presence, Pexprand(1, 1.5, inf),
	//\delay, Pexprand(1000,1000,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1)
)

Pdef(\1).stop
Pdef(\2).stop

[7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,26,14,21,22,
		5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,19,21,9,19,21,12,10]
[12, 16, 19, 24, 28, 31, 36, 40, 43, 48]  C