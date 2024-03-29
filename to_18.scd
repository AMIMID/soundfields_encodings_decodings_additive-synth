s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:12) ;

({Out.ar(2,SoundIn.ar(0))}.play;
s.record(bus:2,numChannels:1))

s.options.numWireBufs = 1024*4;

s.options.numOutputBusChannels=18;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot
s.reboot;


(
SynthDef.new(\to18, {
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
	var env,level,duration,face1,face2,face3,face4;
	var edge1a,edge1b,edge1c,edge2a,edge2b,edge2c;

	over1=1;
	over2=2;
	over3=3;
	over4=4;
	m=0;
	frequency=1;
	bank=72;
	angle=0;
	detune=1;
	modamp=343/440;
	scale=modamp.reciprocal;

		 fundamental=((4*cf)-1)*((4*cf)/2);

modamp=1;
scale=modamp.reciprocal;

	note1 = 2.pow(n1/(fundamental*2));
	note2 = 2.pow(n2/(fundamental*2));
	note3 = 2.pow(n3/(fundamental*2));

	//envelope=  EnvGen.ar(Env.perc(0.01,8,scale), doneAction: 2);
	envelope=  EnvGen.ar(Env.sine(4,scale), doneAction: 2);
	//envelopey= EnvGen.ar(Env.new([0,0,dy,0],[timey],curve:[-4,4]), doneAction: 0);
	//envelopex= EnvGen.ar(Env.new([0,dx,0],[timex],curve:[-4,4]), doneAction: 0);

	freq =(fundamental*frequency);
	l1=(v/freq);
	l2=l1/modamp;
	f2=(v/l2);



	bank.do{

		angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
	detune=exp(Complex(0,1)*angle);

	osc_1 = (Pan2.ar((SinOsc.ar(freq:((note1*f2)*over1)+detune.real,
			mul:((cf*note1)*over1).reciprocal,
			phase:0.degrad,
			add:SinOsc.ar(freq:((note1*freq)*over1)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:over1.wrap(0,360).degrad))
		*
		SinOsc.ar(freq:((note1*f2)*over3)+detune.real,
			mul:((cf*note1)*over3).reciprocal,phase:over3.wrap(0,360).degrad,
		add:SinOsc.ar(freq:((note1*freq)*over3)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:over3.wrap(0,360).degrad)))
		+
		(SinOsc.ar(freq:((note1*f2)*over2)+detune.real,
			mul:((cf*note1)*over2).reciprocal,phase:over2.wrap(0,360).degrad,
			add:SinOsc.ar(freq:((note1*freq)*over2)+detune.real,
				mul:(((cf*note1)*over2).reciprocal)*modamp,phase:over2.wrap(0,360).degrad))
		*
		SinOsc.ar(freq:((note1*f2)*over4)+detune.real,
			mul:((cf*note1)*over4).reciprocal,phase:over4.wrap(0,360).degrad,
		add:SinOsc.ar(freq:((note1*freq)*over4)+detune.real,
				mul:(((cf*note1)*over4).reciprocal)*modamp,phase:over4.wrap(0,360).degrad)))

		,SinOsc.ar(rotation+detune.real,phase:0.degrad)));

		osc_2 = (Pan2.ar((SinOsc.ar(freq:((note2*f2)*over1)+detune.real,
			mul:((cf*note1)*over1).reciprocal,
			phase:0.degrad,
			add:SinOsc.ar(freq:((note1*freq)*over1)+detune.real,
				mul:(((cf*note2)*over1).reciprocal)*modamp,phase:over1.wrap(0,360).degrad))
		*
		SinOsc.ar(freq:((note2*f2)*over3)+detune.real,
			mul:((cf*note1)*over3).reciprocal,phase:over3.wrap(0,360).degrad,
		add:SinOsc.ar(freq:((note2*freq)*over3)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:over3.wrap(0,360).degrad)))
		+
		(SinOsc.ar(freq:((note2*f2)*over2)+detune.real,
			mul:((cf*note2)*over2).reciprocal,phase:over2.wrap(0,360).degrad,
			add:SinOsc.ar(freq:((note1*freq)*over2)+detune.real,
				mul:(((cf*note1)*over2).reciprocal)*modamp,phase:over2.wrap(0,360).degrad))
		*
		SinOsc.ar(freq:((note2*f2)*over4)+detune.real,
			mul:((cf*note2)*over4).reciprocal,phase:over4.wrap(0,360).degrad,
		add:SinOsc.ar(freq:((note1*freq)*over4)+detune.real,
				mul:(((cf*note1)*over4).reciprocal)*modamp,phase:over4.wrap(0,360).degrad)))

		,SinOsc.ar(rotation+detune.imag,phase:45.degrad)));

		osc_3 = (Pan2.ar((SinOsc.ar(freq:((note3*f2)*over1)+detune.real,
			mul:((cf*note3)*over1).reciprocal,
			phase:0.degrad,
			add:SinOsc.ar(freq:((note1*freq)*over1)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:over1.wrap(0,360).degrad))
		*
		SinOsc.ar(freq:((note3*f2)*over3)+detune.real,
			mul:((cf*note1)*over3).reciprocal,phase:over3.wrap(0,360).degrad,
		add:SinOsc.ar(freq:((note3*freq)*over3)+detune.real,
				mul:(((cf*note1)*over1).reciprocal)*modamp,phase:over3.wrap(0,360).degrad)))
		+
		(SinOsc.ar(freq:((note3*f2)*over2)+detune.real,
			mul:((cf*note3)*over2).reciprocal,phase:over2.wrap(0,360).degrad,
			add:SinOsc.ar(freq:((note1*freq)*over2)+detune.real,
				mul:(((cf*note1)*over2).reciprocal)*modamp,phase:over2.wrap(0,360).degrad))
		*
		SinOsc.ar(freq:((note3*f2)*over4)+detune.real,
			mul:((cf*note3)*over4).reciprocal,phase:over4.wrap(0,360).degrad,
		add:SinOsc.ar(freq:((note1*freq)*over4)+detune.real,
				mul:(((cf*note1)*over4).reciprocal)*modamp,phase:over4.wrap(0,360).degrad)))

		,SinOsc.ar(rotation+detune.real,phase:90.degrad)));

		Out.ar(12,FreeVerb.ar(osc_1*envelope,1,room:scale.linlin(20.reciprocal,20000.reciprocal,0,1)));
		Out.ar(14,FreeVerb.ar(osc_2*envelope,1,room:scale.linlin(20.reciprocal,20000.reciprocal,0,1)));
		Out.ar(16,FreeVerb.ar(osc_3*envelope,1,room:scale.linlin(20.reciprocal,20000.reciprocal,0,1)));

		m = m+1;
		over1 = over1 + (m+1)/1;
		over2 = over2 + (m+1)/1;
		over3 = over3 + (m+1)/1;
		over4 = over4 + (m+1)/1;

	};


	edge1a = Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(12)),SinOsc.ar(rotation,phase:0),level:envelope));
	edge1b = Out.ar(2,Pan2.ar(LeakDC.ar(InFeedback.ar(13)),SinOsc.ar(rotation,phase:90),level:envelope));
	edge1c = Out.ar(4,Pan2.ar(LeakDC.ar(InFeedback.ar(14)),SinOsc.ar(rotation,phase:0),level:envelope));
	edge2a = Out.ar(6,Pan2.ar(LeakDC.ar(InFeedback.ar(15)),SinOsc.ar(rotation,phase:90),level:envelope));
	edge2b = Out.ar(8,Pan2.ar(LeakDC.ar(InFeedback.ar(16)),SinOsc.ar(rotation,phase:0),level:envelope));
	edge2c = Out.ar(10,Pan2.ar(LeakDC.ar(InFeedback.ar(17)),SinOsc.ar(rotation,phase:90),level:envelope));



}).add;
)

Synth.new(\t);




(
Pdef(\2, Pbind(\instrument, \to18, \dur,Pexprand(4,8,inf),
	\cf,Prand([2],inf),
	\n1,Pseq(Array.fill(8128, { arg i; i * 1 }),inf),
   \n2,Pseq(Array.fill(8128, { arg i; i * 2 }),inf),
  	\n3,Pseq(Array.fill(8128, { arg i; i * 2 }),inf),
	\rotation,Pexprand(0.001,1,inf);
)).play(quant:1);)




///
Array.fib(5, 1 ).postln;
((4*32)-1)*((4*32)/2);
////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\/////////////////\\\\\\\\\\\\\\\/////////////////

28*(8128/28)
