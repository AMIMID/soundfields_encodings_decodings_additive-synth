(
{Out.ar(0,PanAz.ar(2,SinOsc.ar(220,90.degrad),SinOsc.ar(0.1,45.degrad),width:1))}.play;

{Out.ar(2,PanAz.ar(2,SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,45.degrad),width:1))}.play;

{Out.ar(4,PanAz.ar(2,SinOsc.ar(220,45.degrad),SinOsc.ar(0.1,0.degrad),width:1))}.play;
)

s.options.numOutputBusChannels=6|




(
{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),-1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),1))}.play;

);

(
{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,MouseX.kr(0,369).degrad),0))}.play;

);

(
{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,0.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,180.degrad),SinOsc.ar(0.1,90.degrad)))}.play;

)


//////////////////////////////////////////////////////////////////////////////////x
(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),-1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),-1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0.5))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0.5))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),-0.5))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),-0.5))}.play;

//{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0))}.play;

//{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0))}.play;

)


(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,360.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),SinOsc.ar(0.1,90.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,180.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),SinOsc.ar(0.1,180.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,0.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),SinOsc.ar(0.1,270.degrad)))}.play;

)

(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),-1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0.5))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),-0.5))}.play;

)

(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,360.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,180.degrad),SinOsc.ar(0.1,90.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,180.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,180.degrad),SinOsc.ar(0.1,180.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),SinOsc.ar(0.1,0.degrad)))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,180.degrad),SinOsc.ar(0.1,270.degrad)))}.play;

)




////

//////x
(

{Out.ar(0,Pan4.ar(SinOsc.ar(220,0.degrad),xpos:-1,ypos:1))}.play;

{Out.ar(0,Pan4.ar(SinOsc.ar(220,90.degrad),xpos:0.5,ypos:-0.5))}.play;

/////y

{Out.ar(0,Pan4.ar(SinOsc.ar(220,0.degrad),xpos:0,ypos:0))}.play;

{Out.ar(0,Pan4.ar(SinOsc.ar(220,90.degrad),xpos:0,ypos:0))}.play;

/////z

{Out.ar(0,Pan4.ar(SinOsc.ar(220,0.degrad),xpos:1,ypos:-1))}.play;

{Out.ar(0,Pan4.ar(SinOsc.ar(220,90.degrad),xpos:-0.5,ypos:-0.5))}.play;

)


(

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),-1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0.5))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),0))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,0.degrad),1))}.play;

{Out.ar(0,Pan2.ar(SinOsc.ar(220,90.degrad),-0.5))}.play;

)

