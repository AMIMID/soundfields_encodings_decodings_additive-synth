
(
SynthDef.new(\id1, {

	arg dur=1, attack=0.01,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1,
	w1,w2,w3,w4,w5,w6,w7,w8,pan1,pan2,pan3,pan4,pan5,pan6,pan7,pan8,
	num=1;
	var sig1,sig2,x=0,amp=1,fund=440;  var enva,envb,envd,envf;
	var under=1,over=1;
	var an=0,pan=an.wrap(0,360);
	/*var 	i=(1+interval)/interval,ii=interval/(1+interval);*/
	var i=fund*2.pow(interval/12), ii=fund/2.pow(num/12);
	var aud1,aud2,aud3,aud4,aud5,aud6,aud7,aud8;
var env1,env2,env3,env4,env5,env6,env7,env8;
var decay=12;

y=2.pow(num/12);
	//envd=EnvGen.ar(Env.perc(attack,(24),amp/10),doneAction:2);
	envd=EnvGen.ar(Env.sine((24),amp),doneAction:2);


		24.do{
		env1=EnvGen.ar(Env.perc(attack,(24),amp/under,[-4,-4]));
		 env2=EnvGen.ar(Env.perc(attack,(24),amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand],[-4]));

		//sig1=Pan2.ar(SinOsc.ar((((fund*i))*under)+envf,mul:env1,phase:pi),pos:pan1.linlin(0,360,-1,1));
		//sig2=Pan2.ar(SinOsc.ar((((fund*ii))*over)+envf,mul:env2,phase:pi),pos:pan2.linlin(0,360,-1,1));

	//	sig1=Pan4.ar(SinOsc.ar((((fund*i))*under)+envf,mul:env1,phase:pi),xpos:pan1.linlin(0,360,-1,1),ypos:pan3.linlin(0,360,-1,1));
		//sig2=Pan4.ar(SinOsc.ar((((fund*ii))*over)+envf,mul:env2,phase:pi),xpos:pan2.linlin(0,360,1,-1),ypos:pan4.linlin(0,360,1,-1));

		sig1=PanAz.ar(8,SinOsc.ar(((i)*under)+envf,mul:env1,phase:pi),pos:Line.ar(-1*pan,1*pan,0.01),width:1,orientation:0,level:envd);
		sig2=PanAz.ar(8,SinOsc.ar(((ii)*over)+envf,mul:env2,phase:pi),pos:Line.ar(1*pan,-1*pan,0.01),width:1,orientation:0,level:envd);

		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		 an=an+137.5;
		pan=an.wrap(0,360).linlin(0,360,-1,1);


		//Out.ar(0,sig1*envd*pr);
		//Out.ar(0,sig2*envd*pr);

		Out.ar(2,BBandPass.ar(sig1,i,2)*envd*pr);
		Out.ar(2,BBandPass.ar(sig2,ii,2)*envd*pr);
	};
env1=EnvGen.ar(Env.perc(attack,decay,w1),doneAction:2);env2=EnvGen.ar(Env.perc(attack,decay,w2),doneAction:2);
env3=EnvGen.ar(Env.perc(attack,decay,w3),doneAction:2);env4=EnvGen.ar(Env.perc(attack,decay,w4),doneAction:2);
env5=EnvGen.ar(Env.perc(attack,decay,w5),doneAction:2);env6=EnvGen.ar(Env.perc(attack,decay,w6),doneAction:2);
env7=EnvGen.ar(Env.perc(attack,decay,w7),doneAction:2);env8=EnvGen.ar(Env.perc(attack,decay,w8),doneAction:2);

aud1=Pan2.ar(InFeedback.ar(2),pos:pan1,level:env1);aud2=Pan2.ar(InFeedback.ar(3),pos:pan2,level:env2);
aud3=Pan2.ar(InFeedback.ar(4),pos:pan3,level:env3);aud4=Pan2.ar(InFeedback.ar(5),pos:pan4,level:env4);
aud5=Pan2.ar(InFeedback.ar(6),pos:pan5,level:env5);aud6=Pan2.ar(InFeedback.ar(7),pos:pan6,level:env6);
aud7=Pan2.ar(InFeedback.ar(8),pos:pan7,level:env7);aud8=Pan2.ar(InFeedback.ar(9),pos:pan8,level:env8);

/*aud1=PanAz.ar(6,InFeedback.ar(2),pos:pan1,level:env1);aud2=PanAz.ar(6,InFeedback.ar(3),pos:pan2,level:env2);
aud3=PanAz.ar(6,InFeedback.ar(4),pos:pan3,level:env3);aud4=PanAz.ar(6,InFeedback.ar(5),pos:pan4,level:env4);*/
	// aud1=PanAz.ar(2,InFeedback.ar(2),pos:pan1,level:env1);aud2=PanAz.ar(2,InFeedback.ar(4),pos:pan2,level:env2,width:1);
	// aud3=PanAz.ar(2,InFeedback.ar(5),pos:pan3,level:env3);aud4=PanAz.ar(2,InFeedback.ar(6),pos:pan4,level:env4,width:1);

	Out.ar(0,(aud1)*10);Out.ar(0,(aud2)*10);
	Out.ar(0,(aud3)*10);Out.ar(0,(aud4)*10);
	Out.ar(0,(aud5)*10);Out.ar(0,(aud6)*10);
	Out.ar(0,(aud7)*10);Out.ar(0,(aud8)*10);
}).add;
)

/////////////////////////////
//329.63*2.pow(1/12).postln

( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(1,4,inf),
					\attack,Pexprand(0.01,0.1,inf),
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
	\interval,Prand([1,5,7,12],inf),
	\num,Prand([1,4,5,12],inf),
	\pr,Pexprand(0.1,0.6,inf),
		\w1,Pexprand(0.01,1,inf),\w2,Pexprand(0.01,1,inf),\w3,Pexprand(0.01,1,inf),\w4,Pexprand(0.01,1,inf),
	\w5,Pexprand(0.01,1,inf),\w6,Pexprand(0.001,1,inf),\w7,Pexprand(0.01,1,inf),\w8,Pexprand(0.01,1,inf),
	\pan1,Pbrown(-1,1,0.2,inf),\pan2,Pbrown(-1,1,0.2,inf),\pan3,Pbrown(-1,1,0.2,inf),\pan4,Pbrown(-1,1,0.2,inf),
		\pan5,Pbrown(-1,1,0.2,inf),\pan6,Pbrown(-1,1,0.2,inf),\pan7,Pbrown(-1,1,0.2,inf),\pan8,Pbrown(-1,1,0.2,inf);
/*	\pan1,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan2,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan3,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan4,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),
	\pan5,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan6,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan7,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf),\pan8,Pxrand([0,2/6,4/6,6/6,6/6,10/6],inf);*/
)).play(quant:1));


/////////////////////////////////////////////////////////////////////////////


s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=10
TempoClock.default.tempo_(120/40);
s.options.memSize = 8192*8;
s.options.sampleRate = 44100;
s.options.numBuffers = 1024*1;
s.options.numRGens=64*1;
s.options.numWireBufs=64*1;
s.options.numRGens=ouputStreamsEnabled=;
s.options.numInputBusChannels=0;
s.options.outputStreamsEnabled.postln
s.record(numChannels:12) ;
