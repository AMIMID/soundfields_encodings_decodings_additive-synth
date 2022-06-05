4pi/((sqrt(5)+1)/2)
(
(
SynthDef.new(\id1, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((1/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/1,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);

		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id2, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((1/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/1,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
					x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id3, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((4/3)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
	sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id4, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((4/3)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
	x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id5, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((4/3)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
		x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id6, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id7, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,2/3,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
		x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id8, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,2/3,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
		x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id9, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,2/3,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
			envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id10, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id11, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id12, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id13, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id14, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((1/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/1,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id15, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((1/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/1,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id16, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((4/3)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id17, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((4/3)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id18, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((4/3)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id19, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,3/4,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id20, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,2/3,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id21, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,2/3,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id22, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((3/2)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,2/3,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
			envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
		sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
				x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id23, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id24, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id25, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
		var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
(
SynthDef.new(\id26, {

		arg dur=1,detune=0,attack=4,a,b,c,d,e,f,g,k,l,m,n,o,p,q,r,s,t,u,v,w,interval=1,pr;
	var sig,x=0,amp=1,audio=0,fund=55*((2/1)*6);
	var env,freq=4,envd,envf,pan=1;
	var x1=0,x2=1,x3,y;
	   envd=EnvGen.ar(Env.perc(attack,10,1/2,[-4,-4]),doneAction:2);
		12.do{
		env=EnvGen.ar(Env.perc(attack,10,1/amp,[-4,-4]));
		envf=EnvGen.ar(Env.new([a.rand2,b.rand2,c.rand2,d.rand2,e.rand2,f.rand2,g.rand2,k.rand2,l.rand2,m.rand2,n.rand2,o.rand2,p.rand2,q.rand2,r.rand2,s.rand2,t.rand2,u.rand2,v.rand2,w.rand2],[0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand,0.999.rand],[-4]));
			sig=PanAz.ar(6,BPF.ar(BrownNoise.ar(mul:env),fund+envf,0.001),LFNoise1.ar(1/((sqrt(5)+1)/2)),width:1);
		audio = audio +sig;
		x=x+1;
		freq=(x+interval)/x;
		fund=(fund*freq+detune);
		amp=(amp*freq+detune);
			x3=x1+x2;
		x1=x2;
		x2=x3;
		y=1+(1/x3);
			pan=pan*y;
	};
	Out.ar(0,audio*envd*pr);
}).add;
);
)


//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(
(
( Pdef(\1, Pbind(\instrument, \id1,
			\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id2,
		\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\3, Pbind(\instrument, \id3,
		\dur,Pexprand(1,8,inf),
							\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\4, Pbind(\instrument, \id4,
		\dur,Pexprand(1,8,inf),
											\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\5, Pbind(\instrument, \id5,
		\dur,Pexprand(1,8,inf),
							\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\6, Pbind(\instrument, \id6,
		\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\7, Pbind(\instrument, \id7,
		\dur,Pexprand(1,8,inf),
							\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\8, Pbind(\instrument, \id8,
		\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\9, Pbind(\instrument, \id9,
		\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\10, Pbind(\instrument, \id10,
		\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\11, Pbind(\instrument, \id11,
		\dur,Pexprand(1,8,inf),
							\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\12, Pbind(\instrument, \id12,
		\dur,Pexprand(1,8,inf),
								\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\13, Pbind(\instrument, \id13,
		\dur,Pexprand(1,8,inf),
								\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));
);
(
( Pdef(\14, Pbind(\instrument, \id14,
			\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\15, Pbind(\instrument, \id15,
		\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\16, Pbind(\instrument, \id16,
		\dur,Pexprand(1,8,inf),
							\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\17, Pbind(\instrument, \id17,
		\dur,Pexprand(1,8,inf),
										\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\18, Pbind(\instrument, \id18,
		\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\19, Pbind(\instrument, \id19,
		\dur,Pexprand(1,8,inf),
					\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\20, Pbind(\instrument, \id20,
		\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\21, Pbind(\instrument, \id21,
\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\22, Pbind(\instrument, \id22,
		\dur,Pexprand(1,8,inf),
						\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
	\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\23, Pbind(\instrument, \id23,
		\dur,Pexprand(1,8,inf),
								\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\24, Pbind(\instrument, \id24,
		\dur,Pexprand(1,8,inf),
								\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\25, Pbind(\instrument, \id25,
		\dur,Pexprand(1,8,inf),
								\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));

( Pdef(\26, Pbind(\instrument, \id26,
		\dur,Pexprand(1,8,inf),
							\attack,Pexprand(0.01,1,inf),
	\interval,Pbrown(1,4,1,inf),
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
		\pr,Pexprand(1,2,inf),
\detune,Pexprand(1,8,inf);
)).play(quant:1));
)

)


s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=6
TempoClock.default.tempo_(40/120);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;