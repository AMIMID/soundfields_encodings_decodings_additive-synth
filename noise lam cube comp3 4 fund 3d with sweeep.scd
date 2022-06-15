
s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=56;
TempoClock.default.tempo_(120/100);
s.options.memSize = 8192*8;
s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.record(numChannels:6) ;
/////////////////////////////////////////////////////////////////////////////

(
(
SynthDef.new(\id1, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(1/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el2);


		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
	el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);


		Out.ar(48,sig1*envd1*pr);
		Out.ar(52,sig3*envd1*pr);

	};

	azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);

aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(52),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(53),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


Out.ar(6,(aud1));Out.ar(6,(aud2));
Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id2, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(1/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
		var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el2);

		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
		el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);

		Out.ar(48,sig2*envd2*pr);
	Out.ar(52,sig2*envd2*pr);

	};

	azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);

aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(16),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(17),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


	Out.ar(6,(aud1));Out.ar(6,(aud2));
	Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
	Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id3, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(4/3);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el2);


		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
	el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);


		Out.ar(48,sig1*envd1*pr);
		Out.ar(52,sig3*envd1*pr);

	};
		azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);

aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
  aud5=Pan4.ar(InFeedback.ar(52),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(53),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


	Out.ar(6,(aud1));Out.ar(6,(aud2));
	Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id4, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(4/3);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el2);

		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
		el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);

		Out.ar(48,sig2*envd2*pr);
	Out.ar(52,sig2*envd2*pr);

	};
		azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);


aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(16),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(17),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


	Out.ar(6,(aud1));Out.ar(6,(aud2));
	Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
	Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id5, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(3/2);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el2);


		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
	el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);


		Out.ar(48,sig1*envd1*pr);
		Out.ar(52,sig3*envd1*pr);

	};

		azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);


aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(16),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(17),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


	Out.ar(6,(aud1));Out.ar(6,(aud2));
	Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id6, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(3/2);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el2);

		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
		el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);

		Out.ar(48,sig2*envd2*pr);
	Out.ar(52,sig2*envd2*pr);

	};
		azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);

aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(16),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(17),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


	Out.ar(6,(aud1));Out.ar(6,(aud2));
	Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
	Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id7, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(2/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.005),xpos:xc,ypos:yc,level:el2);


		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
	el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);


		Out.ar(48,sig1*envd1*pr);
		Out.ar(52,sig3*envd1*pr);

	};
		azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);

aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(16),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(17),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


Out.ar(6,(aud1));Out.ar(6,(aud2));
Out.ar(6,(aud3));Out.ar(6,(aud4));
Out.ar(6,(aud5));Out.ar(6,(aud6));
Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id8, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,lr=1,fb=1,ud=1;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=55*(6*3.pow(1))*(2/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;
	var elevation1=1,elevation2=1,elevation3=1;
	var azimuth;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.005),xpos:xc,ypos:yc,level:el2);

		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360);
		xc=Spherical.new(1,pan.degrad,pan.degrad).x;
		yc=Spherical.new(1,pan.degrad,pan.degrad).y;
		zc=Spherical.new(1,pan.degrad,pan.degrad).z;
		el1=zc.wrap(0,1);
		el2=zc.neg.wrap(0,1);

		Out.ar(48,sig2*envd2*pr);
	Out.ar(52,sig2*envd2*pr);

	};
		azimuth=Cartesian.new(lr,fb,ud).asComplex;
	elevation3=Cartesian.new(lr,fb,ud).phi.wrap(0,1);
	elevation2=Cartesian.new(lr,fb,ud).phi.neg.wrap(0,1);
	elevation1=Cartesian.new(lr,fb,ud).phi.reciprocal.wrap(0,1);

env1=EnvGen.ar(Env.perc(attack,decay,w1*elevation1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2*elevation1),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3*elevation1),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4*elevation1),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5*elevation1),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6*elevation1),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7*elevation3),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8*elevation2),doneAction:2);

aud1=Pan4.ar(InFeedback.ar(48),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env1); aud2=Pan4.ar(InFeedback.ar(49),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env2);
aud3=Pan4.ar(InFeedback.ar(50),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env3); aud4= Pan4.ar(InFeedback.ar(51),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env4);
 aud5=Pan4.ar(InFeedback.ar(16),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env5);aud6=Pan4.ar(InFeedback.ar(17),xpos:azimuth.real.wrap(-1,1),ypos:azimuth.imag.wrap(-1,1),level:env6);
aud7=InFeedback.ar(54);aud8=InFeedback.ar(55);


	Out.ar(6,(aud1));Out.ar(6,(aud2));
	Out.ar(6,(aud3));Out.ar(6,(aud4));
	Out.ar(6,(aud5));Out.ar(6,(aud6));
	Out.ar(10,(aud7)*env7);Out.ar(11,(aud8)*env8);
}).add;
);
(
SynthDef.new(\id9, {

	    Out.ar(12,PanAz.ar(6,InFeedback.ar(6),pos:LFSaw.ar(1),level:1,width:1));
		Out.ar(18,PanAz.ar(6,InFeedback.ar(7),pos:LFSaw.ar(1),level:1,width:1));
		Out.ar(24,PanAz.ar(6,InFeedback.ar(8),pos:LFSaw.ar(1),level:1,width:1));
		Out.ar(30,PanAz.ar(6,InFeedback.ar(9),pos:LFSaw.ar(1),level:1,width:1));
		Out.ar(36,PanAz.ar(6,InFeedback.ar(10),pos:LFSaw.ar(1),level:1,width:1));
		Out.ar(42,PanAz.ar(6,InFeedback.ar(11),pos:LFSaw.ar(1),level:1,width:1));

	Out.ar(0,InFeedback.ar(12));Out.ar(0,InFeedback.ar(23));Out.ar(0,InFeedback.ar(28));Out.ar(0,InFeedback.ar(33));Out.ar(0,InFeedback.ar(38));Out.ar(0,InFeedback.ar(43));
	Out.ar(1,InFeedback.ar(13));Out.ar(1,InFeedback.ar(18));Out.ar(1,InFeedback.ar(29));Out.ar(1,InFeedback.ar(34));Out.ar(1,InFeedback.ar(39));Out.ar(1,InFeedback.ar(44));
	Out.ar(2,InFeedback.ar(14));Out.ar(2,InFeedback.ar(19));Out.ar(2,InFeedback.ar(24));Out.ar(2,InFeedback.ar(35));Out.ar(2,InFeedback.ar(40));Out.ar(2,InFeedback.ar(45));
	Out.ar(3,InFeedback.ar(15));Out.ar(3,InFeedback.ar(20));Out.ar(3,InFeedback.ar(25));Out.ar(3,InFeedback.ar(30));Out.ar(3,InFeedback.ar(41));Out.ar(3,InFeedback.ar(46));
	Out.ar(4,InFeedback.ar(16));Out.ar(4,InFeedback.ar(21));Out.ar(4,InFeedback.ar(26));Out.ar(4,InFeedback.ar(31));Out.ar(4,InFeedback.ar(36));Out.ar(4,InFeedback.ar(47));
	Out.ar(5,InFeedback.ar(17));Out.ar(5,InFeedback.ar(22));Out.ar(5,InFeedback.ar(27));Out.ar(5,InFeedback.ar(32));Out.ar(5,InFeedback.ar(37));Out.ar(5,InFeedback.ar(42));

}).add;
)
)

(
( Pdef(\1, Pbind(\instrument, \id1,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/6,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
		\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id2,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/6,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
			\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id3,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/8,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
		\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id4,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/8,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
			\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\5, Pbind(\instrument, \id5,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/9,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
		\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\6, Pbind(\instrument, \id6,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/9,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
			\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\7, Pbind(\instrument, \id7,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/12,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
		\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);

)).play(quant:1));
( Pdef(\8, Pbind(\instrument, \id8,
		\dur,Pexprand(8,16,inf),
	\a,Pexprand(1,20,inf),
	\b,Pexprand(1,20,inf),
	\c,Pexprand(1,20,inf),
	\d,Pexprand(1,20,inf),
	\e,Pexprand(1,20,inf),
	\f,Pexprand(1,20,inf),
	\g,Pexprand(1,20,inf),
	\k,Pexprand(1,20,inf),
	\l,Pexprand(1,20,inf),
	\m,Pexprand(1,20,inf),
	\n,Pexprand(1,20,inf),
	\o,Pexprand(1,20,inf),
		\p,Pexprand(1,20,inf),
	\q,Pexprand(1,20,inf),
		\r,Pexprand(1,20,inf),
	\s,Pexprand(1,20,inf),
	\t,Pexprand(1,20,inf),
		\u,Pexprand(1,20,inf),
	\v,Pexprand(1,20,inf),
	\w,Pexprand(1,20,inf),
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,76,79,84],inf),
	\pr,1/12,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
		\lr,Pbrown(1,10,1,inf),\fb,Pbrown(1,10,1,inf),\ud,Pbrown(1,10,1,inf);
)).play(quant:1));
Synth.new(\id9);
)
/////////////////////////////
