Init{name(L750)
RegCore(C)
RegAScan(n,1)
LockGun(1)
d=400
g=90
h=g
gunleft(g)
s=d
l=45
gosub(i)}
C{if(v<3)
gunright(h)
v=v+1
endif
if(v==3)
h=-h
v=0
endif
s=-d
d=-d
l=g
gosub(i)}
i{ascanevents(0)
blocking(0)
back(s)
stop()
if(r)
bodyright(r)
endif
if(l)
bodyleft(l)
endif
ascanevents(1)
continue()
waitfor(bodyrmn==0)
l=0
r=0
s=0}
n{scan()
fire((dtcrobot)*(energy-1))}
