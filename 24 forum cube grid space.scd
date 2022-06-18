s.options.numWireBufs = 1024;

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=12
TempoClock.default.tempo_(120/80);
s.options.memSize = 8192*8;
s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.record(numChannels:6) ;


(
SynthDef.new(\id1, { arg dur = 1, interval = 1, pr, y = 1,w1=1,w2=1,w3=1,w4=1,w5=1,w6=1,angle=137.5;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);

	var sig1, sig2, sig3,sig4, x = 0, amp = 1, fund = (1026 * 4);
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1, attack = 0.01;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;
	var amp1 = 2.pow(interval/12);
	var i = fund * amp1, ii = fund / amp1;

	var aud;
	var env;

	var sph;

	var decay = 12*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 1, pos_under = 0;
	var s1, s2, s3, s4, ww;

	var trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);

	23.do {
		enva = EnvGen.ar(Env.perc(attack,decay, amp/under, [-4, -4]), trig);
		envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			// aToW.collect(_.rand2),  // actually this isn't doing what you think
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.003), pos: pos_under);
		s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.003), pos: pos_under.neg);
		s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.003), pos: pos_over);
		s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.003), pos: pos_over.neg);

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);
		pos_over = over.linlin(2/1, 24/1, 1/24, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(8, s1*envd1*el1);
		Out.ar(10, s2*envd1*el2);
		Out.ar(8, s3*envd2*el1);
		Out.ar(10, s4*envd2*el2);

		sig1 = Pan2.ar(InFeedback.ar(8), pos: xc, level: EnvGen.ar(Env.perc(attack, decay, w1, [-4, -4])));
		sig2 = Pan2.ar(InFeedback.ar(9), pos: xc, level: EnvGen.ar(Env.perc(attack, decay, w2, [-4, -4])));
		sig3 = Pan2.ar(InFeedback.ar(10), pos: yc, level: EnvGen.ar(Env.perc(attack, decay, w3, [-4, -4])));
		sig4 = Pan2.ar(InFeedback.ar(11), pos: yc, level: EnvGen.ar(Env.perc(attack, decay, w4, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		// you could do this a bit more efficiently
		// by making ONE Spherical object in a variable,
		// then asking the variable for x y and z
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);
		sph.rotate(angle);

		Out.ar(0, sig1);
		Out.ar(2, sig2);
		Out.ar(4, sig3);
		Out.ar(6, sig4);


		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
)



(
var aPattern = Pexprand(1, 20, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	// all 23 will make separate streams
	// but there's a subtle thing about array args
	// in events (the 'collect')
	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
	\angle,Pexprand(0.01,360,inf),
	\w1,Pexprand(0.5,1,inf),\w2,Pexprand(0.5,1,inf),\w3,Pexprand(0.5,1,inf),\w4,Pexprand(0.5,1,inf),\w5,Pexprand(0.5,1,inf),\w6,Pexprand(0.5,1,inf);

)).play(quant:1)
)

Pdef(\1).stop