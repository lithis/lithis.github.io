Init{name(Blake)
blocking(0)
lockgun(1)
setaccel(5)
gosub(C)
regdtcrobot(E,1)
regcldrobot(H,2)
regcustom(A,3,B|dtccookie)
regcore(C)
d=300-600*(scandist<180)
l=20
z=900
bodyleft(25)
lockgun(0)
radarleft(10)
waitfor(radarrmn�0)
lockgun(1)
regcustom(I,4,distrmn<40&bodyrmn�0)}
A{B=0
stop()
g=(360+bodyaim-g)%360
j=2*(g<270&g>90)-1
bodyleft(g-180*(j>0)-360*(g>90&j<0))
waitfor(bodyrmn�0)
back((scandist+44)*j)
waitfor(distrmn<9)
gosub(C)}
C{g=gunaim
scan()}
E{F=dtcenergy
fire(F<6&scandist<150)
min(20-scandist/10,energy-1)
min(result,(F+3)/4)
fire(result*(result>0&energy*4>F+2))
B=(F*4<energy-2|F<energy-36)
gosub(C)}
H{gosub(C)
g=(540+bodyaim+cldbearing-g)%360-180
q=g*((g>0)-(g<0))
if(cldenergy�energy|q>69)
d=-d
back(d)
stop()
bodyleft(90*(distrmn>70))
continue()
endif
scan()
if(g*z>0&q<140)
gunleft(0)
lockgun(0)
z=-z
l=-l
radarleft(l)
waitfor(radarrmn�0)
lockgun(1)
gunleft(z)
endif}
I{gunleft(z)
d=-d
back(d)
K=90-K
stop()
bodyleft(K)
continue()}