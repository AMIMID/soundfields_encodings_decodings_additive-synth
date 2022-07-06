s.options.numWireBufs = 1024;
s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=12;
TempoClock.default.tempo_(120/60);
s.options.memSize = 8192*8;
s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.record(numChannels:6) ;

(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n=1, wide=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 19);
	var  x = 0, amp = (1/n), fund = (258*2 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund / tone;
	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0;

	envd1 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*tone), doneAction: 2);

	19.do {
		enva = EnvGen.ar(Env.perc(attack,decay, amp/under, [-4, -4]), trig);
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		   s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.001), pos: pos,level:presence);
			s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.001), pos: pos,level:presence);
		   s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.001), pos: pos.neg,level:presence);
			s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.001), pos: pos.neg,level:presence);

			Out.ar(0, s1*envd1);
		   Out.ar(0, s2*envd2);
		  Out.ar(0, s3*envd1);
		   Out.ar(0, s4*envd2);


		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

	    pos = over.linlin(2, 20, 1/2, wide);

		trig = TDelay.ar(trig, delay);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n=1, wide=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 19);
	var  x = 0, amp = (1/n), fund = (258*2 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund / tone;
	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0;

	envd1 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*tone), doneAction: 2);

	19.do {
		enva = EnvGen.ar(Env.perc(attack,decay, amp/under, [-4, -4]), trig);
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		   s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.001), pos: pos,level:presence);
			s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.001), pos: pos,level:presence);
		   s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.001), pos: pos.neg,level:presence);
			s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.001), pos: pos.neg,level:presence);

			Out.ar(0, s1*envd1);
		   Out.ar(0, s2*envd2);
		  Out.ar(0, s3*envd1);
		   Out.ar(0, s4*envd2);


		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

	    pos = over.linlin(2, 20, 1/2, wide);

		trig = TDelay.ar(trig, delay);
	};
}).add;
)
)

(
var aPattern = Pexprand(1, 20, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(19, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [16, 21, 26, 31, 35, 40], inf),
	\presence, Pexprand(1, 4, inf),
	\delay, Pexprand(0.1,0.5,inf),
	\n, Prand([(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
Pdef(\2, Pbind(\instrument, \id2,
\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(19, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [16, 21, 26, 31, 35, 40], inf),
	\presence, Pexprand(1, 4, inf),
	\delay, Pexprand(0.1,0.5,inf),
	\n, Prand([(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1)
)

Pdef(\1).stop
Pdef(\2).stop

[12, 16, 19, 24, 28, 31, 36, 40, 43, 48]  C