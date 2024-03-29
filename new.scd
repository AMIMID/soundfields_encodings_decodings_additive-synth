s.options.numWireBufs = 1024;

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=8;
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
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, y = 1, delay =1 , n;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);
	var wx = NamedControl.kr(\w, 0 ! 4);
	var panx = NamedControl.kr(\pan, 0 ! 4);
	var speedx = NamedControl.kr(\s, 0 ! 4);
	var sig1, sig2, x = 0, amp = (1/n), fund = (258 * 8)*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1, attack = 0.01;
	var an = 0, pang = an.wrap(0, 360);
	var xc = 0, yc = 0, zc = 0;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund / tone;
	var aud,env,sph;
	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var s1, s2, trig = Impulse.ar(0);

	envd1 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp*tone), doneAction: 2);

	env = wx.collect { |w|
		EnvGen.ar(Env.perc(attack, decay, w), doneAction: 2)
	};

	23.do {
		enva = EnvGen.ar(Env.perc(attack,decay, amp/under, [-4, -4]), trig);
		//envb = EnvGen.ar(Env.perc(attack,decay, amp/over, [-4, -4]), trig);

		envf = EnvGen.ar(Env(
			aToW.collect { |letter, i|
				Rand(aToWNeg[i], letter)
			},
			Array.fill(aToW.size - 1, { decay.rand }),
			[-4]
		), trig);

		s1 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.003), xpos: xc, ypos: yc,level:presence*el1);
		//s2 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.003), pos: pos_under.neg);

			Out.ar(4, s1*envd1);
		//Out.ar(10, s2*envb);

		aud = Array.fill(4, { |i|
			PanAz.ar(4, InFeedback.ar(4 + i),
				pos: LFSaw.ar(speedx),
			orientation:panx[i],
				level: env[i],
				width: 1
			)
		});

		aud.do { |channel| Out.ar(0, channel) };

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);

		an = an+137.5;
		pang = an.wrap(0, 360);
		sph = Spherical.new(1, pang.degrad, pang.degrad);
		xc = sph.x;
		yc = sph.y;
		zc = sph.z;
		el1 = zc.wrap(0, 1);
		//el2 = zc.neg.wrap(0, 1)

		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, delay);
	};
}).add;
)



(
var aPattern = Pexprand(1, 20, inf);
var wPattern1 = Pxrand([0, 0, 0, 0, 0, 0, 0, 1], inf), wPattern2 = Pxrand([0, 0, 1], inf);
var panPattern = Prand([0,1,2,3], inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\presence, Pexprand(0.1, 0.2, inf),
	\delay, Pexprand(0.1,2,inf),
	\n, Prand([(4/3),(3/2),2],inf),

	\w, Ptuple(
		[wPattern1.dup(3), wPattern2].dup(2).flat,
		inf
	).collect { |array| [array] },

	\pan, Ptuple(Array.fill(4, panPattern)).collect { |array| [array] }

)).play(quant:1)
)

Pdef(\1).stop


