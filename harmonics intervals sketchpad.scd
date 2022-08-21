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

	100.do{
		Out.ar(0,Pan2.ar(SinOsc.ar(220*interval,phase:pang1.degrad,mul:1/interval),pos:0));

		a=a+angle;
		//b=b+angle;
		pang1=a.wrap(0,360);
	//	pang2=b.wrap(0,360);

	//	p1=exp(Complex(0,1)*pang1);
	//	p2=exp(Complex(0,1)*pang2);

		y1=y1+angle.rand;
		y2=y1+angle.rand;

		p1=exp(Complex(0,1)*y1);
		p2=exp(Complex(0,1)*y2);
		d=sqrt((p2.real-p1.real).squared+(p2.imag-p1.imag).squared);
		interval=interval+d;
		interval.postln;

	}
}.play
)

Complex(0,1).imag



360-(360/((sqrt(5)+1)/2))


exp(Complex(0,1)*0)