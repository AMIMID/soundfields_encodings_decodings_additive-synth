s.boot;

e = Buffer.read(s,"/Users/petrostatsiopoulos/Desktop/l.wav");
k = Buffer.read(s,"/Users/petrostatsiopoulos/Desktop/r.wav");

TempoClock.default.tempo_(120/80);
(
{
var sig1,sig2, winenv,z;

winenv = Env.perc(0.01,4);

z = Buffer.sendCollection(s, winenv.discretize, 1);

sig1 = Out.ar(0,GrainBuf.ar(
	2,
	Dust.ar(3),
	4,
	k.bufnum,
	1,
		LFNoise1.ar(496).range(0,1),
	2,
		SinOsc.ar(1.61803398874989484820458683436563811772030917980576/2),
	z,
	512
	));
	sig2 = Out.ar(0,GrainBuf.ar(
	2,
	Dust.ar(3),
	4,
	e.bufnum,
	1,
		LFNoise1.ar(496).range(0,1),
	2,
		SinOsc.ar(1.61803398874989484820458683436563811772030917980576/2),
	z,
	512
	));

}.play
)


 GrainBuf.ar(2, Impulse.kr(10), 0.1, sndbuf, LFNoise1.kr.range(0.5, 2),
            LFNoise2.kr(0.1).range(0, 1), 2, pan, envbuf) * env)




