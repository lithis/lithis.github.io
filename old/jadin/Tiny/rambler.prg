Init{name(Rambler)
setaccel(5)
blocking(0)
lockall(1)
regcore(c)}
c{bodyleft(7*dtcrobot�0)
scan()
getothers()
r=result
d=dtcrobot
i=scandist
ahead(((d*(dtcenergy<energy)*(r<3))+dtccookie)*i+(d*5))
fire((d*7+(dtcmine*(i<20)))*(r<2)+(d*(500-i)/70)*(r>1))}