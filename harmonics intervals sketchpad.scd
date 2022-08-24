(
{
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var b=angle;
	var phi=(sqrt(5)+1)/2;
	var y1=angle.rand,y2=angle.rand;
	var pang1=a.wrap(0,360),pang2=b.wrap(0,360);
	//var p1=exp(Complex(0,1)*a), p2=exp(Complex(0,1)*b);
	var p1=exp(Complex(0,1)*y1), p2=exp(Complex(0,1)*y2);
	var d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
	var interval=d;

	160.do{
		Out.ar(0,Pan2.ar(SinOsc.ar(440*interval,phase:pang1.degrad,mul:1/interval),pos:0));

		a=a+angle;
		//b=b+angle;
		pang1=a.wrap(0,360);
	//	pang2=b.wrap(0,360);

	//	p1=exp(Complex(0,1)*pang1);
	//	p2=exp(Complex(0,1)*pang2);

		y1=y1+angle.rand;
		y2=y2+angle.rand;

		p1=exp(Complex(0,1)*y1);
		p2=exp(Complex(0,1)*y2);
		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;
		interval.postln;

	}
}.play
)
//////////////////////////////////////
(
{
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=0;
	var pang=a.wrap(0,360);
	var p1,p2,d,interval=0;

	100.do{

        p1=exp(Complex(0,1)*y);

		y=phi.rand;

		p2=exp(Complex(0,1)*y);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;
		Out.ar(0,Pan2.ar(SinOsc.ar(440*interval,phase:interval.degrad,mul:1/interval),pos:0));

		a=a+angle;
		pang=a.wrap(0,360);

	}
}.play
)
///////////////////////////////////////////////

(
{
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=0;
	var pang=a.wrap(0,360);
	var p1,p2,d,interval=0;
	//Out.ar(0,Pan2.ar(SinOsc.ar(220*interval,phase:0.degrad,mul:1/interval),pos:0));

	8.do{

        p1=exp(Complex(0,1)*y.degrad);

		y=360.linrand;

		p2=exp(Complex(0,1)*y.degrad);
		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;
		//Out.ar(0,Pan2.ar(SinOsc.ar(220*interval,phase:0.degrad,mul:1/interval),pos:0));
		a=a+angle;
		pang=a.wrap(0,360);

	}
}.play
)

exp(Complex(0,1)*3)
////

(
{
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=1;
	var pang=a.wrap(0,360);
	var p1,p2,d,interval=0;

	100.do{


		Out.ar(0,Pan2.ar(SinOsc.ar(220*y,phase:0.degrad,mul:1/y),pos:0));

		y=y+10;


		a=a+angle;
		pang=a.wrap(0,360);

	}
}.play
)
exp(Complex(0,1*90.degrad)).round(0.00001)
///////////////////////////////////////////////////////


(
{
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=0,x;
	var pang=a.wrap(0,360);
	var p1,p2,d,interval=0;
	//Out.ar(0,Pan2.ar(SinOsc.ar(220*interval,phase:0.degrad,mul:1/interval),pos:0));

	8.do{

		p1=exp(Complex(0,y.degrad)).round(0.00001);
	//	'point'.postln;
//p1.postln;
	y.postln;
			a=a+angle;
		pang=a.wrap(0,360);

		y=pang;

	//	'angle'.postln;
		p2=exp(Complex(0,y.degrad)).round(0.00001);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;
		Out.ar(0,Pan2.ar(SinOsc.ar(220*interval,phase:0.degrad,mul:1/interval),pos:0));
		//'d'.postln;
		//d.postln;
	//	'interval'.postln;
	//	interval.postln;


	}
}.play
)
//////////////////////////////////

(
{
	var a=0;
	var angle = 360-(360/((sqrt(5)+1)/2));
	var phi=(sqrt(5)+1)/2;
	var y=0,x;
	var pang=a.wrap(0,360);
	var p1,p2,d,interval=0;
	var mix;
	//Out.ar(0,Pan2.ar(SinOsc.ar(220*interval,phase:0.degrad,mul:1/interval),pos:0));

	16.do{

		p1=exp(Complex(0,y.degrad)).round(0.00001);
	//	'point'.postln;
//p1.postln;
	//y.postln;
			a=a+angle;
		pang=a.wrap(0,360);

		y=pang;

	//	'angle'.postln;
		p2=exp(Complex(0,y.degrad)).round(0.00001);

		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;
		interval.postln;
		mix=interval.linlin(1,30,0,1);
		mix.postln;
		Out.ar(0,Pan2.ar(FreeVerb.ar(SinOsc.ar(220*interval,phase:0.degrad,mul:1/interval),mix:mix,room:1,damp:0.5),pos:0));
		//'d'.postln;
		//d.postln;
	//	'interval'.postln;
	//	interval.postln;


	}
}.play
)

10.1.map(0,1)
