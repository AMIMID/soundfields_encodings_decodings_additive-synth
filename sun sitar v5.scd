s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;

s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=11;
TempoClock.default.tempo_(120/80);
s.options.memSize = 8192*8;
s.waitForBoot

(
SynthDef.new(\sitarsun, {
	arg fundamental1=6, fundamental2=6, fundamental3=6, n1=1, n2=1, n3=1;
	var speed1, speed2, position, frequency, note1, note2, note3, detune1, detune2, detune3;
	var envelope, envelope1, envelope2, envelope3, envelope4, envelope5, envelope6, bank, osc_z, osc_y, osc_x, over1, over2, m;
	var freq1, freq2, freq3;
	var trig = Impulse.ar(0);
	var partials;

	over1=1;
	over2=2;
	m=0;
	frequency=10;
	position=0;
	bank=28;
	speed1 = 1;
	speed2 = 1;

	envelope = EnvGen.ar(Env.sine(16), doneAction: 2);
    envelope1 = EnvGen.ar(Env.sine(8), doneAction: 0);
	 envelope2 = EnvGen.ar(Env.sine(4), doneAction: 0);
	envelope3 = EnvGen.ar(Env.sine(16), doneAction: 0);
	//  envelope4= EnvGen.ar(Env.new([0,0.5,1,0,1,0],[0.01,1,2,2,2],curve:\sine), doneAction: 2);
	// envelope5 = EnvGen.ar(Env.new([0,0.5,1,0,1,0],[0.01,1,2,2,2],curve:\sine), doneAction: 2);
	// envelope6 = EnvGen.ar(Env.new([0,0.5,1,0,1,0],[0.01,1,2,2,2],curve:\sine), doneAction: 2);

	note1 = 4.pow(n1/512);    //2.pow(1/12) //496
	note2 = 4.pow(n2/512);
	note3 = 4.pow(n3/512);

	detune1 = Complex.new(fundamental1, note1).abs;
	detune2 = Complex.new(fundamental2, note2).abs;
	detune3 = Complex.new(fundamental3, note3).abs;

		freq1 = ((fundamental1*note1)+detune1);
		freq2 = ((fundamental2*note2)+detune2);
		freq3 = ((fundamental3*note3)+detune3);

	bank.do {

		osc_z = PanAz.ar(3,SinOsc.ar(freq:(frequency*freq1)*over1, mul:(freq1*over1).reciprocal,phase:0.degrad)*
			SinOsc.ar(freq:(frequency*freq1)*over2, mul:(freq1*over2).reciprocal,phase:0.degrad), pos: 0, orientation:0.5 );

		osc_y = PanAz.ar(3,SinOsc.ar(freq:(frequency*freq2)*over1, mul:(freq2*over1).reciprocal,phase:45.degrad)*
			SinOsc.ar(freq:(frequency*freq2)*over2, mul:(freq1*over2).reciprocal,phase:45.degrad), pos: 1, orientation:1);

		osc_x = PanAz.ar(3,SinOsc.ar(freq:(frequency*freq3)*over1, mul:(freq3*over1).reciprocal,phase:90.degrad)*
			SinOsc.ar(freq:(frequency*freq3)*over2, mul:(freq3*over2).reciprocal,phase:90.degrad), pos: -1, orientation: 0);

		Out.ar(2, LeakDC.ar(osc_z*envelope1));
		Out.ar(2, LeakDC.ar(osc_y*envelope2));
		Out.ar(2, LeakDC.ar(osc_x*envelope3));

	Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(2)),pos:position.wrap(-1,1)));
	Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(3)),pos:position.wrap(-1,1)));
	Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(4)),pos:position.wrap(-1,1)));

		position=(position+(360-(360/1.61803398874989484820458683436563811772030917980576))).wrap(0,360);

		m = m+1;
		over1 = (m+1)/1;
		over2 = (m+1)/1;

		trig = TDelay.ar(trig,0.001);
	};

	//Out.ar(5,LeakDC.ar(InFeedback.ar([2,3],2)*envelope4));
	//Out.ar(6,LeakDC.ar(InFeedback.ar([2,4],2)*envelope4));
	//Out.ar(7,LeakDC.ar(InFeedback.ar([3,4],2)*envelope4));

	//	Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(5))*envelope,pos:0));
	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(6))*envelope,pos:0));
	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(7))*envelope,pos:0));


		//Out.ar(5, LeakDC.ar(osc_z*envelope4));
	//	Out.ar(5, LeakDC.ar(osc_y*envelope5));
		//Out.ar(5, LeakDC.ar(osc_x*envelope6));

	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(2))*envelope,pos:position.wrap(-1,1)));
	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(3))*envelope,pos:position.wrap(-1,1)));
	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(4))*envelope,pos:position.wrap(-1,1)));
	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(5))*envelope,pos:position.wrap(-1,1)));
//	Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(6))*envelope,pos:position.wrap(-1,1)));
	//Out.ar(0,Pan2.ar(LeakDC.ar(InFeedback.ar(7))*envelope,pos:position.wrap(-1,1)));

	//Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(2)+InFeedback.ar(3)+InFeedback.ar(4))*envelope,pos:SinOsc.ar(speed1,phase:0.degrad,mul:1)));
	//Out.ar(0,PanAz.ar(2,LeakDC.ar(InFeedback.ar(5)+InFeedback.ar(6)+InFeedback.ar(7))*envelope,pos:SinOsc.ar(speed2,phase:45.degrad,mul:1)));

}).add;
)

(
Pdef(\1, Pbind(\instrument, \sitarsun, \dur, 1,
\fundamental1,Prand([6,8,9,12],inf), \fundamental2,Prand([6,8,9,12],inf), \fundamental3,Prand([6,8,9,12],inf),
	\n1, Prand(Array.fill(12, { arg i; 1+ i }),inf), \n2, Prand(Array.fill(12, { arg i; 1+ i }),inf), \n3, Prand(Array.fill(12, { arg i; 1+ i }),inf); )).play(quant:1);)

Pdef(\1).stop
Pdef(\2).stop

[3,10,5,12,7,2,9,4,11,6,1,8] ///pyth

[1,2,5,6,8,9,12,13]///byzantine
[6,8,9,12]