
(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=24;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot;
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1;

var a=1000,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 24);
	var  x = 0, amp = (1/n), fund = (110 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = 4*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360),poss=0;

	24.do {

			envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		s2 = PanAz.ar(24,SinOsc.ar(freq:((ii*over)+envf),phase:pang.degrad,mul: envb), width: 1, pos:LFNoise1.ar(under),orientation:(over-1),level:presence);

		s4 = PanAz.ar(24,SinOsc.ar(freq:((ii*over)+envf),phase:pang.neg.degrad,mul: envb), width:1, pos:LFNoise1.ar(under),orientation:(over-1).neg,level:presence);

		   Out.ar(0, s2*envd2);
		   Out.ar(0, s4*envd2);


	x = x+1;
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 25, 1/2, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);
	poss=exp(Complex(0,1)*pang);

		trig = TDelay.ar(trig, under);
	};
}).add;
);

(
~aPattern = Pexprand(1, 10, inf);

Pdef(\1, Pbind(\instrument, \id1,
\dur, Pexprand(1, 1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(24, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,19,22,14,26,7,19,22,10,26,14,21,22,
		5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,17,21,9,17,21,12,24,5,19,21,9,19,21,12,10], inf),
	\presence, Pexprand(1, 1.5, inf),
	//\delay, Pexprand(0.1,0.2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);

)
)

s.options.device_("USB Sound Device");
s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.record(numChannels:24) ;

Pdef(\1).play
Pdef(\1).stop

[12, 16, 19, 24, 28, 31, 36, 40, 43, 48]  C