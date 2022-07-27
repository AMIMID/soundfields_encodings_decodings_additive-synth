s.options.numWireBufs = 1024;
s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=4;
TempoClock.default.tempo_(120/15);
s.options.memSize = 8192*8;
s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.record(numChannels:4) ;

(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n=1, wide=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 24);
	var  x = 0, amp = (1/n), fund = (110 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = 3*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360),poss=0;

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

	s2 = Pan4.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.degrad,mul: envb), xpos: poss.real, ypos:poss.imag,level:presence);

		s4 = Pan4.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), xpos:poss.real.neg, ypos:poss.imag.neg,level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

	    pos = over.linlin(2, 25, 1/2, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);
	poss=exp(Complex(0,1)*pang);

		trig = TDelay.ar(trig, delay);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n=1, wide=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 24);
	var  x = 0, amp = (0.5/n), fund = (220 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = 3*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360),poss=0;

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

	s2 = Pan4.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.degrad,mul: envb), xpos: poss.real, ypos:poss.imag,level:presence);

		s4 = Pan4.ar(SinOsc.ar(freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), xpos:poss.real.neg, ypos:poss.imag.neg,level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

	    pos = over.linlin(2, 25, 1/2, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);
		poss=exp(Complex(0,1)*pang);

		trig = TDelay.ar(trig, delay);
	};
}).add;
)
)

(
var aPattern = Pexprand(1, 10, inf);

Pdef(\1, Pbind(\instrument, \id1,
\dur, Pexprand(1, 1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(24, aPattern))
	.collect { |array| [array] },

	\interval, Prand( [7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,26,14,21,22,
		5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,19,21,9,19,21,12,10], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(0.01,0.2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);

Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(1, 1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(24, aPattern))
	.collect { |array| [array] },

	\interval, Prand( [7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,26,14,21,22,
		5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,19,21,9,19,21,12,10], inf),
	\presence, Pexprand(1, 1.5, inf),
	\delay, Pexprand(0.01,0.2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1)
)

Pdef(\1).play
Pdef(\2).play
Pdef(\1).stop
Pdef(\2).stop

[12, 16, 19, 24, 28, 31, 36, 40, 43, 48]  C