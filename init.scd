
// if you want to set a different port for your standalone.
// s = Server("standalone_name",NetAddr("localhost",57556));
// Server.default = s;

Server.default = s = Server.local;

/*s.waitForBoot{
  {WhiteNoise.ar * 0.1}.play;
  "hello world".postln;
};*/

(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/45);
s.options.memSize = 8192*8;
s.waitForBoot
(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1;
var a=1000,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 64);
	var  x = 0, amp = (0.15/n), fund = (220 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1/a, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = delay*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 1/2, an = 0, pang=an.wrap(0,360);

	envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	64.do {
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

	    pos = over.linlin(2, 64, 1/3, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);

		trig = TDelay.ar(trig, under);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1;
var a=10,y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 64);
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

	64.do {
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

	    pos = over.linlin(2, 64, 1/3, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);

		trig = TDelay.ar(trig, under);
	};
}).add;
)
);

(
~aPattern = Pexprand(1, 15, inf);

Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(2, 4, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(64, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22], inf),
	\presence, Pexprand(1, 1.2, inf),
	\delay, Pexprand(2,8,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
Pdef(\1, Pbind(\instrument, \id1,
\dur, Pexprand(1, 1.1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(64, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,10,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,14,20,22], inf),
	\presence, Pexprand(1, 1.2, inf),
	\delay, Pexprand(2,4,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);
);
s.meter;
s.scope;
)
