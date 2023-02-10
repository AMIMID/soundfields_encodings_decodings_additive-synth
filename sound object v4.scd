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
	arg fundamental1=6, fundamental2=6, fundamental3=6, n1=1, n2=1, n3=1,speed=1;
	var frequency, note1, note2, note3, detune;
	var envelope, envelopex, envelopey, envelopez;
	var osc_1, osc_2, osc_3, osc_4, osc_5, osc_6;
	var over1, over2, over3, over4, m;
	var freq1, freq2, freq3, o1;
	var timex,timey,timez, dx, dy, dz;
	var bank, angle, scale=1;
	var azimuth, elevation;
	//var trig = Impulse.ar(0);

	over1=1;
	over2=2;
	over3=3;
	over4=4;
	m=0;
	frequency=16;
	bank=12;
	timex=4;
	timey=4;
	timez=4;
	angle=0;
	detune=1;

	note1 = 2.pow(n1/(8128*2));
	note2 = 2.pow(n2/(8128*2));
	note3 = 2.pow(n3/(8128*2));

	o1 = Cartesian.new(1,1,1)*scale;

	dx = o1.rho;
	dy = o1.rho;

	//envelope=  EnvGen.ar(Env.perc(0.01,12,dx), doneAction: 2);
	envelope=  EnvGen.ar(Env.sine(12,dx), doneAction: 2);
	//envelopey= EnvGen.ar(Env.new([0,0,dy,0],[timey],curve:[-4,4]), doneAction: 0);
	//envelopex= EnvGen.ar(Env.new([0,dx,0],[timex],curve:[-4,4]), doneAction: 0);


	bank.do {

	angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
	detune=exp(Complex(0,1)*angle);

	freq1 = (fundamental1*frequency);
	freq2 = (fundamental2*frequency);
	freq3 = (fundamental3*frequency);

		osc_1 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:0.degrad)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:0.degrad))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:0.degrad)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:0.degrad)),SinOsc.ar(0.1,360.degrad));

		osc_2 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:90.degrad)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:90.degrad))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:90.degrad)),SinOsc.ar(0.1,90.degrad));

		osc_3 = Pan2.ar((SinOsc.ar(freq:((note2*freq2)*over1)+detune.real, mul:((note2*fundamental2)*over1).reciprocal,phase:0.degrad)*
		SinOsc.ar(freq:((note2*freq2)*over2)+detune.real, mul:((note2*fundamental2)*over2).reciprocal,phase:0.degrad))
		+
		(SinOsc.ar(freq:((note2*freq2)*over3)+detune.real, mul:((note2*fundamental2)*over3).reciprocal,phase:0.degrad)*
			SinOsc.ar(freq:((note2*freq2)*over4)+detune.real, mul:((note2*fundamental2)*over4).reciprocal,phase:0.degrad)),SinOsc.ar(0.1,180.degrad));

		osc_4 = Pan2.ar((SinOsc.ar(freq:((note2*freq2)*over1)+detune.real, mul:((note2*fundamental2)*over1).reciprocal,phase:90.degrad)*
		SinOsc.ar(freq:((note2*freq2)*over2)+detune.real, mul:((note2*fundamental2)*over2).reciprocal,phase:90.degrad))
		+
		(SinOsc.ar(freq:((note2*freq2)*over3)+detune.real, mul:((note2*fundamental2)*over3).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:((note2*freq2)*over4)+detune.real, mul:((note2*fundamental2)*over4).reciprocal,phase:90.degrad)),SinOsc.ar(0.1,180.degrad));

		osc_5 = Pan2.ar((SinOsc.ar(freq:((note3*freq3)*over1)+detune.real, mul:((note3*fundamental3)*over1).reciprocal,phase:0.degrad)*
		SinOsc.ar(freq:((note3*freq3)*over2)+detune.real, mul:((note3*fundamental3)*over2).reciprocal,phase:0.degrad))
		+
		(SinOsc.ar(freq:((note3*freq3)*over3)+detune.real, mul:((note3*fundamental3)*over3).reciprocal,phase:0.degrad)*
			SinOsc.ar(freq:((note3*freq3)*over4)+detune.real, mul:((note3*fundamental3)*over4).reciprocal,phase:0.degrad)),SinOsc.ar(0.1,0.degrad));

		osc_6 = Pan2.ar((SinOsc.ar(freq:((note3*freq3)*over1)+detune.real, mul:((note3*fundamental3)*over1).reciprocal,phase:90.degrad)*
		SinOsc.ar(freq:((note3*freq3)*over2)+detune.real, mul:((note3*fundamental3)*over2).reciprocal,phase:90.degrad))
		+
		(SinOsc.ar(freq:((note3*freq3)*over3)+detune.real, mul:((note3*fundamental3)*over3).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:((note3*freq3)*over4)+detune.real, mul:((note3*fundamental3)*over4).reciprocal,phase:90.degrad)),SinOsc.ar(0.1,270.degrad));


		Out.ar(0, LPF.ar(LeakDC.ar(osc_1)*envelope,frequency*500));
		Out.ar(0,LPF.ar( LeakDC.ar(osc_2)*envelope,frequency*500));
		Out.ar(0,LPF.ar( LeakDC.ar(osc_3)*envelope),frequency*500);
		Out.ar(0,LPF.ar( LeakDC.ar(osc_4)*envelope,frequency*500));
		Out.ar(0, LPF.ar(LeakDC.ar(osc_5)*envelope,frequency*500));
		Out.ar(0,LPF.ar( LeakDC.ar(osc_6)*envelope,frequency*500));

		m = m+1;
		over1 = over1 + (m+1)/1;
		over2 = over2 + (m+1)/1;
		over3 = over3 + (m+1)/1;
		over4 = over4 + (m+1)/1;

	///trig = TDelay.ar(trig, 0.1);
	};

//Out.ar(0,LeakDC.ar(Pan2.ar((InFeedback.ar(2)*envelope),pos:LFNoise1.ar(speed))));
//Out.ar(0,LeakDC.ar(Pan2.ar((InFeedback.ar(3)*envelope),pos:LFNoise1.ar(speed))));


}).add;
)

(
Pdef(\1, Pbind(\instrument, \o, \dur,Pexprand(1,2,inf),
	//\fundamental1,Prand([6,],inf),
	//\fundamental2,Prand([8],inf),
	//\fundamental3,Prand([12],inf),
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

{Out.ar(0,Pan4.ar(SinOsc.ar(220,0.degrad),xpos:-1,ypos:1))}.play;

{Out.ar(0,Pan4.ar(SinOsc.ar(220,90.degrad),xpos:0.5,ypos:-0.5))}.play;

/////y

{Out.ar(0,Pan4.ar(SinOsc.ar(220,0.degrad),xpos:0,ypos:0))}.play;

{Out.ar(0,Pan4.ar(SinOsc.ar(220,90.degrad),xpos:0,ypos:0))}.play;

/////z

{Out.ar(0,Pan4.ar(SinOsc.ar(220,0.degrad),xpos:1,ypos:-1))}.play;

{Out.ar(0,Pan4.ar(SinOsc.ar(220,90.degrad),xpos:-0.5,ypos:-0.5))}.play;

)
