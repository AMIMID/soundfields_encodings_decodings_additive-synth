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
	arg fundamental1=6, fundamental2=6, fundamental3=6, n1=1, n2=1, n3=1, speed1 = 0.1, speed2 = 0.1, speed3= 0.1;
	var frequency, note1, note2, note3, detune;
	var envelope, envelopex,envelopey, envelopez;
	var osc_z, osc_y, osc_x, over1, over2, over3, over4, m;
	var freq1, freq2, freq3;
	var timex,timey;
	var bank, angle, phasex, phasey, phasez;
	var trig = Impulse.ar(0);

	over1=1;
	over2=2;
	over3=3;
	over4=4;
	m=0;
	frequency=12;
	bank=28;
	timex=2;
	timey=2;
	angle=0;
	detune=1;

	envelope=  EnvGen.ar(Env.new([0,1,0,-1,0,1,0],[timex],curve:[-4,4]), doneAction: 2);
    envelopex = EnvGen.ar(Env.new([0,1,0,-1,0],[timex],curve:[-4,4]), doneAction: 0);
	envelopey= EnvGen.ar(Env.new([0,0,1,0,-1,0],[timey],curve:[-4,4]), doneAction: 0);

	note1 = 2.pow(n1/(130816.0*2));
	note2 = 2.pow(n2/(130816.0*2));
	note3 = 2.pow(n3/(130816.0*2));

	phasez = Complex.new(45,0).phase.degrad;
	phasey = Complex.new(0,45).phase.degrad;
	phasex = Complex.new(90,45).phase.degrad;


	bank.do {


		angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		detune=exp(Complex(0,1)*angle);

	freq1 = (fundamental1*note1);
	freq2 = (fundamental2*note2);
	freq3 = (fundamental3*note3);

		osc_z = Pan2.ar(SinOsc.ar(freq:((frequency)*freq1)*over1+detune.real, mul:(freq1*over1).reciprocal,phase:phasez)*
			SinOsc.ar(freq:((frequency)*freq1)*over2+detune.real, mul:(freq1*over2).reciprocal,phase:phasez)
		+
		(SinOsc.ar(freq:((frequency)*freq1)*over3+detune.imag, mul:(freq1*over3).reciprocal,phase:phasez)*
				SinOsc.ar(freq:((frequency)*freq1)*over4+detune.imag, mul:(freq1*over4).reciprocal,phase:phasez)),detune.real);

		osc_y = Pan2.ar((SinOsc.ar(freq:((frequency)*freq2)*over1+detune.real, mul:(freq2*over1).reciprocal,phase:phasey)*
			SinOsc.ar(freq:((frequency)*freq2)*over2+detune.real, mul:(freq1*over2).reciprocal,phase:phasey))
		+
		(SinOsc.ar(freq:((frequency)*freq2)*over3+detune.imag, mul:(freq2*over3).reciprocal,phase:phasey)*
			SinOsc.ar(freq:((frequency)*freq2)*over4+detune.imag, mul:(freq1*over4).reciprocal,phase:phasey)),detune.imag);

		osc_x = Pan2.ar((SinOsc.ar(freq:((frequency)*freq3)*over1+detune.real, mul:(freq3*over1).reciprocal,phase:phasex)*
			SinOsc.ar(freq:((frequency)*freq3)*over2+detune.real, mul:(freq3*over2).reciprocal,phase:phasex))
		+
		(SinOsc.ar(freq:((frequency)*freq3)*over3+detune.imag, mul:(freq3*over3).reciprocal,phase:phasex)*
		SinOsc.ar(freq:((frequency)*freq3)*over4+detune.imag, mul:(freq3*over4).reciprocal,phase:phasex)),detune.imag);


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
Out.ar(8,LeakDC.ar(Pan2.ar((InFeedback.ar(2)*envelopex),pos:SinOsc.ar(speed1))));
Out.ar(10,LeakDC.ar(Pan2.ar((InFeedback.ar(3)*envelopey),pos:SinOsc.ar(speed1))));
Out.ar(12,LeakDC.ar(Pan2.ar((InFeedback.ar(4)*envelopex),pos:SinOsc.ar(speed2))));
Out.ar(14,LeakDC.ar(Pan2.ar((InFeedback.ar(5)*envelopey),pos:SinOsc.ar(speed2))));
Out.ar(16,LeakDC.ar(Pan2.ar((InFeedback.ar(6)*envelopex),pos:SinOsc.ar(speed3))));
Out.ar(18,LeakDC.ar(Pan2.ar((InFeedback.ar(7)*envelopey),pos:SinOsc.ar(speed3))));

///////////01
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(8))*envelope,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(9))*envelope,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(10))*envelope,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(11))*envelope,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(12))*envelope,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(13))*envelope,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(14))*envelope,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(15))*envelope,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(16))*envelope,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(17))*envelope,frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(18))*envelope,frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(19))*envelope,frequency*1000));

}).add;
)

(
Pdef(\1, Pbind(\instrument, \ob, \dur, 1,
	\fundamental1,Prand([6,8,9,12],inf),
	\fundamental2,Prand([6,8,9,12],inf),
	\fundamental3,Prand([6,8,9,12],inf),
	\n1,Prand(Array.fill(128*2, { arg i; 1+ i }),inf),
	\n2,Prand(Array.fill(128*2, { arg i; 1+ i }),inf),
	\n3,Prand(Array.fill(128*2, { arg i; 1+ i }),inf),
	\speed1,Pexprand(0.1,1,inf),
	\speed2,Pexprand(0.1,1,inf),
	\speed3,Pexprand(0.1,1,inf);
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
var x=128,y;
y=((4*x)-1)*((4*x)/2);
)
)