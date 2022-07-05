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
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n,
	pan1=0, pan2=0, pan3=0, pan4=0,attack=0.01;

	var aToW = NamedControl.kr(\aToW, 0 ! 11);
	var w = 2;
	var sig1, sig2, x = 0, amp = (1/n), fund = (258*2 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund / tone;
	var aud,env,sph;
	var decay = 6*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var s1, s2, trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*tone), doneAction: 2);

	env = EnvGen.ar(Env.perc(attack, decay, w), doneAction: 2);


	11.do {
		enva = EnvGen.ar(Env.perc(attack,decay, amp/under, [-4, -4]), trig);
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		s1 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.0001), xpos: xc, ypos: yc,level:presence);
			s2 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.0001), xpos: xc, ypos: yc,level:presence);

		Out.ar(8, s1*envd1);
		Out.ar(8, s2*envd2);


		Out.ar(0,PanAz.ar(8,InFeedback.ar(8),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan1));
		Out.ar(0,PanAz.ar(8,InFeedback.ar(9),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan2));
		Out.ar(0,PanAz.ar(8,InFeedback.ar(10),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan3));
		Out.ar(0,PanAz.ar(8,InFeedback.ar(11),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan4));

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

		an = an+137.5;
		pang = an.wrap(0, 360);

		sph=exp(Complex.new(0,1)*pang);
		xc=sph.real;
		yc=sph.imag;
	/*	sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1)
		 1.wait;  instead, delay the trigger*/
		trig = TDelay.ar(trig, delay);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n,
	pan1=0, pan2=0, pan3=0, pan4=0,attack=0.01;

	var aToW = NamedControl.kr(\aToW, 0 ! 11);
	var w = 2;
	var sig1, sig2, x = 0, amp = (1/n), fund = (258*2 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund / tone;
	var aud,env,sph;
	var decay = 6*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var s1, s2, trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*tone), doneAction: 2);

	env = EnvGen.ar(Env.perc(attack, decay, w), doneAction: 2);


	11.do {
		enva = EnvGen.ar(Env.perc(attack,decay, amp/under, [-4, -4]), trig);
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

				s1 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.0001), xpos: xc, ypos: yc,level:presence);
		       s2 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.0001), xpos: xc, ypos: yc,level:presence);

			Out.ar(8, s1*envd1);
		Out.ar(8, s2*envd2);


		Out.ar(0,PanAz.ar(8,InFeedback.ar(8),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan1));
		Out.ar(0,PanAz.ar(8,InFeedback.ar(9),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan2));
		Out.ar(0,PanAz.ar(8,InFeedback.ar(10),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan3));
		Out.ar(0,PanAz.ar(8,InFeedback.ar(11),pos:LFSaw.ar(n/over),level:env,width:1,orientation:pan4));

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

		an = an+137.5;
		pang = an.wrap(0, 360);

		sph=exp(Complex.new(0,1)*pang);
		xc=sph.real;
		yc=sph.imag;
	/*	sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1)
		 1.wait;  instead, delay the trigger*/
		trig = TDelay.ar(trig, delay);
	};
}).add;
)
)




(
var aPattern = Pexprand(1, 20, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(11, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48], inf),
	\presence, Pexprand(4, 8, inf),
	\delay, Pexprand(0.1,0.2,inf),
	\n, Prand([(4/3),(3/2),2],inf),
	//\attack,Pexprand(0.01,1,inf),

	\pan1, Prand([0,2,4,6],inf),\pan2, Prand([0,2,4,6],inf),\pan3, Prand([0,2,4,6],inf),\pan4, Prand([0,2,4,6],inf);

)).play(quant:1);
Pdef(\2, Pbind(\instrument, \id2,
\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(11, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48], inf),
	\presence, Pexprand(4, 8, inf),
	\delay, Pexprand(0.1,0.2,inf),
	\n, Prand([(4/3),(3/2),2],inf),
	//	\attack,Pexprand(0.01,1,inf),

	\pan1, Prand([0,2,4,6],inf),\pan2, Prand([0,2,4,6],inf),\pan3, Prand([0,2,4,6],inf),\pan4, Prand([0,2,4,6],inf);

)).play(quant:1)
)

Pdef(\1).stop