Init{name(Dante)
scan()
blocking(0)
A=1-2*(gamenbr%2)
radarright(2*A)
lockgun(1)
setaccel(5)
z=600
regcore(C)
regcustom(I,2,dtcrobot)
regcustom(C,3,k&gunrmn)
regcldrobot(D,4)
regdtccookie(G,5)
bodyleft(5*A)
regcustom(H,6,distrmn<11&bodyrmn�0)}
C{scan()}
D{E=bodyrmn
q=(900+bodyaim+cldbearing-gunaim)%360-180
F=q-gunrmn
if(cldenergy�energy)
stop()
endif
k=1
gunright(q)
if(moving�0)
bodyright(E)
waitfor(bodyrmn�0&gunrmn�0)
gosub(H)
waitfor(gunrmn�0)
endif
gunleft(F)
waitfor(gunrmn�0)
k=0}
G{if(gunrmn�0&distrmn>26&distrmn<340)
b=bodyrmn
stop()
bodyright(b)
endif}
H{ahead(z)
z=-z
stop()
bodyright(90*A)
continue()
gunleft(90*A)}
I{max(7*(distrmn<19),13-scandist/15)
min(result,energy-1)
min(result,(dtcenergy+3)/4)
fire(result)
scan()}