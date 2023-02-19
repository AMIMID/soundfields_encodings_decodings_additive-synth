s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:4) ;

({Out.ar(2,SoundIn.ar(0))}.play;
s.record(bus:2,numChannels:1))

s.options.numWireBufs = 1024*4;

s.options.numOutputBusChannels=2;;
TempoClock.default.tempo_(120/80);
s.options.memSize = 8192*8;
s.waitForBoot
s.reboot;


(
SynthDef.new(\o, {
	arg n1=1, n2=1, n3=1,rotation=0.01, cf=8;
	var frequency, note1, note2, note3, detune;
	var envelope, envelopex, envelopey, envelopez;
	var osc_1, osc_2, osc_3;
	var over1, over2, over3, over4, m;
	var freq;
	var bank, angle, scale;
    var fundamental;
	var v=343;
	var l1,f2,l2;
	var modamp;

	over1=1;
	over2=2;
	over3=3;
	over4=4;
	m=0;
	frequency=1;
	bank=26;
	angle=0;
	detune=1;
	modamp=1;
	scale=modamp.reciprocal;

		 fundamental=((4*cf)-1)*((4*cf)/2);

modamp=1;
scale=modamp.reciprocal;

	note1 = 2.pow(n1/(fundamental*2));
	note2 = 2.pow(n2/(fundamental*2));
	note3 = 2.pow(n3/(fundamental*2));

	//envelope=  EnvGen.ar(Env.perc(0.01,8,scale), doneAction: 2);
	envelope=  EnvGen.ar(Env.sine(4,modamp), doneAction: 2);
	//envelopey= EnvGen.ar(Env.new([0,0,dy,0],[timey],curve:[-4,4]), doneAction: 0);
	//envelopex= EnvGen.ar(Env.new([0,dx,0],[timex],curve:[-4,4]), doneAction: 0);

	freq =(fundamental*frequency);
	l1=(v/freq);
	l2=l1/3;
	f2=(v/l2);

	bank.do {

	angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
	detune=exp(Complex(0,1)*angle);

		osc_1 = Pan2.ar((SinOsc.ar(freq:((note1*f2)*over1)+detune.real,
			mul:((cf*note1)*over1).reciprocal,
			phase:0.degrad,
			add:SinOsc.ar(freq:((note1*freq)*over1)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:0.degrad))
		*
		SinOsc.ar(freq:((note1*f2)*over3)+detune.real,
			mul:((cf*note1)*over3).reciprocal,phase:0.degrad,
		add:SinOsc.ar(freq:((note1*freq)*over3)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:0.degrad)))
		+
		(SinOsc.ar(freq:((note1*f2)*over2)+detune.real,
			mul:((cf*note1)*over2).reciprocal,phase:0.degrad,
			add:SinOsc.ar(freq:((note1*freq)*over2)+detune.real,
				mul:(((cf*note1)*over2).reciprocal)*modamp,phase:0.degrad))
		*
		SinOsc.ar(freq:((note1*f2)*over4)+detune.real,
			mul:((cf*note1)*over4).reciprocal,phase:0.degrad,
		add:SinOsc.ar(freq:((note1*freq)*over4)+detune.real,
				mul:(((cf*note1)*over4).reciprocal)*modamp,phase:0.degrad)))

		,SinOsc.ar(rotation+detune.real,phase:45.degrad));


		osc_2 = Pan2.ar((SinOsc.ar(freq:((note2*f2)*over1)+detune.real,
			mul:((cf*note2)*over1).reciprocal,phase:45.degrad,
			add:SinOsc.ar(freq:((note1*freq)*over1)+detune.real,
				mul:(((cf*note2)*over1).reciprocal)*modamp,phase:45.degrad))
		*
		SinOsc.ar(freq:((note1*f2)*over3)+detune.real,
			mul:((cf*note2)*over3).reciprocal,phase:45.degrad,
		add:SinOsc.ar(freq:((note2*freq)*over3)+detune.real,
			mul:(((cf*note2)*over1).reciprocal)*scale,phase:45.degrad)))
		+
		(SinOsc.ar(freq:((note1*f2)*over2)+detune.real,
			mul:((cf*note2)*over2).reciprocal,phase:45.degrad,
			add:SinOsc.ar(freq:((note2*freq)*over2)+detune.real,
				mul:(((cf*note2)*over2).reciprocal)*modamp,phase:45.degrad))
		*
		SinOsc.ar(freq:((note2*f2)*over4)+detune.real,
			mul:((cf*note2)*over4).reciprocal,phase:45.degrad,
		add:SinOsc.ar(freq:((note1*freq)*over4)+detune.real,
			mul:(((cf*note2)*over4).reciprocal)*modamp,phase:45.degrad)))

		,SinOsc.ar(rotation+detune.imag,phase:0.degrad));


		osc_3 = Pan2.ar((SinOsc.ar(freq:((note3*f2)*over1)+detune.real,
			mul:((cf*note3)*over1).reciprocal,phase:90.degrad,
			add:SinOsc.ar(freq:((note3*freq)*over1)+detune.real,
				mul:(((cf*note3)*over1).reciprocal)*modamp,phase:90.degrad))
		*
		SinOsc.ar(freq:((note3*f2)*over3)+detune.real,
			mul:((cf*note3)*over3).reciprocal,phase:90.degrad,
		add:SinOsc.ar(freq:((note3*freq)*over3)+detune.real,
		mul:(((cf*note3)*over1).reciprocal)*modamp,phase:90.degrad)))
		+
		(SinOsc.ar(freq:((note3*f2)*over2)+detune.real,
			mul:((cf*note3)*over2).reciprocal,phase:90.degrad,
			add:SinOsc.ar(freq:((note3*freq)*over2)+detune.real,
				mul:(((cf*note3)*over2).reciprocal)*modamp,phase:90.degrad))
		*
		SinOsc.ar(freq:((note3*f2)*over4)+detune.real,
			mul:((cf*note3)*over4).reciprocal,phase:90.degrad,
		add:SinOsc.ar(freq:((note3*freq)*over4)+detune.real,
		mul:(((cf*note3)*over4).reciprocal)*modamp,phase:90.degrad)))

		,SinOsc.ar(rotation+detune.real,phase:45.degrad));




		Out.ar(0,FreeVerb.ar(osc_1*envelope,room:scale.linlin(200.reciprocal,200000.reciprocal,1,0)));
		Out.ar(0,FreeVerb.ar(osc_2*envelope,room:scale.linlin(200.reciprocal,200000.reciprocal,1,0)));
		Out.ar(0,FreeVerb.ar(osc_3*envelope,room:scale.linlin(200.reciprocal,200000.reciprocal,1,0)));

		m = m+1;
		over1 = over1 + (m+1)/1;
		over2 = over2 + (m+1)/1;
		over3 = over3 + (m+1)/1;
		over4 = over4 + (m+1)/1;
	};
//Out.ar(0,LeakDC.ar(Pan2.ar((InFeedback.ar(2)*envelope),pos:LFNoise1.ar(speed))));
//Out.ar(0,LeakDC.ar(Pan2.ar((InFeedback.ar(3)*envelope),pos:LFNoise1.ar(speed))));


}).add;
)


(
Pdef(\1, Pbind(\instrument, \o, \dur,Pexprand(3,3,inf),
	\cf,Prand([2],inf),
	\n1,Pseq(Array.fill(8128, { arg i; i * 2 }),inf),
   \n2,Pseq(Array.fill(8128, { arg i; i * 2 }),inf),
  	\n3,Pseq(Array.fill(8128, { arg i; i * 2 }),inf),
	\rotation,Pexprand(0.1,10,inf);
)).play(quant:1);)

///
Array.fib(5, 1 ).postln;
((4*32)-1)*((4*32)/2);
////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\/////////////////\\\\\\\\\\\\\\\/////////////////

28*(8128/28)