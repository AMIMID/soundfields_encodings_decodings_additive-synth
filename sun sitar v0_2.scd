s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=32;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot

(
SynthDef.new(\sitarsun, {
	arg fundamental1=6, fundamental2=6, fundamental3=6, n1=1, n2=1, n3=1;
	var speed1, speed2, speed3, position, frequency, note1, note2, note3, detune1, detune2, detune3;
	var envelope, envelopex, envelope2, envelope3, envelope4, envelopey, envelopez, osc_z, osc_y, osc_x, over1, over2, m;
	var freq1, freq2, freq3;
	var trig = Impulse.ar(0);
	var partials,x,y,z;
	var bank, angle;

	over1=1;
	over2=2;
	m=0;
	frequency=64;
	position=0;
	bank=6;
	speed1 = 0.1;
	speed2 = 0.1;
	speed3= 0.1;
	x=2;
	y=2;
	z=2;
	angle =0;

	envelope=  EnvGen.ar(Env.sine(10,0.1), doneAction: 2);
    envelopex = EnvGen.ar(Env.new([0,0,1,0,-1,0],[x],curve:[4,-4]), doneAction: 0);
	 envelopey= EnvGen.ar(Env.new([0,0,1,0,-1,0],[y],curve:[-4,4]), doneAction: 0);
	 envelopez = EnvGen.ar(Env.new([0,0,1,0,-1,0],[1,z,z,z,z],curve:[4,-4]), doneAction: 0);
	  envelope2= EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,x,x,x,x],curve:[4,-4]), doneAction: 0);
	 envelope3= EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,y,y,y,y],curve:[-4,4]), doneAction: 0);
	envelope4 = EnvGen.ar(Env.new([0,0,1,0,-1,0],[3,z,z,z,z],curve:[4,-4]), doneAction: 0);



	note1 = 2.pow(n1/(8128*2));
	note2 = 2.pow(n2/(8128*2));
	note3 = 2.pow(n3/(8128*2));

	detune1 = Complex.new(fundamental1, note1).abs;
	detune2 = Complex.new(fundamental2, note2).abs;
	detune3 = Complex.new(fundamental3, note3).abs;

		freq1 = ((fundamental1*note1)/detune1);
		freq2 = ((fundamental2*note2)/detune2);
		freq3 = ((fundamental3*note3)/detune3);

	bank.do {

		osc_z = Pan2.ar(SinOsc.ar(freq:((frequency)*freq1)*over1, mul:(freq1*over1).reciprocal,phase:45.degrad)*
			SinOsc.ar(freq:((frequency)*freq1)*over2, mul:(freq1*over2).reciprocal,phase:45.degrad), pos: position.imag);

		osc_y = PanAz.ar(3,SinOsc.ar(freq:((frequency)*freq2)*over1, mul:(freq2*over1).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:((frequency)*freq2)*over2, mul:(freq2*over2).reciprocal,phase:90.degrad), pos: SinOsc.ar(speed1));

		osc_x = PanAz.ar(3,SinOsc.ar(freq:((frequency)*freq3)*over1, mul:(freq3*over1).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:((frequency)*freq3)*over2, mul:(freq3*over2).reciprocal,phase:90.degrad), pos: SinOsc.ar(speed2));

		Out.ar(2, LeakDC.ar(osc_z)*envelope);
		Out.ar(4, LeakDC.ar(osc_y)*envelope);
		Out.ar(7, LeakDC.ar(osc_x)*envelope);

		angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);
		position=exp(Complex(0,1)*angle);

		m = m+1;
		over1 = (m+1)/1;
		over2 = (m+1)/1;

		trig = TDelay.ar(trig, 0.1);
	};
//////////////
Out.ar(10,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(2)*envelopez),pos:SinOsc.ar(speed1,phase:45.degrad,mul:1))));
Out.ar(12,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(4)*envelopey),pos:SinOsc.ar(speed2,phase:90.degrad,mul:1))));
Out.ar(14,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(7)*envelopez),pos:SinOsc.ar(speed3,phase:90.degrad,mul:1))));
/////
Out.ar(16,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(3)*envelope2),pos:SinOsc.ar(speed1,phase:135.degrad,mul:1))));
Out.ar(18,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(5)*envelope3),pos:SinOsc.ar(speed2,phase:180.degrad,mul:1))));
Out.ar(20,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(8)*envelope4),pos:SinOsc.ar(speed3,phase:180.degrad,mul:1))));
////
Out.ar(22,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(6)*envelope),pos:SinOsc.ar(speed3,phase:270.degrad,mul:1))));
Out.ar(24,LeakDC.ar(PanAz.ar(2,(InFeedback.ar(9)*envelope),pos:SinOsc.ar(speed3,phase:270.degrad,mul:1))));
////////////0

Out.ar(26,LeakDC.ar(InFeedback.ar(10))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[1,z,z,z,z],curve:[4,-4]), doneAction: 0));///z
Out.ar(26,LeakDC.ar(InFeedback.ar(16))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[1,z,z,z,z],curve:[4,-4]), doneAction: 0));///zz
Out.ar(27,LeakDC.ar(InFeedback.ar(11))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[3,z,z,z,z],curve:[4,-4]), doneAction: 0));////-z
Out.ar(27,LeakDC.ar(InFeedback.ar(17))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[3,z,z,z,z],curve:[4,-4]), doneAction: 0));////-zz
Out.ar(28,LeakDC.ar(InFeedback.ar(12))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[2,y,y,y,y],curve:[-4,4]), doneAction: 0));///y
Out.ar(28,LeakDC.ar(InFeedback.ar(18))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[2,y,y,y,y],curve:[-4,4]), doneAction: 0));////yy
Out.ar(28,LeakDC.ar(InFeedback.ar(22))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[2,y,y,y,y],curve:[4,-4]), doneAction: 0));///-y
Out.ar(29,LeakDC.ar(InFeedback.ar(13))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,y,y,y,y],curve:[4,-4]), doneAction: 0));///-yy
Out.ar(29,LeakDC.ar(InFeedback.ar(19))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,y,y,y,y],curve:[4,-4]), doneAction: 0));///-yy
Out.ar(29,LeakDC.ar(InFeedback.ar(23))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,y,y,y,y],curve:[4,-4]), doneAction: 0));///x
Out.ar(30,LeakDC.ar(InFeedback.ar(14))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[2,x,x,x,x],curve:[4,-4]), doneAction: 0));///x
Out.ar(30,LeakDC.ar(InFeedback.ar(20))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[2,x,x,x,x],curve:[4,-4]), doneAction: 0));///x
Out.ar(30,LeakDC.ar(InFeedback.ar(24))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[2,x,x,x,x],curve:[4,-4]), doneAction: 0));///-x
Out.ar(31,LeakDC.ar(InFeedback.ar(15))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,x,x,x,x],curve:[4,-4]), doneAction: 0));////-xx
Out.ar(31,LeakDC.ar(InFeedback.ar(21))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,x,x,x,x],curve:[4,-4]), doneAction: 0));////-xx
Out.ar(31,LeakDC.ar(InFeedback.ar(25))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[4,x,x,x,x],curve:[4,-4]), doneAction: 0));////-xx


///////////01
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(26))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[1*(y/2),y,y,y,y],curve:[4,-4]), doneAction: 0),frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(28))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[1*(y/2),y,y,y,y],curve:[4,-4]), doneAction: 0),frequency*1000));
Out.ar(0,LPF.ar(LeakDC.ar(InFeedback.ar(30))*EnvGen.ar(Env.new([0,0,1,0,-1,0],[1*(y/2),y,y,y,y],curve:[4,-4]), doneAction: 0),frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(27))*EnvGen.ar(Env.new([0,1,0,-1,0],[x],curve:[-4,4]), doneAction: 0),frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(29))*EnvGen.ar(Env.new([0,1,0,-1,0],[x],curve:[-4,4]), doneAction: 0),frequency*1000));
Out.ar(1,LPF.ar(LeakDC.ar(InFeedback.ar(31))*EnvGen.ar(Env.new([0,1,0,-1,0],[x],curve:[-4,4]), doneAction: 0),frequency*1000));
}).add;
)

(
Pdef(\1, Pbind(\instrument, \sitarsun, \dur, Pexprand(1,2,inf),
	\fundamental1,Prand([6,8,9,12],inf), \fundamental2,Prand([6,8,9,12],inf), \fundamental3,Prand([6,8,9,12],inf),
	\n1, Prand(Array.fill(32*2, { arg i; 1+ i }),inf), \n2, Prand(Array.fill(32*2, { arg i; 1+ i }),inf), \n3, Prand(Array.fill(32*2, { arg i; 1+ i }),inf); )).play(quant:1);)

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