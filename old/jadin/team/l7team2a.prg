Init
{
	gosub(con)
	name("-= Mickey =-")
	If(Gamenbr == 1)
		Print("Team 2a")
		Print("By Jadin Hanson")
		Print("Kermit@cp.duluth.mn.us")
		GetOthers()
		bothers=result
		store(bothers)
	endif
	Print("------------------------------------------")
	version=2.008
	RegCore(Core)
	RegCldRobot(Damage,1)
	RegAScan(AutoScan,2)
	LockGun(1)
	setaccel(5)
	d=400
	g=90
	bodyleft(5)
	scan()
	slidedist = -scandist + 5
	top=0
	gunright(180)
	slideleft=0
	slideright=95
	gosub(slide)
}
Core
{
	back(d)
	moving_back=1
	if(top == 0)
		gosub(moth)
	endif
	gosub(con)
	ahead(d)
	moving_back=0
	if(top==1)
		gosub(moth)
	endif
	getturns()
	turns=result
	if(turns>2000)
		Print("Self Destruct")
		fire(energy-1)
	endif
}
moth
{
	if(lap==4)
		if(top==0)
			slidedist = -d + 38
		else
			slidedist = d - 38
		endif
		slideright = 90
		slideleft = 0
		lockall(1)
		gosub(slide)
		lockall(0)
		moth_var=1
		lap=0
	endif
	lap=lap+1
}
slide
{
	waitfor(bodyrmn==0)
	ascanevents(0)
	blocking(0)
	back(slidedist)
	stop()
	if(slideright>0)
		bodyright(slideright)
	endif
	if(slideleft>0)
		bodyleft(slideleft)
	endif
	continue()
	ascanevents(1)
	Continue()
	waitfor(bodyrmn==0)
	slideleft = 0
	slideright = 0
	slidedist = 0
}
AutoScan
{       
	Scan()
	If(DtcRobot!=0)
		Gosub(DamageCon)
	endif
}
con
{
	scan()
	if(dtcrobot)
		if(scandist>300)
			stall(3)
		elseif(scandist>200)
			stall(2)
		elseif(scandist>100)
			stall(1)
		endif
		con_var=1
		gosub(damagecon)
		if(friend!=1 && energy>1)
			gosub(con)
		endif
	endif
	con_var=0
	friend=0
}

Damage
{       
	Stop()
	damage_temp=gunaim
	bearing = cldbearing
	Gosub(BearingToHeading)
	destAngle = heading
	Gosub(MinDegreesRight)
	GunRight(rightDegrees)
	gosub(con)
	GunLeft(gunaim-damage_temp)
	Blocking(OFF)
	Continue()
	Blocking(ON)
}
BearingToHeading
{
	heading = bodyAim + bearing
	if(heading<0)
		heading = heading + 360
	elseif(heading>359)
		heading = heading - 360
	endif
}
MinDegreesRight
{
	temp_right = destAngle - gunaim
	if(temp_right<0)
		temp_right = temp_right + 360
	endif
	temp_left = -temp_right + 360
	if(temp_right<=temp_left)
		rightDegrees = temp_right
	else
		rightDegrees = -temp_left
	endif
}
DamageCon
{
	killstrength=(dtcenergy/4)
	If(Killstrength>energy)
		killstrength=(energy-1)
	endif
	if(killstrength<1)
		killstrength=1
	endif
	getothers()
	others=result
	if((others>=4) && (energy<25 || scandist>100))
		return
	elseif(scandist>325 && cldrobot!=1 && others>1)
		friend=1
		return
	elseif(scandist<100)
		fire(killstrength)
	elseif(con_var==1)
		fire(killstrength)
	else
		fire(1) 
	endif
}
Dead
{
	GetOthers()
	others=result
	If(others==0)
		points=(points+bothers+1)
	else
		points=((bothers-others)+points)
	endif
	store(points)
	Print("As a team we've earned roughly:")
	Print(points*2)
}