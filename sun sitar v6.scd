s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=14;
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
	frequency=6;
	position=0;
	bank=28;
	speed1 = 2;
	speed2 = 1;
	speed3= 1.5;
	x=2;
	y=3;
	z=4;
	angle =0;

	envelope = EnvGen.ar(Env.sine(20), doneAction: 2);
    envelopex = EnvGen.ar((Env.new([0,1,0,1,0],[x],curve:\sine)), doneAction: 0);
	 envelopey= EnvGen.ar((Env.new([0,1,0,1,0],[y],curve:\sine)), doneAction: 0);
	 envelopez = EnvGen.ar((Env.new([0,1,0,1,0],[z],curve:\sine)), doneAction: 0);
	  envelope2= EnvGen.ar((Env.new([0,0.5,1,0,1,0],[0.01,x/2,x,x,x],curve:\sine)), doneAction: 0);
	 envelope3= EnvGen.ar((Env.new([0,0.5,1,0,1,0],[0.01,y/2,y,y,y],curve:\sine)), doneAction: 0);
	 envelope4 = EnvGen.ar((Env.new([0,0.5,1,0,1,0],[0.01,z/2,z,z,z],curve:\sine)), doneAction: 0);

	note1 = 4.pow(n1/256);    //2.pow(1/12) //496
	note2 = 4.pow(n2/256);
	note3 = 4.pow(n3/256);

	detune1 = Complex.new(fundamental1, note1).abs;
	detune2 = Complex.new(fundamental2, note2).abs;
	detune3 = Complex.new(fundamental3, note3).abs;

		freq1 = ((fundamental1*note1)+detune1);
		freq2 = ((fundamental2*note2)+detune2);
		freq3 = ((fundamental3*note3)+detune3);

	bank.do {

		osc_z = Pan4.ar(SinOsc.ar(freq:(frequency*freq1)*over1, mul:(freq1*over1).reciprocal,phase:0.degrad)*
			SinOsc.ar(freq:(frequency*freq1)*over2, mul:(freq1*over2).reciprocal,phase:0.degrad), xpos: position.real, ypos: position.imag);

		osc_y = Pan4.ar(SinOsc.ar(freq:(frequency*freq2)*over1, mul:(freq2*over1).reciprocal,phase:45.degrad)*
			SinOsc.ar(freq:(frequency*freq2)*over2, mul:(freq1*over2).reciprocal,phase:45.degrad), xpos: position.real, ypos: position.imag);

		osc_x = Pan4.ar(SinOsc.ar(freq:(frequency*freq3)*over1, mul:(freq3*over1).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:(frequency*freq3)*over2, mul:(freq3*over2).reciprocal,phase:90.degrad), xpos: position.real, ypos: position.imag);

		Out.ar(2, LeakDC.ar(osc_z*envelopez*envelope4));
		Out.ar(6, LeakDC.ar(osc_y*envelopey*envelope3));
		Out.ar(10, LeakDC.ar(osc_x*envelopex*envelope2));

		angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		position=exp(Complex(0,1)*angle);

		m = m+1;
		over1 = (m+1)/1;
		over2 = (m+1)/1;

		trig = TDelay.ar(trig, 0.001);
	};




	Out.ar(0,LeakDC.ar(PanAz.ar(2,((InFeedback.ar(2)+InFeedback.ar(4))*envelopez),pos:SinOsc.ar(speed1,phase:0.degrad,mul:1))));
	Out.ar(0,LeakDC.ar(PanAz.ar(2,((InFeedback.ar(6)+InFeedback.ar(8))*envelopey),pos:SinOsc.ar(speed2,phase:45.degrad,mul:1))));
	Out.ar(0,LeakDC.ar(PanAz.ar(2,((InFeedback.ar(10)+InFeedback.ar(12))*envelopex),pos:SinOsc.ar(speed3,phase:90.degrad,mul:1))));

		Out.ar(0,LeakDC.ar(PanAz.ar(2,((InFeedback.ar(3)+InFeedback.ar(5))*envelope4),pos:SinOsc.ar(speed1,phase:0.degrad,mul:1))));
	Out.ar(0,LeakDC.ar(PanAz.ar(2,((InFeedback.ar(7)+InFeedback.ar(9))*envelope3),pos:SinOsc.ar(speed2,phase:45.degrad,mul:1))));
	Out.ar(0,LeakDC.ar(PanAz.ar(2,((InFeedback.ar(11)+InFeedback.ar(13))*envelope2),pos:SinOsc.ar(speed3,phase:90.degrad,mul:1))));


/*	Out.ar(0,LeakDC.ar(InFeedback.ar(2)*envelope));
	Out.ar(1,LeakDC.ar(InFeedback.ar(6)*envelope));
	Out.ar(0,LeakDC.ar(InFeedback.ar(10)*envelope));
	Out.ar(1,LeakDC.ar(InFeedback.ar(3)*envelope));
	Out.ar(0,LeakDC.ar(InFeedback.ar(7)*envelope));
	Out.ar(1,LeakDC.ar(InFeedback.ar(11)*envelope));
	Out.ar(1,LeakDC.ar(InFeedback.ar(4)*envelope));
	Out.ar(0,LeakDC.ar(InFeedback.ar(8)*envelope));
	Out.ar(1,LeakDC.ar(InFeedback.ar(12)*envelope));
	Out.ar(0,LeakDC.ar(InFeedback.ar(5)*envelope));
	Out.ar(1,LeakDC.ar(InFeedback.ar(9)*envelope));
	Out.ar(0,LeakDC.ar(InFeedback.ar(13)*envelope));*/


	/*Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(2))*envelope,pos:SinOsc.ar(speed1,phase:0.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(3))*envelope,pos:SinOsc.ar(speed2,phase:45.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(4))*envelope,pos:SinOsc.ar(speed3,phase:90.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(2))*envelope,pos:SinOsc.ar(speed1,phase:0.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(3))*envelope,pos:SinOsc.ar(speed2,phase:45.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(4))*envelope,pos:SinOsc.ar(speed3,phase:90.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(2))*envelope,pos:SinOsc.ar(speed1,phase:0.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(3))*envelope,pos:SinOsc.ar(speed2,phase:45.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(4))*envelope,pos:SinOsc.ar(speed3,phase:90.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(2))*envelope,pos:SinOsc.ar(speed1,phase:0.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(3))*envelope,pos:SinOsc.ar(speed2,phase:45.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(4))*envelope,pos:SinOsc.ar(speed3,phase:90.degrad,mul:1)));*/

}).add;
)

(
Pdef(\1, Pbind(\instrument, \sitarsun, \dur, Pexprand(1, 4/3, inf),
\fundamental1,Prand([6,8,9,12],inf), \fundamental2,Prand([6,8,9,12],inf), \fundamental3,Prand([6,8,9,12],inf),
	\n1, Prand(Array.fill(4, { arg i; 1+ i }),inf), \n2, Prand(Array.fill(4, { arg i; 1+ i }),inf), \n3, Prand(Array.fill(4, { arg i; 1+ i }),inf); )).play(quant:1);)

Pdef(\1).stop
Pdef(\2).stop

[3,10,5,12,7,2,9,4,11,6,1,8] ///pyth

[1,2,5,6,8,9,12,13]///byzantine
[6,8,9,12]