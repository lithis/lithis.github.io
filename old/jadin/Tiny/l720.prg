init{name(L720)
regcore(c)
regascan(s,1)
d=400
g=90
back(d)
bodyleft(g)
lockall(1)}
c{back(d)
gethitsother()
h=result
getshots()
t=result
if(h-r<(t-u/2))
gunleft(g)
endif
r=h
u=t
ahead(d)}
s{scan()
fire((energy-1)*dtcrobot)}