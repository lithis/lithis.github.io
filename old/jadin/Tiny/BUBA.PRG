Init{setaccel(4)
regdtcrobot(b,1)
scan()
d=450
bodyleft(90)
regascan(a,3)
lockall(1)
back(d)
bodyleft(90)
Name(buba)
regcldrobot(c,2)
regcore(c)}
c{E=cldrobot&t
s=0
d=-d
back(d)
if(s|E)
bodyleft(d/5)
back(d)
F=0
endif}
a{scan()
t=distrmn
F=G
if(t<10)
stop()
endif}
b{G=scandist
H=G<250|t<20
abs(F-G)
s=result<50&H&t>200
fire(H*(energy-1)*(cldmissile|p))
scan()
p=dtcrobot}