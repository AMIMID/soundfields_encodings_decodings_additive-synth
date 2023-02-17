s.options.sampleRate = 44100;
s.options.numBuffers = 1024*4;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.options.device_("USB Sound Device");
s.record(numChannels:6) ;
s.record(bus:2,numChannels:1))

s.options.numWireBufs = 1024*4;

s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/38);
s.options.memSize = 8192*8;
s.waitForBoot
s.reboot;


~a= Buffer.read(s,path:"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_230216_235756.wav");
~a.play
~a.numFrames;
~a.numChannels;
~a.duration;
numSamples = numFrames * numChannels
~a.numFrames * ~a.numChannels
~a.sampleRate
s.sampleRate
~a.query
(
(
SynthDef.new(\a, {
	arg note,time,range;
	var osc;
	var env;

	env = EnvGen.ar(Env.perc(0.02,time,1), doneAction: 2);

	osc = PlayBuf.ar(2,0,BufRateScale.kr(0),startPos:note);

	Out.ar(0,osc*env);
}).add;
);
(
SynthDef.new(\b, {
	arg note,time,range;
	var osc;
	var env;

	env = EnvGen.ar(Env.perc(0.02,time,1), doneAction: 2);

	osc = PlayBuf.ar(2,0,BufRateScale.kr(0),startPos:note);

	Out.ar(0,osc*env);
}).add;
)
)

(
Synth.new(\o,[\time,7.999999.rand]);
Synth.new(\o,[\note,~a.numFrames.rand,\time,7.999999.rand.postln]);
)

/////prime_even
(
(
Pdef(\1, Pbind(\instrument, \b, \dur,Prand([1,2,4],inf),
	\time,Prand([1,2,4],inf),
	\note,Prand(Array.geom(~a.numFrames, 1, 2),inf);
)).play(quant:1););
(
Pdef(\2, Pbind(\instrument, \b, \dur,Prand([1,2,4],inf),
	\time,Prand([1,2,4],inf),
	\note,Prand(Array.series(~a.numFrames, 1, 2),inf);
)).play(quant:1);)
)


//////////////
(
(
Pdef(\1, Pbind(\instrument, \b, \dur,Prand([1,2,4],inf),
	\time,Prand([1,2,4],inf),
	\note,Prand(Array.series(~a.numFrames,1,1),inf);
)).play(quant:1););
///

(
Pdef(\2, Pbind(\instrument, \b, \dur,Prand([1,2,4],inf),
	\time,Prand([1,2,4],inf),
	\note,Prand(Array.series(~a.numFrames,1,1),inf);
)).play(quant:1);)
)

Array.series(~a.numFrames,1,1)
((4*128)-1)*((4*128)/2);
////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\/////////////////\\\\\\\\\\\\\\\/////////////////
