(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/40);
s.options.memSize = 8192*8;
s.waitForBoot
(
SynthDef.new(\s, {

	var  x = 0, fund = 110, over = 1, interval, am,	 tone, i, s;
	//var trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360), size=128;
	var env;
var y, z;


z = [1,3,5,8];
128.do{
	y = z.addAll([1,3,5,8]);
z=y};

	256.do {

		am=EnvGen.ar(Env.new(Array.linrand(size, 0.1, 1),Array.linrand(size-1, 1, 15),\sine), doneAction: 2);

		interval=EnvGen.ar(Env.new(y,Array.linrand(size-1, 0.5, 2),[4,4]), doneAction: 2);
    tone = 2.pow(interval/12);
	i = fund * tone;

		s = Pan2.ar(BPF.ar(SinOsc.ar(freq:over*fund,phase:pang.degrad,mul: 1/over),freq:i,rq:0.01), pos:pos,level:1);
		//s = Pan2.ar(SinOsc.ar(freq:over*i,phase:pang.degrad,mul: 1/over), pos:pos,level:am);
Super
		   Out.ar(0, s);
		x = x+1;
		over = (x+1)/1;
		an = an+137.5;
		pang = an.wrap(0, 360);
		 pos = pang.linlin(0,360,-1,1);
		//pos = over.linlin(1,128,0.1,1);

	//	trig = TDelay.ar(trig, under);
	};
}).play;
)
)


Synth.new(\s)
128*2


Env.new(Array.linrand(8, 0.01, 1),Array.linrand(8-1, 0.1, 10),\sine).plot



(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/60);
s.options.memSize = 8192*8;
s.waitForBoot
(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=2, wide=1;
var a=100,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 8);
	var  x = 0, amp = (0.3/n), fund = (110 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1,attack=0.05;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);

	envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	8.do {
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { 0.1999.rand2 }),
			[-4]
		), trig);

		s2 = Pan2.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.degrad,mul: envb), pos: LFNoise1.ar(pos),level:presence);
		s4 = Pan2.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), pos: LFNoise1.ar(pos),level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


	x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 8, 1/3, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);

		trig = TDelay.ar(trig, under);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=2, wide=1;
var a=10,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 8);
	var  x = 0, amp = (0.6/n), fund = (55 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);

	//envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	8.do {
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { 0.1999.rand2 }),
			[-4]
		), trig);

		s2 = Pan2.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.degrad,mul: envb), pos: LFNoise1.ar(pos),level:presence);
		s4 = Pan2.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), pos: LFNoise1.ar(pos),level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


		x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 8, 1/3, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);

		trig = TDelay.ar(trig, under);
	};
}).add;
)
);

(
~aPattern = Pexprand(1, 10, inf);

Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(4, 8, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(8, ~aPattern))
	.collect { |array| [array] },

	\interval, Pseq( [1,3,5,8], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(2,8,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
(
Pdef(\1, Pbind(\instrument, \id1,
\dur, Pexprand(1, 1.1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(8, ~aPattern))
	.collect { |array| [array] },

	\interval, Pseq( [1,3,5,8], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(2,4,inf),
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

[
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22]

[7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,26,14,21,22,
		5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,19,21,9,19,21,12,10]
[12, 16, 19, 24, 28, 31, 36, 40, 43, 48]  C