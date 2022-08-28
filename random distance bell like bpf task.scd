


s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/30);
s.options.memSize = 8192*16;
s.waitForBoot
(
(
Tdef(\x, {loop{5.wait
(
SynthDef.new(\id1, { arg dur = 1, note = 1, presence = 1, delay =1 , n=1, wide=1,b=pi;
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=360.rand,x=0;
	var pang=a.wrap(0,360);
	var p1, p2,p3,p4,d,dx;
	var interval=0,intervalx=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 16);
	var  amp = (3/n), fund = (110 )*n;
	var enva, envb,envc, envd1, envd2, envf;
	var attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(note/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);


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

		p1=exp(Complex(0,y.degrad)).round(0.00001);
		p3=exp(Complex(0,x.degrad)).round(0.00001);

					a=a+angle;
		pang=a.wrap(0,360);

		y=pang.rand;
		x=pang;

			p2=exp(Complex(0,y.degrad)).round(0.00001);
		p4=exp(Complex(0,x.degrad)).round(0.00001);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		dx=sqrt((p4.real-p3.real).squared+(p4.imag-p3.imag).squared);
		interval=interval+d;
		intervalx=intervalx+dx;

envb = EnvGen.ar(Env.perc(attack,decay, 4/1, [-4, -4]), trig);
		envc = EnvGen.ar(Env.perc(attack,decay, amp/intervalx, [-4, -4]), trig);

		s2 = Pan2.ar(BPF.ar(SinOsc.ar(freq:((ii*interval)),phase:pang.degrad,mul: envb),freq:((ii*intervalx)+envf),mul:envc,rq:0.0001), pos: LFNoise1.ar(d),level:presence);

   Out.ar(0, s2*envd2);

		trig = TDelay.ar(trig, 0.0001/d);
	};

}).send;
);
(
SynthDef.new(\id2, { arg dur = 1, note = 1, presence = 1, delay =1 , n=1, wide=1,b=pi;
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=360.rand,x=0;
	var pang=a.wrap(0,360);
	var p1, p2,p3,p4,d,dx;
	var interval=0,intervalx=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 16);
	var  amp = (12/n), fund = (55 )*n;
	var enva, envb,envc, envd1, envd2, envf;
	var attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(note/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);


	//envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	16.do {

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1,{ 0.0999.rand}),
			[-4]
		), trig);

		p1=exp(Complex(0,y.degrad)).round(0.00001);
		p3=exp(Complex(0,x.degrad)).round(0.00001);

					a=a+angle;
		pang=a.wrap(0,360);

		y=pang.rand;
		x=pang;

			p2=exp(Complex(0,y.degrad)).round(0.00001);
		p4=exp(Complex(0,x.degrad)).round(0.00001);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		dx=sqrt((p4.real-p3.real).squared+(p4.imag-p3.imag).squared);
		interval=interval+d;
		intervalx=intervalx+dx;


envb = EnvGen.ar(Env.perc(attack,decay, 4/1, [-4, -4]), trig);
		envc = EnvGen.ar(Env.perc(attack,decay, amp/intervalx, [-4, -4]), trig);


		s2 = Pan2.ar(BPF.ar(SinOsc.ar(freq:((ii*interval)+envf),phase:pang.degrad,mul: envb),freq:((ii*intervalx)+envf),mul:envc,rq:0.0001), pos: LFNoise1.ar(d),level:presence);

   Out.ar(0, s2*envd2);

		trig = TDelay.ar(trig, 0.0001/d);
	};

}).send;
)
}}).play);

(
~aPattern = Pexprand(1, 4, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Prand([1, 1], inf),
//	\dur, Prand([0.2,0.4], inf),
	\aToW, Ptuple(Array.fill(16, ~aPattern))
	.collect { |array| [array] },

	\note, Pxrand([
 		1,4,5,7,8,10,12,13,16,171,19,20,22,24], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(2,8,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
Pdef(\2, Pbind(\instrument, \id2,
 	\dur, Prand([2, 2], inf),
 	//	\dur, Prand([0.2,0.4], inf),

 	\aToW, Ptuple(Array.fill(16, ~aPattern))
 	.collect { |array| [array] },

 	\note, Pxrand([
 		1,4,5,7,8,10,12,13,16,171,19,20,22,24], inf),
 	\presence, Pexprand(1, 1.5, inf),
 	\delay, Pexprand(2,8,inf),
// 	//\n, Prand([1,(4/3),(3/2),2],inf),
// 	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

 )).play(quant:1);
)
)
s.scope
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