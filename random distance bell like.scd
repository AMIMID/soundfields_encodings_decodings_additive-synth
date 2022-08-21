(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/30);
s.options.memSize = 8192*8;
s.waitForBoot
(
(
SynthDef.new(\id1, { arg dur = 1, note = 1, presence = 1, delay =1 , n=1, wide=1;
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var b=angle;
	var phi=(sqrt(5)+1)/2;
	var y1=angle.rand,y2=angle.rand;
	var pang1=a.wrap(0,360),pang2=b.wrap(0,360);
	//var p1=exp(Complex(0,1)*a), p2=exp(Complex(0,1)*b);
	var p1=exp(Complex(0,1)*y1), p2=exp(Complex(0,1)*y2);
	var d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
	var interval=d;
	var under=1/interval;
	var aToW = NamedControl.kr(\aToW, 0 ! 16);
	var  amp = (0.3/n), fund = (220 )*n;
	var enva, envb, envd1, envd2, envf;
	var attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(note/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);


	envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	16.do {

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1,{ 0.0999.rand}),
			[-4]
		), trig);


	a=a+angle;
		//b=b+angle;
		pang1=a.wrap(0,360);
	//	pang2=b.wrap(0,360);

	//	p1=exp(Complex(0,1)*pang1);
	//	p2=exp(Complex(0,1)*pang2);

		y1=y1+envf;
		y2=y2+envf;

		p1=exp(Complex(0,1)*y1);
		p2=exp(Complex(0,1)*y2);
		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;

envb = EnvGen.ar(Env.perc(attack,decay, amp/interval, [-4, -4]), trig);
		s2 = Pan2.ar(SinOsc.ar(freq:((ii*interval)),phase:pang1.degrad,mul: envb), pos: LFNoise1.ar(0.1),level:presence);

   Out.ar(0, s2*envd2);

		trig = TDelay.ar(trig, 1);
	};

}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, note = 1, presence = 1, delay =1 , n=1, wide=1;
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var b=angle;
	var phi=(sqrt(5)+1)/2;
	var y1=angle.rand,y2=angle.rand;
	var pang1=a.wrap(0,360),pang2=b.wrap(0,360);
	//var p1=exp(Complex(0,1)*a), p2=exp(Complex(0,1)*b);
	var p1=exp(Complex(0,1)*y1), p2=exp(Complex(0,1)*y2);
	var d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
	var interval=d;
	var under=1/interval;
	var aToW = NamedControl.kr(\aToW, 0 ! 16);
	var  amp = (0.6/n), fund = (110 )*n;
	var enva, envb, envd1, envd2, envf;
	var attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(note/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);


	//envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	16.do {

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { 0.0999.rand }),
			[-4]
		), trig);

	a=a+angle;
		//b=b+angle;
		pang1=a.wrap(0,360);
	//	pang2=b.wrap(0,360);

	//	p1=exp(Complex(0,1)*pang1);
	//	p2=exp(Complex(0,1)*pang2);

		y1=y1+envf;
		y2=y2+envf;

		p1=exp(Complex(0,1)*y1);
		p2=exp(Complex(0,1)*y2);
		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;

			envb = EnvGen.ar(Env.perc(attack,decay, amp/interval, [-4, -4]), trig);

			s2 = Pan2.ar(SinOsc.ar(freq:((ii*interval)),phase:pang1.degrad,mul: envb), pos: LFNoise1.ar(0.1),level:presence);

		   Out.ar(0, s2*envd2);

		trig = TDelay.ar(trig, 1);
	};
}).add;
)
);

(
~aPattern = Pexprand(1, 10, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(1, 1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(16, ~aPattern))
	.collect { |array| [array] },

	\note, Pxrand([
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(4,8,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
Pdef(\2, Pbind(\instrument, \id2,
\dur, Pexprand(2, 2, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(16, ~aPattern))
	.collect { |array| [array] },

	\note, Pxrand([
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(4,8,inf),
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