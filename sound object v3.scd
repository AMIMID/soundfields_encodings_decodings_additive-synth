s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=20;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot


(
SynthDef.new(\o, {
	arg fundamental1=6, n1=1,speed1=0.01, speed2=0.01, speed3=0.01;
	var frequency, note1, detune;
	var envelope, envelopex, envelopey, envelopez;
	var osc_1, osc_2, osc_3, osc_4, osc_5, osc_6;
	var over1, over2, over3, over4, m;
	var freq1, o1, o2, o3, o4, o5, o6;
	var timex,timey,timez, dx, dy, dz;
	var bank, angle, scale=1;
	var azimuth, elevation;
	var trig = Impulse.ar(0);

	over1=1;
	over2=2;
	over3=3;
	over4=4;
	m=0;
	frequency=8;
	bank=12;
	timex=4;
	timey=4;
	timez=4;
	angle=0;
	detune=1;

	note1 = 2.pow(n1/(8128*2));

	o1 = Cartesian.new(1,1,0)*scale;
	o2 = Cartesian.new(0,0,1)*scale;
	o3 = Cartesian.new(0,1,1)*scale;
	o4 = Cartesian.new(1,0,0)*scale;
	o5 = Cartesian.new(1,0,1)*scale;
	o6 = Cartesian.new(0,1,0)*scale;

	dx = o1.rho;
	dy = o1.rho;

	//envelope=  EnvGen.ar(Env.perc(0.01,12,4), doneAction: 2);
	envelope=  EnvGen.ar(Env.sine(12,1), doneAction: 2);
	envelopey= EnvGen.ar(Env.new([0,0,dy,0],[timey],curve:[-4,4]), doneAction: 0);
	envelopex= EnvGen.ar(Env.new([0,dx,0],[timex],curve:[-4,4]), doneAction: 0);


	bank.do {

	angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
	detune=exp(Complex(0,1)*angle);

	freq1 = (fundamental1*frequency);

		osc_1 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:o1.phi)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:o1.phi))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:o1.phi)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:o1.phi)),0);

		osc_2 = ((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:o2.phi)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:o2.phi))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:o2.phi)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:o2.phi)));

		osc_3 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:o3.theta)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:o3.theta))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:o3.theta)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:o3.theta)),0);

		osc_4 = ((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:o4.theta)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:o4.theta))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:o4.theta)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:o4.theta)));

		osc_5 = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:o5.theta)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:o5.theta))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:o5.theta)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:o5.theta)),0);

		osc_6 = ((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:o6.theta)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:o6.theta))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:o6.theta)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:o6.theta)));


		Out.ar(2, LeakDC.ar(osc_1)*envelope);
		Out.ar(4, LeakDC.ar(osc_2)*envelope);
		Out.ar(5, LeakDC.ar(osc_3)*envelope);
		Out.ar(7, LeakDC.ar(osc_4)*envelope);
		Out.ar(8, LeakDC.ar(osc_5)*envelope);
		Out.ar(10, LeakDC.ar(osc_6)*envelope);

		m = m+1;
		over1 = over1 + (m+1)/1;
		over2 = over2 + (m+1)/1;
		over3 = over3 + (m+1)/1;
		over4 = over4 + (m+1)/1;

		trig = TDelay.ar(trig, 0.0001);
	};
//////////////+/-
Out.ar(11,LeakDC.ar(Pan2.ar((InFeedback.ar(2)*envelopex),pos:SinOsc.ar(speed1))));
Out.ar(11,LeakDC.ar(Pan2.ar((InFeedback.ar(3)*envelopey),pos:SinOsc.ar(speed1))));
Out.ar(11,LeakDC.ar(Pan2.ar((InFeedback.ar(4)*envelopex),pos:SinOsc.ar(speed1))));
Out.ar(13,LeakDC.ar(Pan2.ar((InFeedback.ar(5)*envelopex),pos:SinOsc.ar(speed2))));
Out.ar(13,LeakDC.ar(Pan2.ar((InFeedback.ar(6)*envelopey),pos:SinOsc.ar(speed2))));
Out.ar(13,LeakDC.ar(Pan2.ar((InFeedback.ar(7)*envelopex),pos:SinOsc.ar(speed2))));
Out.ar(15,LeakDC.ar(Pan2.ar((InFeedback.ar(8)*envelopex),pos:SinOsc.ar(speed3))));
Out.ar(15,LeakDC.ar(Pan2.ar((InFeedback.ar(9)*envelopey),pos:SinOsc.ar(speed3))));
Out.ar(15,LeakDC.ar(Pan2.ar((InFeedback.ar(10)*envelopex),pos:SinOsc.ar(speed3))));

///////////01
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(11))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(12))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(13))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(14))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(15))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(16))*envelopey,frequency*1000));

}).add;
)

(
Pdef(\1, Pbind(\instrument, \o, \dur,1,
	//\fundamental1,Prand([6,8,9,12],inf),
	\n1,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
	\speed1,Pexprand(0.3,0.3,inf),
	\speed2,Pexprand(0.3,0.3,inf),
	\speed3,Pexprand(0.3,0.3,inf);
)).play(quant:1);)

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