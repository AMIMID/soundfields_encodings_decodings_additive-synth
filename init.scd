
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
s.options.numOutputBusChannels=4;
TempoClock.default.tempo_(120/30);
s.options.memSize = 8192*8;
s.waitForBoot;

(
(
SynthDef.new(\id1, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1,a=100;
var y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 15);
	var  x = 0, amp = (0.3/n), fund = (110 )*n;
	var enva, envb, envd1, envd2, envf;
	var under = 1, over = 1,attack=0.01;
	var aToWNeg = aToW.neg;
	var tone = 2.pow(interval/12);
	var i = fund * tone, ii = fund *tone;
	var decay = 3*((sqrt(5)+1)/2);
	var s1, s2, s3, s4, trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360),poss=0;

	envd2 = EnvGen.ar(Env.perc(attack,(decay), amp/tone), doneAction: 2);
	//envd2 = EnvGen.ar(Env.sine((decay), amp/tone), doneAction: 2);

	15.do {
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
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 16, 1/2, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);
	poss=exp(Complex(0,1)*pang);

		trig = TDelay.ar(trig, under);
	};
}).add;
);
(
SynthDef.new(\id2, { arg dur = 1, interval = 1, presence = 1, delay =1 , n=1, wide=1,a=1;
var y=0;
	var aToW = NamedControl.kr(\aToW, 0 ! 15);
	var  x = 0, amp = (0.6/n), fund = (55 )*n;
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

	15.do {
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
			y=y+a;
		over = (x+1)/1;
		under = 1/(y+a);

	    pos = over.linlin(2, 16, 1/2, 1);

			an = an+137.5;
		pang = an.wrap(0, 360);
		poss=exp(Complex(0,1)*pang);

		trig = TDelay.ar(trig, under);
	};
}).add;
)
);

(
 ~aPattern = Pexprand(1, 10, inf);

Pdef(\1, Pbind(\instrument, \id1,
\dur, Pexprand(1, 1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(15, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,12,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,12,20,22], inf),
	\presence, Pexprand(1, 1.5, inf),
	//\a, Pexprand(100,1000,inf),
	//\delay, Pexprand(0.01,0.2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
	//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1);

Pdef(\2, Pbind(\instrument, \id2,
	\dur, Pexprand(1, 1, inf),
//	\dur, Prand([0.2,0.4], inf),

	\aToW, Ptuple(Array.fill(15, ~aPattern))
	.collect { |array| [array] },

	\interval, Pxrand( [
		5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,17,20,12,24,5,17,20,8,22,12,19,20,
		5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,17,22,12,24,5,17,22,10,24,12,20,22], inf),
	\presence, Pexprand(1, 1.5, inf),
	//\a, Pexprand(1,100,inf),
	//\delay, Pexprand(0.01,0.2,inf),
	//\n, Prand([1,(4/3),(3/2),2],inf),
//\wide,Prand([0.5,0.6,0.7,0.8,0.9,1],inf);

)).play(quant:1)
);
s.meter;
)
