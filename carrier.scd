(
{
	var v=343;
	var f1=55;
	var l1=(v/55);
	var f2=(v/l1);
	Out.ar([0,1],SinOsc.ar(f1+SinOsc.ar(f2,mul:1)));

}.play
)

5716,66666