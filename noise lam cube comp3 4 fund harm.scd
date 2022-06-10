
s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=14;
TempoClock.default.tempo_(120/60);
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
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(1/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el2);


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


		Out.ar(6,sig1*envd1*pr);
		Out.ar(10,sig3*envd1*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id2, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(1/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el2);

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

		Out.ar(6,sig2*envd2*pr);
		Out.ar(10,sig4*envd2*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
	Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id3, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(4/3);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el2);


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


		Out.ar(6,sig1*envd1*pr);
		Out.ar(10,sig3*envd1*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id4, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(4/3);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el2);

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

		Out.ar(6,sig2*envd2*pr);
		Out.ar(10,sig4*envd2*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
	Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id5, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(3/2);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el2);


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


		Out.ar(6,sig1*envd1*pr);
		Out.ar(10,sig3*envd1*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id6, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(3/2);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el2);

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

		Out.ar(6,sig2*envd2*pr);
		Out.ar(10,sig4*envd2*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
	Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id7, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(2/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

//envd1=EnvGen.ar(Env.perc(attack,(decay),amp/amp1),doneAction:2);
	envd1=EnvGen.ar(Env.sine((decay),amp/amp1),doneAction:2);


		24.do{
		enva=EnvGen.ar(Env.perc(attack,decay,amp/under,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


sig1=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el1);
sig3=Pan4.ar(BPF.ar(BrownNoise.ar(mul:enva),(i*under+envf),0.002),xpos:xc,ypos:yc,level:el2);


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


		Out.ar(6,sig1*envd1*pr);
		Out.ar(10,sig3*envd1*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
(
SynthDef.new(\id8, {

	arg dur=1,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,harm;
	var sig1,sig2,sig3,sig4,x=0,amp=1,fund=(440/4)*harm*(2/1);
	var enva,envb,envd1,envd2,envf;
	var under=1,over=1, attack=0.01;
	var an=0,pan=an.wrap(0,360);
	var xc=0,yc=0,zc=0;
	var i=fund*2.pow(interval/12), ii=fund/2.pow(interval/12);
	var amp1=2.pow(interval/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
	var decay=dur*((sqrt(5)+1)/2),el1=1,el2=1;

		//envd2=EnvGen.ar(Env.perc(attack,(decay),amp*amp1),doneAction:2);
		envd2=EnvGen.ar(Env.sine((decay),amp*amp1),doneAction:2);


		24.do{
		envb=EnvGen.ar(Env.perc(attack,decay,amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand,decay.rand],[-4]));


	sig2=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el1);
   sig4=Pan4.ar(BPF.ar(BrownNoise.ar(mul:envb),(ii*over+envf),0.002),xpos:xc,ypos:yc,level:el2);

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

		Out.ar(6,sig2*envd2*pr);
		Out.ar(10,sig4*envd2*pr);

	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

	aud1=PanAz.ar(2,InFeedback.ar(6),pos:LFNoise1.ar(pan1),level:env1,width:1);aud2=PanAz.ar(2,InFeedback.ar(7),pos:LFNoise1.ar(pan2),level:env2,width:1);
	aud3=PanAz.ar(2,InFeedback.ar(8),pos:LFNoise1.ar(pan3),level:env3,width:1);aud4=PanAz.ar(2,InFeedback.ar(9),pos:LFNoise1.ar(pan4),level:env4,width:1);
 aud5=PanAz.ar(2,InFeedback.ar(10),pos:LFNoise1.ar(pan5),level:env5,width:1);aud6=PanAz.ar(2,InFeedback.ar(11),pos:LFNoise1.ar(pan6),level:env6,width:1);
aud7=PanAz.ar(2,InFeedback.ar(12),pos:LFNoise1.ar(pan7),level:env3,width:1);aud8=PanAz.ar(2,InFeedback.ar(13),pos:LFNoise1.ar(pan8),level:env4,width:1);


	Out.ar(0,(aud1));Out.ar(0,(aud2));
	Out.ar(0,(aud3));Out.ar(0,(aud4));
Out.ar(0,(aud5));Out.ar(0,(aud6));
	Out.ar(0,(aud7));Out.ar(0,(aud8));
}).add;
);
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,2,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,2,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
	/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,4/3,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,4/3,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
	/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,3/2,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,3/2,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
	/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,1,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
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
	\interval,Pxrand([12,16,19,24,28,31,36,40,43,48,52,55,60,64,67,72,78,79,84],inf), \harm,Prand([6,12,18,24,30,36,42,48,54,60,66],inf),
	\pr,1,
		\w1,Pxrand([0,0,0,0,0,2],inf),\w2,Pxrand([0,0,0,0,0,2],inf),\w3,Pxrand([0,0,0,0,0,2],inf),\w4,Pxrand([0,0,0,0,0,2],inf),
	\w5,Pxrand([0,0,0,0,0,2],inf),\w6,Pxrand([0,0,0,0,0,2],inf),\w7,Pxrand([0,0,0,0,0,2],inf),\w8,Pxrand([0,0,0,0,0,2],inf),
	/*	\pan1,Pbrown(-1,1,0.5,inf),\pan2,Pbrown(-1,1,0.5,inf),\pan3,Pbrown(-1,1,0.5,inf),\pan4,Pbrown(-1,1,0.5,inf),
		\pan5,Pbrown(-1,1,0.5,inf),\pan6,Pbrown(-1,1,0.5,inf),\pan7,Pbrown(-1,1,0.5,inf),\pan8,Pbrown(-1,1,0.5,inf);*/
		\pan1,Pexprand(0.01pi,0.1pi,inf),\pan2,Pexprand(0.01pi,0.1pi,inf),\pan3,Pexprand(0.01pi,0.1pi,inf),\pan4,Pexprand(0.01pi,0.1pi,inf),
		\pan5,Pexprand(0.01pi,0.1pi,inf),\pan6,Pexprand(0.01pi,0.1pi,inf),\pan7,Pexprand(0.01pi,0.1pi,inf),\pan8,Pexprand(0.01pi,0.1pi,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
)).play(quant:1));
)
/////////////////////////////
