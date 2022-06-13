s.options.numWireBufs = 1024;

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=16;
TempoClock.default.tempo_(120/100);
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
SynthDef.new(\id1, { arg dur = 1, interval = 1, pr, y = 1, sc1=1, sc2=1,angle=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);
	var sig1, sig2, sig3, sig4, x = 0, amp = 1, fund = (1026 * 4)*(1/1);
	var enva, envb, envd1, envd2, envf;
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

	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, w=1/2;

	var trig = Impulse.ar(0);
	var q1,q2;
   var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
	var pan1=1,pan2=1,pan3=1,pan4=1,pan5=1,pan6=1,pan7=1,pan8=1;

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);

env=EnvGen.ar(Env.perc(attack,decay,w),doneAction:2);


	11.do {
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
		pos_over = over.linlin(2/1, 12/1, 1/12, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(14, s1*envd1*pr);
		Out.ar(14, s2*envd1*pr);
		Out.ar(14, s3*envd2*pr);
		Out.ar(14, s4*envd2*pr);

		sig1 = Pan4.ar(InFeedback.ar(14), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(15), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		// you could do this a bit more efficiently
		// by making ONE Spherical object in a variable,
		// then asking the variable for x y and z
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		sph.rotate(angle.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);

		Out.ar(6, sig1);
		Out.ar(10, sig2);

	q1=Quaternion.new(sc1,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
    q2=Quaternion.new(sc2,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
	pan1=q1.a;
	pan2=q1.b;
	pan3=q1.c;
	pan4=q1.d;
	pan5=q2.a;
	pan6=q2.b;
	pan7=q2.c;
	pan8=q2.d;
	aud1=PanAz.ar(6,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env,width:1);aud2=PanAz.ar(6,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env,width:1);
	aud3=PanAz.ar(6,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env,width:1);aud4=PanAz.ar(6,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env,width:1);
 aud5=PanAz.ar(6,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env,width:1);aud6=PanAz.ar(6,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env,width:1);
aud7=PanAz.ar(6,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env,width:1);aud8=PanAz.ar(6,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env,width:1);

			Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));



		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, pr, y = 1, sc1=1, sc2=1,angle=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);
	var sig1, sig2, sig3, sig4, x = 0, amp = 2/3, fund = (1026 * 4)*(4/3);
	var enva, envb, envd1, envd2, envf;
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

	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, w=1/2;

	var trig = Impulse.ar(0);
	var q1,q2;
   var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
	var pan1=1,pan2=1,pan3=1,pan4=1,pan5=1,pan6=1,pan7=1,pan8=1;

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);

env=EnvGen.ar(Env.perc(attack,decay,w),doneAction:2);


	11.do {
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
		pos_over = over.linlin(2/1, 12/1, 1/12, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(14, s1*envd1*pr);
		Out.ar(14, s2*envd1*pr);
		Out.ar(14, s3*envd2*pr);
		Out.ar(14, s4*envd2*pr);

		sig1 = Pan4.ar(InFeedback.ar(14), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(15), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		// you could do this a bit more efficiently
		// by making ONE Spherical object in a variable,
		// then asking the variable for x y and z
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		sph.rotate(angle.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);

		Out.ar(6, sig1);
		Out.ar(10, sig2);

	q1=Quaternion.new(sc1,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
    q2=Quaternion.new(sc2,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
	pan1=q1.a;
	pan2=q1.b;
	pan3=q1.c;
	pan4=q1.d;
	pan5=q2.a;
	pan6=q2.b;
	pan7=q2.c;
	pan8=q2.d;

	aud1=PanAz.ar(6,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env,width:1);aud2=PanAz.ar(6,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env,width:1);
	aud3=PanAz.ar(6,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env,width:1);aud4=PanAz.ar(6,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env,width:1);
 aud5=PanAz.ar(6,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env,width:1);aud6=PanAz.ar(6,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env,width:1);
aud7=PanAz.ar(6,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env,width:1);aud8=PanAz.ar(6,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env,width:1);

			Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));



		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
(
SynthDef.new(\id3, { arg dur = 1, interval = 1, pr, y = 1, sc1=1, sc2=1,angle=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);
	var sig1, sig2, sig3, sig4, x = 0, amp = 3/4, fund = (1026 * 4)*(3/2);
	var enva, envb, envd1, envd2, envf;
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

	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, w=1/2;

	var trig = Impulse.ar(0);
	var q1,q2;
   var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
	var pan1=1,pan2=1,pan3=1,pan4=1,pan5=1,pan6=1,pan7=1,pan8=1;

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);

env=EnvGen.ar(Env.perc(attack,decay,w),doneAction:2);


	11.do {
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
		pos_over = over.linlin(2/1, 12/1, 1/12, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(14, s1*envd1*pr);
		Out.ar(14, s2*envd1*pr);
		Out.ar(14, s3*envd2*pr);
		Out.ar(14, s4*envd2*pr);

		sig1 = Pan4.ar(InFeedback.ar(14), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(15), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		// you could do this a bit more efficiently
		// by making ONE Spherical object in a variable,
		// then asking the variable for x y and z
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		sph.rotate(angle.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);

		Out.ar(6, sig1);
		Out.ar(10, sig2);

	q1=Quaternion.new(sc1,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
    q2=Quaternion.new(sc2,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
	pan1=q1.a;
	pan2=q1.b;
	pan3=q1.c;
	pan4=q1.d;
	pan5=q2.a;
	pan6=q2.b;
	pan7=q2.c;
	pan8=q2.d;

	aud1=PanAz.ar(6,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env,width:1);aud2=PanAz.ar(6,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env,width:1);
	aud3=PanAz.ar(6,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env,width:1);aud4=PanAz.ar(6,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env,width:1);
 aud5=PanAz.ar(6,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env,width:1);aud6=PanAz.ar(6,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env,width:1);
aud7=PanAz.ar(6,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env,width:1);aud8=PanAz.ar(6,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env,width:1);

			Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));



		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
(
SynthDef.new(\id4, { arg dur = 1, interval = 1, pr, y = 1, sc1=1, sc2=1,angle=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);
	var sig1, sig2, sig3, sig4, x = 0, amp = 1/2, fund = (1026 * 4)*(2/1);
	var enva, envb, envd1, envd2, envf;
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

	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 0, pos_under = 1;
	var s1, s2, s3, s4, w=1/2;

	var trig = Impulse.ar(0);
	var q1,q2;
   var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
	var pan1=1,pan2=1,pan3=1,pan4=1,pan5=1,pan6=1,pan7=1,pan8=1;

	envd1 = EnvGen.ar(Env.sine((decay), amp/amp1), doneAction: 2);
	envd2 = EnvGen.ar(Env.sine((decay), amp*amp1), doneAction: 2);

env=EnvGen.ar(Env.perc(attack,decay,w),doneAction:2);


	11.do {
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
		pos_over = over.linlin(2/1, 12/1, 1/12, 1);
		pos_under = under.wrap(1, 0);

		Out.ar(14, s1*envd1*pr);
		Out.ar(14, s2*envd1*pr);
		Out.ar(14, s3*envd2*pr);
		Out.ar(14, s4*envd2*pr);

		sig1 = Pan4.ar(InFeedback.ar(14), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el1, [-4, -4])));
		sig2 = Pan4.ar(InFeedback.ar(15), xpos: xc, ypos: yc, level: EnvGen.ar(Env.perc(attack, decay, el2, [-4, -4])));

		an = an+137.5;
		pang = an.wrap(0, 360);
		// you could do this a bit more efficiently
		// by making ONE Spherical object in a variable,
		// then asking the variable for x y and z
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		sph.rotate(angle.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		el2 = zc.neg.wrap(0, 1);

		Out.ar(6, sig1);
		Out.ar(10, sig2);

	q1=Quaternion.new(sc1,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
    q2=Quaternion.new(sc2,pang.linlin(0,360,0,1),pang.linlin(0,360,0,1),pang.linlin(0,360,0,1));
	pan1=q1.a;
	pan2=q1.b;
	pan3=q1.c;
	pan4=q1.d;
	pan5=q2.a;
	pan6=q2.b;
	pan7=q2.c;
	pan8=q2.d;

	aud1=PanAz.ar(6,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env,width:1);aud2=PanAz.ar(6,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env,width:1);
	aud3=PanAz.ar(6,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env,width:1);aud4=PanAz.ar(6,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env,width:1);
 aud5=PanAz.ar(6,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env,width:1);aud6=PanAz.ar(6,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env,width:1);
aud7=PanAz.ar(6,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env,width:1);aud8=PanAz.ar(6,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env,width:1);

			Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));



		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, 1/(decay.rand));
	};
}).add;
);
)


(
var aPattern = Pexprand(1, 20, inf);
(
Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	// all 23 will make separate streams
	// but there's a subtle thing about array args
	// in events (the 'collect')
	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },
	\angle,Pexprand(1,360,inf),
	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
\sc1, Pexprand(0.01pi, 0.1pi, inf),
	\sc2, Pexprand(0.01pi, 0.1pi, inf);
)).play(quant:1)
);
(
Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(4, 8, inf),

	// all 23 will make separate streams
	// but there's a subtle thing about array args
	// in events (the 'collect')
	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
\sc1, Pexprand(0.01pi, 0.1pi, inf),
	\sc2, Pexprand(0.01pi, 0.1pi, inf);
)).play(quant:1)
);
(
Pdef(\3, Pbind(\instrument, \id3,
	\dur, Pexprand(4, 8, inf),

	// all 23 will make separate streams
	// but there's a subtle thing about array args
	// in events (the 'collect')
	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },
\angle,Pexprand(1,360,inf),
	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
\sc1, Pexprand(0.01pi, 0.1pi, inf),
	\sc2, Pexprand(0.01pi, 0.1pi, inf);
)).play(quant:1)
);
(
Pdef(\4, Pbind(\instrument, \id4,
	\dur, Pexprand(4, 8, inf),

	// all 23 will make separate streams
	// but there's a subtle thing about array args
	// in events (the 'collect')
	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },
\angle,Pexprand(1,360,inf),
	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
\sc1, Pexprand(0.01pi, 0.1pi, inf),
	\sc2, Pexprand(0.01pi, 0.1pi, inf);
)).play(quant:1)
)
)

Pdef(\1).stop