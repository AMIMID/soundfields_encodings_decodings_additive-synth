s.options.numWireBufs = 1024;

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=6;
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
SynthDef.new(\id1, { arg dur = 1, interval = 1, pr, y = 1,delay=1,w=1;

	var aToW = NamedControl.kr(\aToW, 0 ! 23);

	var sig1, sig2, sig3, sig4, x = 0, amp = 1, fund = (1026 * 4);
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1, attack = 0.01;
	var xo = 1, yo = 0, xu=0, yu=1;
	var aToWNeg = aToW.neg;

	// you have amp1, so you don't need to recalculate twice
	var amp1 = 2.pow(interval/12);
	var i = fund * amp1, ii = fund / amp1;

	var aud;

	var pan_over,pan_under;

	var decay = 8*((sqrt(5)+1)/2), el1 = 1, el2 = 1;
	var pos_over = 1, pos_under = 0;
	var s1, s2, s3, s4;

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


		sig1 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: envb), (ii*over+envf), 0.003), xpos: xo, ypos: yo, level: EnvGen.ar(Env.perc(attack, decay, pos_over, [-4, -4])));
		sig2 = Pan4.ar(BPF.ar(BrownNoise.ar(mul: enva), (i*under+envf), 0.003), xpos: xu, ypos: yu, level: EnvGen.ar(Env.perc(attack, decay, pos_under, [-4, -4])));

		x = x+1;
		over = (x+1)/1;
		under = 1/(x+1);
		pos_over = over.linlin(2/1, 24/1, 1/2, 1);
		pos_under = under.wrap(1, 0);

		pan_over = exp(Complex(0,1)*((sqrt(5)+1)/2)*over);
		pan_under = exp(Complex(0,1)*((sqrt(5)+1)/2)*under);

		xo = pan_over.real;
		yo = pan_over.imag;
		xu = pan_over.real;
		yu = pan_over.imag;

		Out.ar(0, sig1*envd2);
		Out.ar(0, sig2*envd1);


		// 1.wait;  instead, delay the trigger
		trig = TDelay.ar(trig, delay);
	};
}).add;
)



(
var aPattern = Pexprand(1, 20, inf);
var wPattern1 = Pxrand([0, 0, 0, 0, 0, 0, 0, 1], inf),
wPattern2 = Pxrand([0, 0, 1], inf);
var panPattern = Pexprand(0.01pi, 0.1pi, inf);

Pdef(\1, Pbind(\instrument, \id1,
	\dur, Pexprand(4, 8, inf),

	// all 23 will make separate streams
	// but there's a subtle thing about array args
	// in events (the 'collect')
	\aToW, Ptuple(Array.fill(23, aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72], inf),
	\pr, Pexprand(0.1, 0.2, inf),
	\delay,Pexprand(0.01,1,inf);

)).play(quant:1)
)

Pdef(\1).stop