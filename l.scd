(
s.options.numWireBufs = 1024;
s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/40);
s.options.memSize = 8192*8;
s.waitForBoot
(
SynthDef.new(\s, {

	var  x = 0, fund = 110, over = 1, interval, am,	 tone, i, s;
	//var trig = Impulse.ar(0);
	var pos = 0, an = 0, pang=an.wrap(0,360), size=128;
	var env;

	256.do {

		am=EnvGen.ar(Env.new(Array.linrand(size, 0.1, 1),Array.linrand(size-1, 1, 15),\sine), doneAction: 2);

interval=EnvGen.ar(Env.new(Array.linrand(size, 1, 96),Array.linrand(size-1, 1, 4),\sine), doneAction: 2);
    tone = 2.pow(interval/12);
	i = fund * tone;

		s = Pan2.ar(BPF.ar(SinOsc.ar(freq:over*fund,phase:pang.degrad,mul: 1/over),freq:i,rq:0.01), pos:pos,level:1);
		//s = Pan2.ar(SinOsc.ar(freq:over*i,phase:pang.degrad,mul: 1/over), pos:pos,level:am);

		   Out.ar(0, s);
		x = x+1;
		over = (x+1)/1;
		an = an+137.5;
		pang = an.wrap(0, 360);
		 pos = pang.linlin(0,360,-1,1);
		//pos = over.linlin(1,128,0.1,1);

	//	trig = TDelay.ar(trig, under);
	};
}).play;
)
)


Synth.new(\s)
128*2


Env.new(Array.linrand(8, 0.01, 1),Array.linrand(8-1, 0.1, 10),\sine).plot



