 {Out.ar(0,PanAz.ar(3,WhiteNoise.ar(0.1),pos:-1,width:2,orientation:0))}.play



(Env.new([0,1,0],[4,4],curve:\sine)).plot


(Env.new([0,1,0,1,0],[2],curve:\sine)).plot

(Env.new([0,0.5,1,0,1,0],[0.01,1,2,2,2],curve:\sine)).plot




(Env.new([0,1,0,-1,0],[2],curve:[-4,4])).plot///////////0

(Env.new([0,1,0,-1,0,1],[0.01,2,2,2,2],curve:[-4,4])).plot




(Env.new([0,0,1,0,-1,0],[2,2,2,2],curve:[4,-4])).plot////////////90
(Env.new([0,0,1,0,-1,0],[1,2,2,2,2],curve:[4,-4])).plot//////////////45


