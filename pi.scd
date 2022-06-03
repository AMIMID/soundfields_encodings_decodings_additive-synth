(
var a,b,c,d;
	a=2pi;
	b=2*2pi;
	c=(3/2)*2pi;
	d=(4/3)*2pi;
{
	PanAz.ar(2,SinOsc.ar(a*50,mul:1/a),pos:LFSaw.ar(1/a),width:2)+
    PanAz.ar(2,SinOsc.ar(b*50,mul:1/b),pos:LFSaw.ar(1/b),width:2)+
	PanAz.ar(2,SinOsc.ar(c*50,mul:1/c),pos:LFSaw.ar(1/c),width:2)+
    PanAz.ar(2,SinOsc.ar(d*50,mul:1/d),pos:LFSaw.ar(1/d),width:2);
}.play
)




