s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

s.options.numWireBufs = 1024*4;

s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot


(
SynthDef.new(\o, {
	arg n1=1, n2=1, n3=1,speed=0.01, cf=8;
	var frequency, note1, note2, note3, detune;
	var envelope, envelopex, envelopey, envelopez;
	var osc_1, osc_2, osc_3;
	var over1, over2, over3, over4, m;
	var freq1, freq2, freq3, o1;
	var timex,timey,timez, dx, dy, dz;
	var bank, angle, scale=0.1;
	var azimuth, elevation;
    var fundamental;

	over1=1;
	over2=2;
	over3=3;
	over4=4;
	m=0;
	frequency=2;
	bank=28;
	timex=4;
	timey=4;
	timez=4;
	angle=0;
	detune=1;

	note1 = 2.pow(n1/(8128*2));
	note2 = 2.pow(n2/(8128*2));
	note3 = 2.pow(n3/(8128*2));

    fundamental=((4*cf)-1)*((4*cf)/2);

	//envelope=  EnvGen.ar(Env.perc(0.01,8,scale), doneAction: 2);
	envelope=  EnvGen.ar(Env.sine(8,scale), doneAction: 2);
	//envelopey= EnvGen.ar(Env.new([0,0,dy,0],[timey],curve:[-4,4]), doneAction: 0);
	//envelopex= EnvGen.ar(Env.new([0,dx,0],[timex],curve:[-4,4]), doneAction: 0);


	bank.do {

	angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
	detune=exp(Complex(0,1)*angle);

	freq1 = (fundamental*frequency);
	freq2 = (fundamental*frequency);
	freq3 = (fundamental*frequency);

		osc_1 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((cf*note1)*over1).reciprocal,phase:0.degrad)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((cf*note1)*over2).reciprocal,phase:0.degrad))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((cf*note1)*over3).reciprocal,phase:0.degrad)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((cf*note1)*over4).reciprocal,phase:0.degrad)),SinOsc.ar(speed,45.degrad,speed.reciprocal));

		osc_2 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((cf*note1)*over1).reciprocal,phase:45.degrad)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((cf*note1)*over2).reciprocal,phase:45.degrad))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((cf*note1)*over3).reciprocal,phase:45.degrad)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((cf*note1)*over4).reciprocal,phase:45.degrad)),SinOsc.ar(speed,0.degrad,speed.reciprocal));

		osc_3 = Pan2.ar((SinOsc.ar(freq:((note2*freq2)*over1)+detune.real, mul:((cf*note2)*over1).reciprocal,phase:90.degrad)*
		SinOsc.ar(freq:((note2*freq2)*over2)+detune.real, mul:((cf*note2)*over2).reciprocal,phase:90.degrad))
		+
		(SinOsc.ar(freq:((note2*freq2)*over3)+detune.real, mul:((cf*note2)*over3).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:((note2*freq2)*over4)+detune.real, mul:((cf*note2)*over4).reciprocal,phase:90.degrad)),SinOsc.ar(speed,45.degrad,speed.reciprocal));


		Out.ar(0, LPF.ar(LeakDC.ar(osc_1)*envelope,cf*1000));
		Out.ar(0,LPF.ar( LeakDC.ar(osc_2)*envelope,cf*1000));
		Out.ar(0,LPF.ar( LeakDC.ar(osc_3)*envelope,cf*1000));

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
Pdef(\1, Pbind(\instrument, \o, \dur,Pexprand(2,4,inf),
	\cf,Prand([1,2,4],inf),
	\n1,Prand([1,2,5,6,8,9,12,13],inf),
   \n2,Prand([1,2,5,6,8,9,12,13],inf),
  	\n3,Prand([1,2,5,6,8,9,12,13],inf),
	\speed,Pexprand(0.1,1,inf);
)).play(quant:1);)


(
Pdef(\1, Pbind(\instrument, \o, \dur,Pexprand(2,4,inf),
	\cf,Prand([2],inf),
	\n1,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
   \n2,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
  	\n3,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
	\speed,Pexprand(0.1,1,inf);
)).play(quant:1);)

///
(/*
Pdef(\1, Pbind(\instrument, \sitarsun, \dur, Pexprand(2,4,inf),
\fundamental1,Prand([6,8,9,12],inf), \fundamental2,Prand([6,8,9,12],inf), \fundamental3,Prand([6,8,9,12],inf),
	\n1, Prand([1,4,5,12],inf), \n2, Prand([1,4,5,12],inf), \n3, Prand([1,4,5,12],inf); )).play(quant:1);)*/

Pdef(\1).stop
Pdef(\2).stop

[3,10,5,12,7,2,9,4,11,6,1,8] ///pyth

[1,2,5,6,8,9,12,13]///byzantine
[6,8,9,12]
///////////////////////
(
var x=32,y;
y=((4*x)-1)*((4*x)/2);
)
)




//////x
(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),-1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0.5))}.play;

);

/////y
(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0))}.play;

);
/////z

(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),-0.5))}.play;

)
Spherical.new(1,-90.degrad,0).theta
	.theta.postln;
