(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/40);
s.options.memSize = 8192*8;
s.waitForBoot
(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, delay =1 , index=5, wide=1,attack=0.01;
		var angle = 360-(360/((sqrt(5)+1)/2));
     var a=1000,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 16);
	var  x = 0, amp = (12/1), fund = (110*(2.pow(index/12)));
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0, pang=angle.wrap(0,360);
	var p1,p2,d;


	envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	16.do {
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { 0.999.rand }),
			[-4]
		), trig);

			   	p1=exp(Complex(0,pos.degrad)).round(0.00001);

					a=a+angle;
		pang=a.wrap(0,360);

		pos=pang.rand;

			p2=exp(Complex(0,pos.degrad)).round(0.00001);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);

		s2 =  Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb),freq:((ii*over)+envf),rq:0.0001), pos: LFNoise1.ar(d),level:presence);

		   Out.ar(0, s2*envd2);


		x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);



		trig = TDelay.ar(trig,under);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, delay =1 , index=5, wide=1,attack=0.01;
		var angle = 360-(360/((sqrt(5)+1)/2));
     var a=1000,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 16);
	var  x = 0, amp = (12/1), fund = (55*(2.pow(index/12)));
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0, pang=angle.wrap(0,360);
	var p1,p2,d;


	envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	16.do {
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { 0.999.rand }),
			[-4]
		), trig);

			   	p1=exp(Complex(0,pos.degrad)).round(0.00001);

					a=a+angle;
		pang=a.wrap(0,360);

		pos=pang.rand;

			p2=exp(Complex(0,pos.degrad)).round(0.00001);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);

		s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb),freq:((ii*over)+envf),rq:0.0001), pos: LFNoise1.ar(d),level:presence);

		   Out.ar(0, s2*envd2);


		x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);



		trig = TDelay.ar(trig, under);
	};
}).add;
)
);

(
~aPattern = Pexprand(1, 4, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(1, 1, inf),
	//\index,Prand([4,5,7],inf),
	\attack,Prand([0.01,0.02],inf),

	\aToW, Ptuple(Array.fill(16, ~aPattern))
	.collect { |array| [array] },

	\interval, Prand( [
		1,4,5,7,8,10,12,13,16,17,19,20,22,24,Rest(1),Rest(1),Rest(1),Rest(1)], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(1,2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
Pdef(\2, Pbind(\instrument, \id2,
\dur, Pexprand(1, 1, inf),
	//\index,Pxrand([1,4,5,7,8,10,12],inf),
	\attack,Prand([0.01,0.02],inf),
	\aToW, Ptuple(Array.fill(16, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		1,4,5,7,8,10,12,13,16,17,19,20,22,24,Rest(1),Rest(1),Rest(1),Rest(1)], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(1,2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
)
)

Pdef(\1).stop
Pdef(\2).stop

s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

[5,11,12,17]


[3,10,5,12,7,2,9,4,11,6,1,8] ///pyth

[1,2,5,6,8,9,12,13]///byzantine

[
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22]

[
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22]

[7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,26,14,21,22,
		5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,19,21,9,19,21,12,10]
[12, 16, 19, 24, 28, 31, 36, 40, 43, 48]  C