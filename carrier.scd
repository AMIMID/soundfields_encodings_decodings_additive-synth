(
{
	var v=343;
	var f1=1;
	var l1=(v/f1);
	var l2=l1/1;
	var f2=(v/l2);
	Out.ar([0,1],SinOsc.ar(f2.postln+SinOsc.ar(f1,mul:100,phase:0.degrad),phase:0.degrad));

}.play
)

5716,66666