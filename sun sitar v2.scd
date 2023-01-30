s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

s.options.numWireBufs = 1024*4;
s.options.numWireBufs = 64;
	s.options.maxNodes = 1024 * 32;
s.options.numOutputBusChannels=12;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*32;
s.waitForBoot

(
SynthDef.new(\sitarsun, {
	arg fundamental1=6, fundamental2=6, fundamental3=6, n1=1, n2=1, n3=1;
	var x, y, z, speed1, speed2, position, frequency, note1, note2, note3, detune1, detune2, detune3;
	var envelope, envelope1, osc1, osc2, osc3, over1, over2, m;
	var freq1, freq2, freq3;
	var trig = Impulse.ar(0);
	var bank, angle;

	over1=1;
	over2=2;
	m=0;
	x=7;
	y=9;
	z=11;
	frequency=12;
	position=0;
	bank=28;
	speed1 = 0.5;
	speed2 = 1;
	angle =0;

	envelope1 = EnvGen.ar(Env.perc(0.01,16), doneAction: 2);
    envelope= EnvGen.ar(Env.sine(16), doneAction: 2);

	note1 = 4.pow(n1/256);    //2.pow(1/12) //496
	note2 = 4.pow(n2/512);
	note3 = 4.pow(n3/512);

	detune1 = Complex.new(fundamental1, note1).abs;
	detune2 = Complex.new(fundamental2, note2).abs;
	detune3 = Complex.new(fundamental3, note3).abs;

		freq1 = ((fundamental1*note1)+detune1);
		freq2 = ((fundamental2*note2)+detune2);
		freq3 = ((fundamental3*note3)+detune3);

	bank.do {

		osc1 = Pan4.ar(SinOsc.ar(freq:(frequency*freq1)*over1, mul:(freq1*over1).reciprocal)*
			SinOsc.ar(freq:(frequency*freq1)*over2, mul:(freq1*over2).reciprocal),xpos: position.real, ypos: position.imag);

	//	osc2 = Pan2.ar(SinOsc.ar(freq:(frequency*freq2)*over1, mul:(freq2*over1).reciprocal)*
		//	SinOsc.ar(freq:(frequency*freq2)*over2, mul:(freq1*over2).reciprocal), pos: position.wrap(-1,1));

	//	osc3 = Pan2.ar(SinOsc.ar(freq:(frequency*freq3)*over1, mul:(freq3*over1).reciprocal)*
		//	SinOsc.ar(freq:(frequency*freq3)*over2, mul:(freq3*over2).reciprocal), pos: position.wrap(-1,1));

		Out.ar(2, LeakDC.ar(osc1*envelope));
	//	Out.ar(11, LeakDC.ar(osc2*envelope));
	//	Out.ar(3, LeakDC.ar(osc3*envelope));


		angle=(angle+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		position=exp(Complex(0,1)*angle);

		m = m+1;
		over1 = (m+1)/1;
		over2 = (m+1)/1;

		trig = TDelay.ar(trig, 0.001);
	};

	//Out.ar(2,LeakDC.ar(InFeedback.ar(11)));
	//Out.ar(4,LeakDC.ar(InFeedback.ar(12)));


////////3 elevations of 3 signals
	Out.ar(6,PanAz.ar(2,LeakDC.ar(InFeedback.ar(2))*envelope,pos:SinOsc.ar(0.1,0.degrad)));
	Out.ar(8,PanAz.ar(2,LeakDC.ar(InFeedback.ar(3))*envelope,pos:SinOsc.ar(0.1,45.degrad)));
	Out.ar(10,PanAz.ar(2,LeakDC.ar(InFeedback.ar(4))*envelope,pos:SinOsc.ar(0.1,90.degrad)));


	///////2 (stereo) azimouthai of signalai combined elevation
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(6)+InFeedback.ar(8)+InFeedback.ar(10))*envelope,pos:SinOsc.ar(speed1,phase:0.degrad,mul:1)));
	Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(x)+InFeedback.ar(y)+InFeedback.ar(z))*envelope,pos:SinOsc.ar(speed2,phase:90.degrad,mul:1)));

}).add;
)

(
Pdef(\1, Pbind(\instrument, \sitarsun, \dur, Pexprand(1, 4/3, inf),
\fundamental1,Prand([6,8,9,12],inf),
	//\fundamental2,Prand([6,8,9,12],inf),
	//\fundamental3,Prand([6,8,9,12],inf),
	\n1, Prand(Array.fill(4, { arg i; 1+ i }),inf),
	//\n2, Prand(Array.fill(12, { arg i; 1+ i }),inf),
	\n3, Prand(Array.fill(12, { arg i; 1+ i }),inf); )).play(quant:1);)

Pdef(\1).stop
Pdef(\2).stop

[3,10,5,12,7,2,9,4,11,6,1,8] ///pyth

[1,2,5,6,8,9,12,13]///byzantine
[6,8,9,12]