Init{Name("Bobin")
g=-1
if(gamenbr�1)
print("------------------------------------------------")
print("           STATIC DUO� V1.35")
print("� by Joerg Siegert / Graz / Austria")
print("                20 June 1996")
print("------------------------------------------------")
endif
if(g�1)
m=180
else
m=360
endif
GetOthers()
_f=result
d=result
ck=5
__=470
ci=150
dd=500
bu=2
h=-1
_z=1
SetAccel(5)
LockGun(1)
Blocking(0)
if((r�1)|(_f�1))
Gosub(br)
else
RegCldRobot(cm,10)
RegCldMissile(co,20)
Scan()
if(dtcrobot)
Fire(7)
endif
Gosub(cc)
RegCore(ch)
endif}
cc{_x=1
bv=1
_c=0
if(g==-1)
GunRight(180)
Gosub(bb)
endif
Ahead(g*400)
Gosub(x)
a=m+90
_=gunaim
Gosub(f)
GunRight(c)
_c=1
BodyLeft(90)
Gosub(bs)
_c=0
bv=0
Ahead(g*400)
Gosub(x)
a=m-45
RegCldRobot(cr,10)
RegCldMissile(ct,20)
_=gunaim
Gosub(f)
GunRight(c)
WaitFor(gunrmn�0)
j=0
_x=0}
ch{GetOthers()
d=result
Gosub(cg)
Gosub(n)
Gosub(bl)
if(d�1)
if(1)
a=m-45
_=gunaim
Gosub(f)
GunRight(c)
WaitFor(gunrmn�0)
Scan()
if((dtcrobot)&(scandist>__))
bn=1
else
j=0
bn=0
Back(g*100)
Gosub(x)
Gosub(br)
endif
endif
endif
if(bodyaim!=290)
a=290
_=bodyaim
Gosub(f)
BodyRight(c)
endif}
cg{Scan()
if(dtcrobot�0)
_z=1
endif
Gosub(bp)
if((dtcrobot�0)|((scandist>__)&(d>1)&(j!=-1))|(energy�1))
GunRight(h*ck)
endif
if((gunaim>m)|((g==-1)&(gunaim<135)))
h=-1
elseif(gunaim<(m-90))
h=1
endif}
n{if((dtcrobot�0)|(gunheat))
return
endif
if((scandist>__)&(d>1)&(j!=-1))
return
endif
if(scandist>180)
b=1
elseif(scandist>130)
b=3
elseif(scandist>80)
b=5
else
b=7
endif
if((_z�0)&(cp�gunaim))
k=k*3
if(k�7)
k=7
endif
elseif((k<1)|(k�2))
k=1
endif
b=b*k
if((dtcenergy�5)|((scandist>200)&(energy�10)))
t=1
Abs(t)
else
Truncate(scandist/45)
t=((dtcenergy-1)+result)/4
Truncate(t+.99)
if((result-2)==b)
b=b+2
elseif((result-1)==b)
b=b+1
endif
if((d>1)|(result>7)|(scandist>300))
Min(b,result)
endif
endif
if((gunaim==(m-45))&(scandist>100)&((j�1)|(r�2)))
if(d!=1)
Abs(1)
elseif(energy>dtcenergy)
Abs(result+1)
endif
endif
Min(result,energy-1)
Fire(result)
cp=gunaim
_z=0}
bl{if((dtccookie�0)|(u�1))
return
endif
if((scandist<ci)|(energy�5))
u=1
_l=scandist+25
Gosub(bf)
Ahead(_l*e)
Gosub(x)
Back(_l*e)
Gosub(x)
else
Fire(1)
endif
u=0}
cm{if(_c�0)
if((g�1)&((cldbearing<-90)|(cldbearing>90)))
return
endif
if((g==-1)&((cldbearing>-90)&(cldbearing<90)))
return
endif
if(cldenergy<2)
return
endif
endif
Stop()
v=cldbearing
Gosub(_m)
a=l
_=gunaim
Gosub(f)
GunRight(c)
WaitFor(gunrmn�0)
Scan()
Gosub(n)
p=0
Gosub(bw)
if(_c�0)
if(g�1)
a=bodyaim
else
a=bodyaim-180
endif
_=gunaim
Gosub(f)
GunRight(c)
Ahead(g*400)
else
a=270
_=bodyaim
Gosub(f)
BodyRight(c)
if(g�1)
a=270
else
a=90
endif
_=gunaim
Gosub(f)
GunRight(c)
endif}
co{}
cr{if((dtcrobot)&((cldenergy<6)|(scandist�50)))
return
else
v=cldbearing
Gosub(_m)
a=l
_=gunaim
Gosub(f)
GunRight(c)
if(c�0)
h=1
else
h=-1
endif
Gosub(bb)
Scan()
Gosub(n)
endif}
ct{cs=v
v=cldbearing
Gosub(_m)
a=l
if((a>(m-48))&(a<(m-42)))
bx=bx+1
if(bx�3)
j=-1
endif
endif
if((dtcrobot)&(cldenergy<15)&(cs!=v))
return
endif
if(g�1)
if(l>180)
a=180
elseif(l<90)
a=90
endif
else
if((l<270)&(l>135))
a=270
elseif(l<135)
a=0
endif
endif
_=gunaim
Gosub(f)
if(c�0)
h=1
else
h=-1
endif
GunRight(c)
WaitFor(gunrmn�0)
Scan()
p=0
if(k�1)
k=1.5
endif
Gosub(da)
k=1}
bp{GetTurns()
cb=result
GetOthers()
d=result
if((gunaim>=(m-(45+bu)))&(gunaim<=(m-(45-bu)))&(scandist>__))
if((dtcrobot)&(j!=-1))
j=1
cf=d
elseif((j�1)&(d�cf))
j=0
endif
endif}
bi{if(p�0)
if(distrmn)
Stop()
endif
Scan()
Gosub(n)
if(dtcrobot�0)
p=1
endif
Gosub(bi)
else
return
endif}
da{if(p�0)
if(dtcrobot)
Gosub(n)
Scan()
else
p=1
endif
else
return
endif}
_y{Ahead(g*400)
if(g�1)
a=bodyaim
else
a=bodyaim-180
endif
_=gunaim
Gosub(f)
GunRight(c)}
bb{if(gunrmn)
Scan()
Gosub(bp)
Gosub(n)
Gosub(bl)
Gosub(bb)
else
return
endif}
bs{if(bodyrmn)
Scan()
Gosub(n)
Gosub(bs)
else
return
endif}
x{if(distrmn>0)
Scan()
if(dtcmine)
Fire(1)
Stop()
Gosub(_y)
endif
if((dtcenergy)&(dtcmine�0)&(dtcrobot�0)&(dtccookie�0))
Stop()
Gosub(_y)
endif
if((_x�1)&(dtcrobot))
k=1.5
p=0
Gosub(bi)
k=1
Gosub(_y)
else
Gosub(n)
endif
Gosub(x)
else
return
endif}
bw{if(p�0)
if(distrmn)
Stop()
endif
Scan()
Gosub(n)
if((scandist>80)|(dtcrobot�0))
p=1
endif
Gosub(bw)
else
return
endif}
_d{if(_>359)
_=_-360
elseif(_<0)
_=_+359
endif}
f{cj=_
_=a
Gosub(_d)
a=_
w=a-cj
if(w<0)
w=w+360
endif
bq=-w+360
if(w�bq)
c=w
else
c=-bq
endif}
_m{_=bodyAim+v
Gosub(_d)
l=_}
cn{if((y�0)&(z�0))
_n=0
_o=100
_p=-100
_q=0
y=100
z=-100
_s=0
_g=100
_h=-100
_i=0
_j=100
_k=-100
endif
GetHitsOther()
_n=_n+result
if(result<_o)
_o=result
endif
if(result>_p)
_p=result
endif
GetHitsSelf()
_q=_q+result
if(result<y)
y=result
endif
if(result>z)
z=result
endif
GetShots()
_s=_s+result
if(result<_g)
_g=result
endif
if(result>_h)
_h=result
endif
GetHitStr()
_i=_i+result
if(result<_j)
_j=result
endif
if(result>_k)
_k=result
endif
if(i)
endif
if((i�1)|(i�3)|(i�5)|(i�7))
endif
if((i�2)|(i�3)|(i�6)|(i�7))
endif
if((i�4)|(i�5)|(i�6)|(i�7))
endif
Store(_n)
Store(_q)
Store(_s)
Store(_i)
Store(_o)
Store(y)
Store(_g)
Store(_j)
Store(_p)
Store(z)
Store(_h)
Store(_k)}
Dead{GetTurns()
cb=result
GetOthers()
d=result
if(j�0)
j=0
endif
_a=_a+j
Store(_a)
b_=b_+bn
Store(b_)
_b=_b+_f-d
if(d�0)
_b=_b+1
endif
Store(_b)
if((cb<200)&(_c�0)&(bv�1))
bc=bc+1
endif
Store(bc)
Truncate(games/20)
Max(5,result)
if((_x�0)&(r!=1))
s=s+1
if((s�result)|(s�result*2))
if(_w!=1)
print("Game Number:")
print(gamenbr)
print("I have been in my corner:")
print(s)
print("I found my partner:")
print(_a)
print("Detection Ratio:")
print(_a/s)
if(r�2)
print("I had to dogfight my partner!")
endif
endif
if(((_a/s)>.35)|(r�2))
if(_w!=1)
print("My partner seems to be here, too.")
print("Let's have some fun with robot shooting!")
_w=1
endif
elseif(_b<((_f*(_f+1)/2+1)/_f*gamenbr))
r=1
print("It seems I have to face those bad guys alone.")
print("Switching controls to Lucky Luke.")
print("chrchrchrchrchr....")
print("Howdy, folks. Here I am again.")
print("Tremble enemies. My name's LUCKY LUKE.")
print("And I am the winner of the last Robot Battle contest!")
endif
endif
endif
Store(r)
Store(_w)
Store(s)
o=gamenbr/games
if(gamenbr�games)
i=7
elseif((o�.1)|(o�.2)|(o�.3)|(o�.4)|(o�.5)|(o�.6)|(o�.7)|(o�.8)|(o�.9))
i=1
endif
Gosub(cn)
if(gamenbr�games)
print("------------------------------------------")
print("I had to dogfight my partner:")
print(b_)
print("I was possible killed by my partner: ")
print(bc)
if(r�1)
print("I switched to LuckyLuke� mode")
else
print("I stayed at StaticDuo� mode")
endif
endif}
br{RegCldRobot(cw,10)
RegCldMissile(cx,20)
RegCore(cy)
h=-1
cz=300
bj=100
bk=25
cd=100
ce=350
_e=0
bm=3
e=-g
_r=400
bo=0
q=0
bm=0
LockGun(1)
Scan()
RegCustom(ba,5,(dtcrobot)&(gunheat�0)&(energy>1))}
cy{Gosub(cl)
Gosub(_t)
Gosub(_u)
Gosub(bt)
GetOthers()
d=result
GetRandom(cz-50*d-50+50)
_r=result+50}
cl{Scan()
if(distrmn�0)
if((bd�1)&(energy>1)&(_e�0))
a=bodyaim
_=gunaim
Gosub(f)
if(c>0)
h=e
else
h=-e
endif
bd=0
endif
if(((gunrmn�0)|(bd�1))&((dtcrobot�0)|(energy�1)))
GunRight(h*360)
endif
endif}
ba{CldRobotEvents(0)
CldMissileEvents(0)
CustomEvents(ba,0)
if((gunrmn)&(energy>1))
GunLeft(10*h)
endif
Gosub(cq)
bd=1
CustomEvents(ba,1)
CldRobotEvents(1)
CldMissileEvents(1)}
_t{if(dtcmine)
CldRobotEvents(0)
CldMissileEvents(0)
_=bodyaim-gunaim
Gosub(be)
Abs(_)
if((scandist<cd)|((_<bk)|(_>(180-bk))))
if((gunrmn)&(energy>1))
GunLeft(10*h)
endif
Fire(1)
endif
CldRobotEvents(1)
CldMissileEvents(1)
endif}
_u{if(u�1)
return
endif
if(dtccookie)
u=1
_l=scandist+25
if(gunrmn)
GunLeft(10*h)
endif
if((scandist<ce)|(energy<10)|(d�2))
Gosub(bf)
Ahead(_l*e)
Gosub(_v)
e=-e
else
Fire(1)
u=0
endif
endif
u=0}
bt{if((_e�1)|((bg�1)&(distrmn)))
return
endif
if((d�1)&(dtcrobot))
if(((dtcenergy-1)*4+1)<energy)
bg=1
cu=scandist
Gosub(bf)
Ahead(cu*e)
Gosub(_v)
else
bg=0
endif
endif
_=gunaim-bodyaim
Gosub(_d)
Abs(scandist^2+_r^2-2*scandist*_r*cos(_))
cv=result^.5
if((dtcrobot)&((cv<50)|(q�1)))
Gosub(by)
e=-e
endif
if((distrmn�0)|(q�1))
q=0
Ahead(e*_r)
e=-e
endif}
cq{if((dtcrobot�0)|(gunheat))
return
endif
if((scandist>__)&(d>1))
return
endif
if(scandist>140)
b=1
q=0
elseif(scandist>110)
b=3
q=0
elseif(scandist>70)
b=5
q=1
else
b=7
q=1
endif
if((dtcenergy�5)|((scandist>180)&((energy�10)|((energy-dtcenergy)<7))))
t=1
Abs(t)
else
Truncate(scandist/45)
t=((dtcenergy-1)+result)/4
Truncate(t+.99)
if((result-2)==b)
b=b+2
elseif((result-1)==b)
b=b+1
endif
if((d>1)|(result>7)|(scandist>300))
Min(b,result)
endif
endif
Min(result,energy-1)
Fire(result)}
cx{_e=0
Abs(cldbearing)
if((result>15)&(result<165)&(cldenergy�7)&(d>1))
return
endif
if((bz�1)|(u�1)|(bg�1))
return
endif
if(cldenergy>15)
q=1
endif
bz=1
v=cldbearing
Gosub(_m)
_=l-90
Gosub(_d)
a=_
_=bodyaim
Gosub(f)
c_=c
_=l+90
Gosub(_d)
a=_
_=bodyaim
Gosub(f)
ca=c
Abs(c_)
d_=result
Abs(ca)
if(result<d_)
BodyRight(ca)
else
BodyRight(c_)
endif
a=l
_=gunaim
Gosub(f)
GunRight(c)
Gosub(bh)
Ahead(bj)
Gosub(_v)
bz=0}
cw{GetTurns()
if((d>1)|(cldenergy�energy))
if((result-bo)<bm)
Stop()
_e=0
else
_e=0
if((cldbearing<-90)|(cldbearing>90))
e=1
else
e=-1
endif
endif
bo=result
Ahead(bj*e)
endif
a=bodyaim+cldbearing
_=gunaim
Gosub(f)
GunRight(c)
WaitFor(gunrmn�0)
Scan()}
dc{Gosub(bt)}
db{if(gunrmn)
Scan()
Gosub(_t)
Gosub(_u)
Gosub(db)
else
return
endif}
bh{if(bodyrmn)
Scan()
Gosub(_t)
Gosub(_u)
Gosub(bh)
else
return
endif}
_v{if(distrmn>0)
Scan()
Gosub(_t)
Gosub(_u)
Gosub(_v)
else
return
endif}
bf{_=bodyaim-gunaim
Gosub(be)
Abs(_)
if(result>90)
a=gunaim+180
else
a=gunaim
endif
_=bodyaim
Gosub(f)
BodyRight(c)
Gosub(bh)
Gosub(by)}
by{_=bodyaim-gunaim
Gosub(be)
Abs(_)
if(result<90)
e=1
else
e=-1
endif}
be{if(_<-179)
_=_+360
elseif(_>179)
_=_-360
endif}
