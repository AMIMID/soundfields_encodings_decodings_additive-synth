(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/40);
s.options.memSize = 8192*8;
s.waitForBoot
(
SynthDef.new(\s, {

	var  x = 0, fund = 220, over = 1, interval, am,	 tone, i, s;
	//var trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360), size=64;

	interval=EnvGen.ar(Env.new(Array.rand(size, 1, 24),Array.exprand(size-1, 0.1, 10),\sine), doneAction: 2);
    tone = 2.pow(interval/12);
	i = fund * tone;

	128.do {

	am=EnvGen.ar(Env.new(Array.exprand(size, 0.01, 1),Array.exprand(size-1, 0.1, 10),\sine), doneAction: 2);

		s = Pan2.ar(BPF.ar(SinOsc.ar(freq:over*fund,phase:pang.degrad,mul: 1/over),freq:i,rq:0.01), pos: pos,level:am*2)+
		Pan2.ar(BPF.ar(SinOsc.ar(freq:over*fund,phase:pang.neg.degrad,mul: 1/over),freq:i,rq:0.01), pos: pos.neg,level:am*2);
		   Out.ar(0, s);
		x = x+1;
		over = (x+1)/1;
		an = an+137.5;
		pang = an.wrap(0, 360);
		 pos = pang.linlin(0,360,-1,1);

	//	trig = TDelay.ar(trig, under);
	};
}).play;
)
)


Synth.new(\s)
