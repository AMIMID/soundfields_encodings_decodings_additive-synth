s.options.numWireBufs = 1024;

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=20;
TempoClock.default.tempo_(120/90);
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
SynthDef.new(\id1, { arg dur = 1, interval = 1, pr, y = 1,w1=1,w2=1,w3=1,w4=1,w5=1,w6=1,angle=137.5;

	var aToW = NamedControl.kr(\aToW, 0 ! 15);

	var sig1, sig2, sig3,sig4, x = 0, amp = 1, fund = (1026 * 4)*1;
	var enva, envb, envd1, envd2, env1,env2,env3, env4, env5, env6, envf;
	var under = 1, over = 1, attack = 0.01;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;

	// you have amp1, so you don't need to recalculate twice
	var amp1 = 2.pow(interval/12);
	var i = fund * amp1, ii = fund / amp1;
	var aud;
	var env;

	var sph;

	var decay = 12*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, ww;

	var trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);


	env1 = EnvGen.ar(Env.perc(attack, decay, w1), doneAction: 2);
	env2 = EnvGen.ar(Env.perc(attack, decay, w2), doneAction: 2);
	env3 = EnvGen.ar(Env.perc(attack, decay, w3), doneAction: 2);
	env4 = EnvGen.ar(Env.perc(attack, decay, w4), doneAction: 2);
	env5 = EnvGen.ar(Env.perc(attack, decay, w5), doneAction: 2);
	env6 = EnvGen.ar(Env.perc(attack, decay, w6), doneAction: 2);


	15.do {
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

		s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under);
		s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under.neg);
		s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over);
		s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over.neg);

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);
		pos_over = over.linlin(2/1, 16/1, 1/2, 1).postln;
		pos_under = under.wrap(1, 0);

		Out.ar(18, s1*envd1*pr);
		Out.ar(18, s2*envd1*pr);
		Out.ar(18, s3*envd2*pr);
		Out.ar(18, s4*envd2*pr);

        sig1 = Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(19), xpos: yc, ypos: xc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig3=  Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: zc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));
		sig4=  Pan4.ar(InFeedback.ar(19), xpos: zc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);
	sph.rotate(angle.degrad);

			Out.ar(6, sig1);
		Out.ar(6, sig4);
		Out.ar(10, sig2);
		Out.ar(14, sig3);

Out.ar(0,InFeedback.ar(6)*env1);Out.ar(0,InFeedback.ar(14)*env1);
Out.ar(1,InFeedback.ar(7)*env2);Out.ar(1,InFeedback.ar(11)*env2);
Out.ar(2,InFeedback.ar(8)*env3);Out.ar(2,InFeedback.ar(16)*env3);
Out.ar(3,InFeedback.ar(9)*env4);Out.ar(3,InFeedback.ar(13)*env4);
Out.ar(4,InFeedback.ar(10)*env5);Out.ar(4,InFeedback.ar(15)*env5);
Out.ar(5,InFeedback.ar(12)*env6);Out.ar(5,InFeedback.ar(17)*env6);


		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, pr, y = 1,w1=1,w2=1,w3=1,w4=1,w5=1,w6=1,angle=137.5;

	var aToW = NamedControl.kr(\aToW, 0 ! 15);

	var sig1, sig2, sig3,sig4, x = 0, amp = 2/3, fund = (1026 * 4)*(4/3);
	var enva, envb, envd1, envd2, env1,env2,env3, env4, env5, env6, envf;
	var under = 1, over = 1, attack = 0.01;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;

	// you have amp1, so you don't need to recalculate twice
	var amp1 = 2.pow(interval/12);
	var i = fund * amp1, ii = fund / amp1;
	var aud;
	var env;

	var sph;

	var decay = 12*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, ww;

	var trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);


	env1 = EnvGen.ar(Env.perc(attack, decay, w1), doneAction: 2);
	env2 = EnvGen.ar(Env.perc(attack, decay, w2), doneAction: 2);
	env3 = EnvGen.ar(Env.perc(attack, decay, w3), doneAction: 2);
	env4 = EnvGen.ar(Env.perc(attack, decay, w4), doneAction: 2);
	env5 = EnvGen.ar(Env.perc(attack, decay, w5), doneAction: 2);
	env6 = EnvGen.ar(Env.perc(attack, decay, w6), doneAction: 2);


	15.do {
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

		s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under);
		s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under.neg);
		s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over);
		s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over.neg);

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);
		pos_over = over.linlin(2/1, 16/1, 1/2, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(18, s1*envd1*pr);
		Out.ar(18, s2*envd1*pr);
		Out.ar(18, s3*envd2*pr);
		Out.ar(18, s4*envd2*pr);

sig1 = Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(19), xpos: yc, ypos: xc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig3=  Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: zc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));
		sig4=  Pan4.ar(InFeedback.ar(19), xpos: zc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);
			sph.rotate(angle.degrad);

			Out.ar(6, sig1);
		Out.ar(6, sig4);
		Out.ar(10, sig2);
		Out.ar(14, sig3);
Out.ar(0,InFeedback.ar(6)*env1);Out.ar(0,InFeedback.ar(14)*env1);
Out.ar(1,InFeedback.ar(7)*env2);Out.ar(1,InFeedback.ar(11)*env2);
Out.ar(2,InFeedback.ar(8)*env3);Out.ar(2,InFeedback.ar(16)*env3);
Out.ar(3,InFeedback.ar(9)*env4);Out.ar(3,InFeedback.ar(13)*env4);
Out.ar(4,InFeedback.ar(10)*env5);Out.ar(4,InFeedback.ar(15)*env5);
Out.ar(5,InFeedback.ar(12)*env6);Out.ar(5,InFeedback.ar(17)*env6);


		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
(
SynthDef.new(\id3, { arg dur = 1, interval = 1, pr, y = 1,w1=1,w2=1,w3=1,w4=1,w5=1,w6=1,angle=137.5;

	var aToW = NamedControl.kr(\aToW, 0 ! 15);

	var sig1, sig2, sig3,sig4, x = 0, amp = 3/4, fund = (1026 * 4)*(3/2);
	var enva, envb, envd1, envd2, env1,env2,env3, env4, env5, env6, envf;
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
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, ww;

	var trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);


	env1 = EnvGen.ar(Env.perc(attack, decay, w1), doneAction: 2);
	env2 = EnvGen.ar(Env.perc(attack, decay, w2), doneAction: 2);
	env3 = EnvGen.ar(Env.perc(attack, decay, w3), doneAction: 2);
	env4 = EnvGen.ar(Env.perc(attack, decay, w4), doneAction: 2);
	env5 = EnvGen.ar(Env.perc(attack, decay, w5), doneAction: 2);
	env6 = EnvGen.ar(Env.perc(attack, decay, w6), doneAction: 2);


	15.do {
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

		s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under);
		s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under.neg);
		s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over);
		s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over.neg);

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);
		pos_over = over.linlin(2/1, 16/1, 1/2, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(18, s1*envd1*pr);
		Out.ar(18, s2*envd1*pr);
		Out.ar(18, s3*envd2*pr);
		Out.ar(18, s4*envd2*pr);

sig1 = Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(19), xpos: yc, ypos: xc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig3=  Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: zc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));
		sig4=  Pan4.ar(InFeedback.ar(19), xpos: zc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);
			sph.rotate(angle.degrad);

		Out.ar(6, sig1);
		Out.ar(6, sig4);
		Out.ar(10, sig2);
		Out.ar(14, sig3);

Out.ar(0,InFeedback.ar(6)*env1);Out.ar(0,InFeedback.ar(14)*env1);
Out.ar(1,InFeedback.ar(7)*env2);Out.ar(1,InFeedback.ar(11)*env2);
Out.ar(2,InFeedback.ar(8)*env3);Out.ar(2,InFeedback.ar(16)*env3);
Out.ar(3,InFeedback.ar(9)*env4);Out.ar(3,InFeedback.ar(13)*env4);
Out.ar(4,InFeedback.ar(10)*env5);Out.ar(4,InFeedback.ar(15)*env5);
Out.ar(5,InFeedback.ar(12)*env6);Out.ar(5,InFeedback.ar(17)*env6);


		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
(
SynthDef.new(\id4, { arg dur = 1, interval = 1, pr, y = 1,w1=1,w2=1,w3=1,w4=1,w5=1,w6=1,angle=137.5;

	var aToW = NamedControl.kr(\aToW, 0 ! 15);

	var sig1, sig2, sig3,sig4, x = 0, amp = 1/2, fund = (1026 * 4)*2;
	var enva, envb, envd1, envd2, env1,env2,env3, env4, env5, env6, envf;
	var under = 1, over = 1, attack = 0.01;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;

	// you have amp1, so you don't need to recalculate twice
	var amp1 = 2.pow(interval/12);
	var i = fund * amp1, ii = fund / amp1;
	// "x1 x2 x3" etc. means: use arrays!
	// var aud1, aud2, aud3, aud4, aud5, aud6, aud7, aud8;
	// var env1, env2, env3, env4, env5, env6, env7, env8;
	var aud;
	var env;

	var sph;

	var decay = 12*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, ww;

	var trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);


	env1 = EnvGen.ar(Env.perc(attack, decay, w1), doneAction: 2);
	env2 = EnvGen.ar(Env.perc(attack, decay, w2), doneAction: 2);
	env3 = EnvGen.ar(Env.perc(attack, decay, w3), doneAction: 2);
	env4 = EnvGen.ar(Env.perc(attack, decay, w4), doneAction: 2);
	env5 = EnvGen.ar(Env.perc(attack, decay, w5), doneAction: 2);
	env6 = EnvGen.ar(Env.perc(attack, decay, w6), doneAction: 2);


	15.do {
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

		s1 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under);
		s2 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.01), pos: pos_under.neg);
		s3 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over);
		s4 = Pan2.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.01), pos: pos_over.neg);

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);
		pos_over = over.linlin(2/1, 16/1, 1/2, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(18, s1*envd1*pr);
		Out.ar(18, s2*envd1*pr);
		Out.ar(18, s3*envd2*pr);
		Out.ar(18, s4*envd2*pr);

		sig1 = Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(19), xpos: yc, ypos: xc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig3=  Pan4.ar(InFeedback.ar(18), xpos: xc, ypos: zc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));
		sig4=  Pan4.ar(InFeedback.ar(19), xpos: zc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);
		sph.rotate(angle.degrad);

			Out.ar(6, sig1);
		Out.ar(6, sig4);
		Out.ar(10, sig2);
		Out.ar(14, sig3);

Out.ar(0,InFeedback.ar(6)*env1);Out.ar(0,InFeedback.ar(14)*env1);
Out.ar(1,InFeedback.ar(7)*env2);Out.ar(1,InFeedback.ar(11)*env2);
Out.ar(2,InFeedback.ar(8)*env3);Out.ar(2,InFeedback.ar(16)*env3);
Out.ar(3,InFeedback.ar(9)*env4);Out.ar(3,InFeedback.ar(13)*env4);
Out.ar(4,InFeedback.ar(10)*env5);Out.ar(4,InFeedback.ar(15)*env5);
Out.ar(5,InFeedback.ar(12)*env6);Out.ar(5,InFeedback.ar(17)*env6);

		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
)

(
var aPattern = Pexprand(1, 55, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(15, aPattern))
	.collect { |array| [array] },

	\interval, Prand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
	\angle,Pexprand(0.01, 137.5, inf),
		\w1,Pexprand(0.1,0.2,inf),\w2,Pexprand(0.1,0.2,inf),\w3,Pexprand(0.1,0.2,inf),\w4,Pexprand(0.1,0.2,inf),\w5,Pexprand(0.1,0.2,inf),\w6,Pexprand(0.1,0.2,inf);

)).play(quant:1);
Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(15, aPattern))
	.collect { |array| [array] },

	\interval, Prand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
	\angle,Pexprand(0.01, 137.5, inf),
		\w1,Pexprand(0.1,0.2,inf),\w2,Pexprand(0.1,0.2,inf),\w3,Pexprand(0.1,0.2,inf),\w4,Pexprand(0.1,0.2,inf),\w5,Pexprand(0.1,0.2,inf),\w6,Pexprand(0.1,0.2,inf);
)).play(quant:1);
Pdef(\3, Pbind(\instrument, \id3,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(15, aPattern))
	.collect { |array| [array] },

	\interval, Prand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
	\angle,Pexprand(0.01, 137.5, inf),
		\w1,Pexprand(0.1,0.2,inf),\w2,Pexprand(0.1,0.2,inf),\w3,Pexprand(0.1,0.2,inf),\w4,Pexprand(0.1,0.2,inf),\w5,Pexprand(0.1,0.2,inf),\w6,Pexprand(0.1,0.2,inf);

)).play(quant:1);
Pdef(\4, Pbind(\instrument, \id4,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(15, aPattern))
	.collect { |array| [array] },

	\interval, Prand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
	\angle,Pexprand(0.01, 137.5, inf),
	\w1,Pexprand(0.1,0.2,inf),\w2,Pexprand(0.1,0.2,inf),\w3,Pexprand(0.1,0.2,inf),\w4,Pexprand(0.1,0.2,inf),\w5,Pexprand(0.1,0.2,inf),\w6,Pexprand(0.1,0.2,inf);

)).play(quant:1);
)


Pdef(\1).stop
Pdef(\2).stop
Pdef(\3).stop
Pdef(\4).stop