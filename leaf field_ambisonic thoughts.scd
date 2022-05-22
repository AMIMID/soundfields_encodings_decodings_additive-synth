
(
SynthDef.new(\id1, {

	arg dur=1, attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr,y=1;
	var sig1,sig2,x=0,amp=1,fund=600;  var env1,env2,envd,envf;
	var under=1/6,over=1;  var an1=360,an2=360,pan1=an1.wrap(0,360),pan2=an2.wrap(0,360);
	var msig1,msig2,audio1,audio2,	i=(y+interval)/interval,ii=interval/(y+interval);

	envd=EnvGen.ar(Env.sine((12*dur),amp),doneAction:2);

		18.do{
		env1=EnvGen.ar(Env.perc(attack,(12*dur),amp/under,[-4,-4]));
		 env2=EnvGen.ar(Env.perc(attack,(12*dur),amp/over,[-4,-4]));

		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand,(12*dur).rand],[-4]));

		//sig1=Pan2.ar(SinOsc.ar((((fund*i))*under)+envf,mul:env1,phase:pi),pos:pan1.linlin(0,360,-1,1));
		//sig2=Pan2.ar(SinOsc.ar((((fund*ii))*over)+envf,mul:env2,phase:pi),pos:pan2.linlin(0,360,-1,1));

			//sig1=Pan4.ar(SinOsc.ar((((fund*i))*under)+envf,mul:env1,phase:pi),xpos:pan1.linlin(0,360,-1,1),ypos:pan1.linlin(0,360,-1,1));
		//sig2=Pan4.ar(SinOsc.ar((((fund*ii))*over)+envf,mul:env2,phase:pi),ypos:pan2.linlin(0,360,-1,1),ypos:pan1.linlin(0,360,-1,1));

		sig1=PanAz.ar(18,SinOsc.ar((((fund*i))*under)+envf,mul:env1,phase:pi),pos:LFSaw.ar(pan1.linlin(0,360,1,1/4)),width:1,orientation:0);
		sig2=PanAz.ar(18,SinOsc.ar((((fund*ii))*over)+envf,mul:env2,phase:pi),pos:LFSaw.ar(pan2.linlin(0,360,1,1/4)),width:1,orientation:0);

		x=x+1;
		over=(x+1)/1;
		 under=1/(x+1);

		an1=an1-137.5;
		 an2=an2+137.5;
		pan1=an1.wrap(0,360);
		pan2=an2.wrap(0,360);

		//Out.ar(2,sig1*envd*pr);
		//Out.ar(2,sig2*envd*pr);
		Out.ar(2,BBandPass.ar(sig1,1200,1)*envd*pr);
		Out.ar(2,BBandPass.ar(sig2,1200,1)*envd*pr);
	};
	///propably achievable with iteration
		Out.ar(0,Pan2.ar(InFeedback.ar(2),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(3),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(4),pos:0.174));
		Out.ar(0,Pan2.ar(InFeedback.ar(5),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(6),pos:-0.174));
		Out.ar(0,Pan2.ar(InFeedback.ar(7),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(8),pos:0.413));
		Out.ar(0,Pan2.ar(InFeedback.ar(9),pos:0.413));
		Out.ar(0,Pan2.ar(InFeedback.ar(10),pos:0.225));
		Out.ar(0,Pan2.ar(InFeedback.ar(11),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(12),pos:-0.225));
		Out.ar(0,Pan2.ar(InFeedback.ar(13),pos:-0.413));
		Out.ar(0,Pan2.ar(InFeedback.ar(14),pos:-0.413));
		Out.ar(0,Pan2.ar(InFeedback.ar(15),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(16),pos:1));
		Out.ar(0,Pan2.ar(InFeedback.ar(17),pos:0));
		Out.ar(0,Pan2.ar(InFeedback.ar(18),pos:-1));
		Out.ar(0,Pan2.ar(InFeedback.ar(19),pos:0));

}).add;
)

/////////////////////////////	i=2.pow(interval/12);

(
( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(1,2,inf),
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
	\interval,Pbrown(1,5,1,inf),
	\y,Pbrown(0,1,1,inf),
	\pr,Pexprand(0.1,0.6,inf);
)).play(quant:1));

)




s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=20
TempoClock.default.tempo_(30/120);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:12) ;