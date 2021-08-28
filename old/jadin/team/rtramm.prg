init
{
name("TeamRam!")
regcore(tcore)
regdtcrobot(tseeone,5)
regascan(tascan,9)
lockall(1)
scan()
ahead(400)
bodyleft(90)
ahead(400)
back(200)
r=5
blocking(0)
}

tcore
{
waitfor(bodyrmn==0)
bodyleft(r)
tr=tr+r
if(tr>180 || tr<0)
 r=-r
endif
scan()
}

tseeone
{
abs(180-radaraim)
ra=result
c=cos(ra)
getothers()
if((c*scandist)<300||result<2)
 ahead(scandist+5)
 waitfor(distrmn==0)
 back(scandist+5)
 waitfor(distrmn==0)
endif
}

tascan
{
scan()
}
