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
SynthDef.new(\ob, {
	arg fundamental1=6, fundamental2=6, fundamental3=6, n1=1, n2=1, n3=1,speed1=0.01, speed2=0.01, speed3=0.01;
	var frequency, note1, note2, note3, detune;
	var envelope, envelopex,envelopey, envelopez;
	var osc_z, osc_y, osc_x, over1, over2, over3, over4, m;
	var freq1, freq2, freq3, objectz, objectx, objecty;
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
	bank=28;
	timex=4;
	timey=4;
	timez=4;
	angle=0;
	detune=1;

	note1 = 2.pow(n1/(8128*2));
	note2 = 2.pow(n2/(8128*2));
	note3 = 2.pow(n3/(8128*2));

	objectz = Cartesian.new(1,1,0)*scale;
	objecty = Cartesian.new(1,0,1)*scale;
	objectx = Cartesian.new(0,1,1)*scale;

	objectz = objectz.rotate(0.degrad);
	objecty = objecty.tilt(0.degrad);
	objectx = objectx.tumble(0.degrad);

	dx = objectx.rho;
	dy = objecty.rho;
	dz = objectz.rho;

	//envelope=  EnvGen.ar(Env.perc(0.01,12,4), doneAction: 2);
	envelope=  EnvGen.ar(Env.sine(12,1), doneAction: 2);
	envelopez = EnvGen.ar(Env.new([0,dz,0],[timez],curve:[-4,4]), doneAction: 0);
	envelopey= EnvGen.ar(Env.new([0,0,dy,0],[timey],curve:[-4,4]), doneAction: 0);
	envelopex= EnvGen.ar(Env.new([0,dx,0],[timex],curve:[-4,4]), doneAction: 0);


	bank.do {

	angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
	detune=exp(Complex(0,1)*angle);

	freq1 = (fundamental1*frequency);
	freq2 = (fundamental2*frequency);
	freq3 = (fundamental3*frequency);

		osc_z = Pan2.ar((SinOsc.ar(freq:((note1*freq1)*over1)+detune.real, mul:((note1*fundamental1)*over1).reciprocal,phase:objectz.theta)*
		SinOsc.ar(freq:((note1*freq1)*over2)+detune.real, mul:((note1*fundamental1)*over2).reciprocal,phase:objectz.theta))
		+
		(SinOsc.ar(freq:((note1*freq1)*over3)+detune.real, mul:((note1*fundamental1)*over3).reciprocal,phase:objectz.theta)*
			SinOsc.ar(freq:((note1*freq1)*over4)+detune.real, mul:((note1*fundamental1)*over4).reciprocal,phase:objectz.theta)),SinOsc.ar(speed1,objectz.phi));

		osc_y = Pan2.ar((SinOsc.ar(freq:((note2*freq2)*over1)+detune.real, mul:((note2*fundamental2)*over1).reciprocal,phase: objecty.theta)*
		SinOsc.ar(freq:((note2*freq2)*over2)+detune.real, mul:((note2*fundamental2)*over2).reciprocal,phase: objecty.theta))
		+
		(SinOsc.ar(freq:((note2*freq2)*over3)+detune.real, mul:((note2*fundamental2)*over3).reciprocal,phase: objecty.theta)*
			SinOsc.ar(freq:((note2*freq2)*over4)+detune.real, mul:((note2*fundamental2)*over4).reciprocal,phase: objecty.theta)),SinOsc.ar(speed2,objecty.phi));

		osc_x = Pan2.ar((SinOsc.ar(freq:((note3*freq3)*over1)+detune.real, mul:((note3*fundamental3)*over1).reciprocal,phase:objectx.theta)*
		SinOsc.ar(freq:((note3*freq3)*over2)+detune.real, mul:((note3*fundamental3)*over2).reciprocal,phase:objectx.theta))
		+
		(SinOsc.ar(freq:((note3*freq3)*over3)+detune.real, mul:((note3*fundamental3)*over3).reciprocal,phase:objectx.theta)*
			SinOsc.ar(freq:((note3*freq3)*over4)+detune.real, mul:((note3*fundamental3)*over4).reciprocal,phase:objectx.theta)),SinOsc.ar(speed3,objectx.phi));


		Out.ar(2, LeakDC.ar(osc_z)*envelope);
		Out.ar(4, LeakDC.ar(osc_y)*envelope);
		Out.ar(6, LeakDC.ar(osc_x)*envelope);

		m = m+1;
		over1 = over1 + (m+1)/1;
		over2 = over2 + (m+1)/1;
		over3 = over3 + (m+1)/1;
		over4 = over4 + (m+1)/1;

		trig = TDelay.ar(trig, 0.0001);
	};
//////////////+/-
Out.ar(8,LeakDC.ar(Pan2.ar((InFeedback.ar(2)*envelope),pos:0)));
Out.ar(10,LeakDC.ar(Pan2.ar((InFeedback.ar(3)*envelope),pos:0)));
Out.ar(12,LeakDC.ar(Pan2.ar((InFeedback.ar(4)*envelope),pos:0)));
Out.ar(14,LeakDC.ar(Pan2.ar((InFeedback.ar(5)*envelope),pos:0)));
Out.ar(16,LeakDC.ar(Pan2.ar((InFeedback.ar(6)*envelope),pos:0)));
Out.ar(18,LeakDC.ar(Pan2.ar((InFeedback.ar(7)*envelope),pos:0)));

///////////01
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(8))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(9))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(10))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(11))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(12))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(13))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(14))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(15))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(16))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(17))*envelopey,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(18))*envelopex,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(19))*envelopey,frequency*1000));

}).add;
)

(
Pdef(\1, Pbind(\instrument, \ob, \dur,1,
	//\fundamental1,Prand([6,8,9,12],inf),
	//\fundamental2,Prand([6,8,9,12],inf),
	///\fundamental3,Prand([6,8,9,12],inf),
	\n1,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
   \n2,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
  	\n3,Prand(Array.fill(32*2, { arg i; 1+ i }),inf),
	\speed1,Pexprand(0.1,1,inf),
	\speed2,Pexprand(0.1,1,inf),
	\speed3,Pexprand(0.1,1,inf),
	\x,Pexprand(0.1,1,inf),
	\y,Pexprand(0.1,1,inf),
	\z,Pexprand(0.1,1,inf),

	/*\speed1,Prand([1,1/2,2/3,3/4],inf),
	\speed2,Prand([1,1/2,2/3,3/4],inf),
	\speed3,Prand([1,1/2,2/3,3/4],inf),
	\x,Prand([2,3/2,4/3,1],inf),
	\y,Prand([2,3/2,4/3,1],inf),
	\z,Prand([2,3/2,4/3,1],inf);*/
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