Init
{
#rondlopen=0
#seesawing=1
#muurkruipen=0

if (rondlopen==1)
    seesawing=0
    muurkruipen=1
    rondlopen=0
endif

# The_Driller
# The Energizer
# The Dodger
# The Trashcan

name("Lycanthrope")
setaccel(5)
idle_bodyturns=0
multi_robot_indicator=0
    if (gamenbr==1)
        print ("   l      y      c      a      n      t      h      r      o      p      e      ")
        print (" ")
        print ("                      Version 1.18    06-07-1998")
        print ("")
        print ("           Arjen Gnodde: Master.Deckbuilder@iwg.nl")
        _neural_seesawing=0
        _neural_muurkruipen=0
        _neural_rondlopen=0
        overwinningen_muurkruipen=0
        overwinningen_seesawing=0
        overwinningen_rondlopen=0
        _neural_ratio_seesawing=1.00
        _neural_ratio_muurkruipen=1.00
        _neural_ratio_rondlopen=1.00
    endif
    if ((_aantal_seesawing>50) and (seesawing==1) and (_neural_seesawing<0.6))
        rondlopen=1
        seesawing=0
        muurkruipen=0
    endif
    if ((_aantal_rondlopen>50) and (_neural_rondlopen<0.6) and (rondlopen==1))
        rondlopen=0
        seesawing=0
        muurkruipen=1
    endif
    if ((_aantal_muurkruipen>100) and (_neural_muurkruipen<0.6) and (muurkruipen==1))
        rondlopen=0
        seesawing=1
        muurkruipen=0
    endif
    if (rondlopen==0 and seesawing==0 and muurkruipen==0)
        muurkruipen=1
    endif
    if ((gamenbr<25) and (seesawing==0))
		rondlopen=0
		seesawing=0
		muurkruipen=1
	endif
#    if ((rondlopen==0) and (_aantal_rondlopen<11) and (_aantal_rondlopen>0))
#        rondlopen=1
#        seesawing=0
#        muurkruipen=0
#    endif
#    if ((seesawing==0) and (_aantal_seesawing<11) and (_aantal_seesawing>0))
#        rondlopen=0
#        seesawing=1
#        muurkruipen=0
#    endif
getothers ()
anderen=result
    if (result>1)
        regcore(seesawinit)
    elseif (seesawing==1)
        regcore (SeesawInit)
    elseif (muurkruipen==1)
        regcore (InitQ)
    endif
}

Dead
{
Temp_Left=0
getothers ()
anderen=result
    if ((anderen==1) AND (muurkruipen==1) and (Temp_Left==0))
        Temp_Left=1
        _aantal_muurkruipen=_aantal_muurkruipen+1
        his_score=his_score+2
        _neural_muurkruipen=(overwinningen_muurkruipen/(_aantal_muurkruipen-overwinningen_muurkruipen))
            if ((_neural_muurkruipen>1.5) and (_aantal_muurkruipen>1))
                _neural_ratio_muurkruipen=_neural_ratio_muurkruipen+0.001
                min(1.3,_neural_ratio_muurkruipen)
                _neural_ratio_muurkruipen=result
            endif
            if (_neural_muurkruipen>=_neural_ratio_muurkruipen)
                seesawing=0
                rondlopen=0
                muurkruipen=1
            else
                seesawing=1
                muurkruipen=0
                rondlopen=0
            endif
    endif
    if ((anderen==1) AND (seesawing==1) AND (Temp_Left==0))
        Temp_Left=1
        _aantal_seesawing=_aantal_seesawing+1
        his_score=his_score+2
        _neural_seesawing=(overwinningen_seesawing/(_aantal_seesawing-overwinningen_seesawing))
            if ((_neural_seesawing>1.5) and (_aantal_seesawing>1))
                _neural_ratio_seesawing=_neural_ratio_seesawing+0.001
                min(1.3,_neural_ratio_seesawing)
                _neural_ratio_seesawing=result
            endif
            if (_neural_seesawing>=_neural_ratio_seesawing)
                seesawing=1
                muurkruipen=0
                rondlopen=0
            else
                seesawing=0
                muurkruipen=0
                rondlopen=1
            endif
    endif
    if ((anderen==1) AND (rondlopen==1) and (Temp_Left==0))
        Temp_Left=1
        _aantal_rondlopen=_aantal_rondlopen+1
        his_score=his_score+2
        _neural_rondlopen=(overwinningen_rondlopen/(_aantal_rondlopen-overwinningen_rondlopen))
            if ((_neural_rondlopen>1.5) and (_aantal_rondlopen>1))
                _neural_ratio_rondlopen=_neural_ratio_rondlopen+0.001
                min(1.3,_neural_ratio_rondlopen)
                _neural_ratio_rondlopen=result
            endif
            if (_neural_rondlopen>=_neural_ratio_rondlopen)
                seesawing=0
                rondlopen=1
                muurkruipen=0
            else
                seesawing=0
                muurkruipen=1
                rondlopen=0
            endif
    endif
    if ((anderen==0) AND (muurkruipen==1) AND (Temp_Left==0))
        Temp_Left=1
        _aantal_muurkruipen=_aantal_muurkruipen+1
        overwinningen_muurkruipen=overwinningen_muurkruipen+1
        my_score=my_score+2
        seesawing=0
        rondlopen=0
        muurkruipen=1
            if ((_aantal_muurkruipen-overwinningen_muurkruipen)>0)
                _neural_muurkruipen=(overwinningen_muurkruipen/(_aantal_muurkruipen-overwinningen_muurkruipen))
            endif
            if ((_neural_muurkruipen>1.5) and (_aantal_muurkruipen>1))
                _neural_ratio_muurkruipen=_neural_ratio_muurkruipen+0.001
                min(1.3,_neural_ratio_muurkruipen)
                _neural_ratio_muurkruipen=result
            endif
    endif
    if ((anderen==0) AND (seesawing==1) and (Temp_Left==0))
        Temp_Left=1
        _aantal_seesawing=_aantal_seesawing+1
        overwinningen_seesawing=overwinningen_seesawing+1
        my_score=my_score+2
        seesawing=1
        muurkruipen=0
        rondlopen=0
            if ((_aantal_seesawing-overwinningen_seesawing)>0)
                _neural_seesawing=(overwinningen_seesawing/(_aantal_seesawing-overwinningen_seesawing))
            endif
            if ((_neural_seesawing>1.5) and (_aantal_seesawing>1))
                _neural_ratio_seesawing=_neural_ratio_seesawing+0.001
                min(1.3,_neural_ratio_seesawing)
                _neural_ratio_seesawing=result
            endif
    endif
    if ((anderen==0) AND (rondlopen==1) and (Temp_Left==0))
        Temp_Left=1
        _aantal_rondlopen=_aantal_rondlopen+1
        overwinningen_rondlopen=overwinningen_rondlopen+1
        my_score=my_score+2
        seesawing=0
        muurkruipen=0
        rondlopen=1
            if ((_aantal_rondlopen-overwinningen_rondlopen)>0)
                _neural_rondlopen=(overwinningen_rondlopen/(_aantal_rondlopen-overwinningen_rondlopen))
            endif
            if ((_neural_rondlopen>1.5) and (_aantal_rondlopen>1))
                _neural_ratio_rondlopen=_neural_ratio_rondlopen+0.001
                min(1.3,_neural_ratio_rondlopen)
                _neural_ratio_rondlopen=result
            endif
    endif
    if (multi_robot_indicator==0)
        print ("............................................................................... ")
        print ("   l      y      c      a      n      t      h      r      o      p      e      ")
        print ("                                 Version 1.18")
        print ("............................................................................... ")
            if (my_score>his_score)
                print ("")
                print ("Lycanthrope 1.18 has the lead with:")
                print (my_score)
                print (his_score)
                print ("")
            elseif (my_score==his_score)
                print ("")
                print ("Currently, the game is a tie:")
                print (my_score)
                print (his_score)
                print ("")
            else
                print ("")
                print ("Opponent has the lead with:")
                print (his_score)
                print (my_score)
                print ("")
            endif
    endif
store (overwinningen_muurkruipen)
store (overwinningen_seesawing)
store (overwinningen_rondlopen)
store (his_score)
store (my_score)
store (muurkruipen)
store (seesawing)
store (rondlopen)
store (_aantal_muurkruipen)
store (_aantal_seesawing)
store (_aantal_rondlopen)
store (_neural_muurkruipen)
store (_neural_seesawing)
store (_neural_rondlopen)
store (_neural_ratio_seesawing)
store (_neural_ratio_muurkruipen)
store (_neural_ratio_rondlopen)
}

Little
{
bodyright(30)
multi_robot_indicator=1
first_rundist=0
setaccel(5)
regcldrobot(vlucht1,1)
regcore(little2)
}

little2
{
radarright(10)
lockgun(1)
blocking(off)
ahead(50)
rundist=500
regcore(a)
}

a
{
#gosub (aantal)
gosub(g)
gosub(d)
	if ((radaraim>10) and (gunaim<>radaraim-10))
		blocking (on)
		syncgun()
		gunleft (10)
		blocking (off)
		print ("did it")
	endif
gosub(watch)
}

e
{
gosub (watch)
gosub(g)
opponent_energy=0
}

aantal
{
getothers()
	if (result<2)
		rundist=500
		regcore (core1)
	elseif (result==3)
		regdtccookie(foundcookie3,5)
	endif
}

watch
{
	if (cldrobot)
		gosub (vlucht1)
	endif
scan()
    if(dtcenergy and scandist<130 and gunheat<3 and dtcrobot)
        gosub (optimumfire)
        gosub (MEF)
        fire(result)
    endif
	if (scandist<80 and dtcenergy and dtcrobot)
		stop()
		cldrobotevents(off)
		blocking (on)
		lockgun(off)
		syncgun()
		blocking (off)
		lockgun(on)
		cldrobotevents(on)
		gosub(watch)
	endif
	if (dtcenergy and moving==0 and dtcrobot)
		stop()
		gosub(watch)
	endif
	if (radaraim==gunaim)
		blocking (on)
		lockgun(off)
		radarright(10)
		blocking (off)
		lockgun(on)
	endif

}


h
{
    if(rundist<0)
        back(500)
        rundist=-rundist
    endif
}

i
{
    if(rundist>0)
        ahead(500)
        rundist=-rundist
    endif
}

d
{
	if (radarrmn<200)
		radarright(rundist*rundist)
	endif
gosub(g)
}

g
{
temp_left=gunaim
temp_right=bodyaim
    if(temp_left>temp_right+29)
            if(temp_left<temp_right+71)
                gosub(h)
            endif
    endif
    if(temp_left>temp_right+209)
            if(temp_left<temp_right+251)
                gosub(i)
            endif
    endif
    if(temp_left>temp_right-149)
            if(temp_left<temp_right-109)
                gosub(i)
            endif
    endif
    if (moving==0)
        gosub(i)
        gosub(h)
    endif
	if (distrmn<20)
		ahead(rundist)
		rundist=-rundist
	endif
}
#####################################################################
#                                                                   #
#                         LYCANTHROPE SEESAW                        #
#                                                                   #
#####################################################################
SeeSawInit
{
drilling=0
regcore (Core1)
regcldrobot (robothit,1)
blocking (off)
scan()
    if ((dtcrobot) and (energy>8))
        gosub (MEF7)
        fire(result)
            if ((moving==0) or (cldrobot))
                ahead (400)
                lockgun(on)
            endif
        gosub (seesawinit)
    else
        lockgun(false)
        radarright (10)  # 10
        lockgun(true)
        ramming=0
        rundist=500
            if ((muurkruipen==1) or (rondlopen==1))
                rundist=250
                gosub (collideseesaw)
            endif
        regcore (Core1)
    endif
}

Core1
{
drilling=0
    If(radarrmn<200)
        gosub (gunaiming)
        gosub(Draaien)
    endif
gosub (gunaiming)
scan()
    if (dtcrobot)
        gosub(robot)
        gosub (gunaiming)
    endif
        if (dtccookie)
        gosub (foundcookie3)
        gosub (gunaiming)
    endif
gosub (gunaiming)
    if (distrmn<55)
        ahead (0)
        gosub (NoMove)
    endif
    if (energy==1)
        regcore (lowenergyseesaw)
    endif
    if ((radaraim>10) and (gunaim<>radaraim-10))  #10
        blocking (on)
        syncgun()
        gunleft (10)
        blocking (off)
    endif
gosub (gunaiming)
}

GunAiming1
{
    if (rundist<0)
            if (bodyaim==0)
                blocking (on)
                bodyright (40)
                blocking (off)
            endif
        ahead (-500)
        rundist=-rundist
    endif
}

GunAiming2
{
    if (rundist>0)
        ahead (500)
        rundist=-rundist
    endif
}

Draaien
{
radarright(3600)
gosub (gunaiming)
}

NoMove
{
ahead(-rundist)
rundist=-rundist
    if ((distrmn<160) AND (bodyaim<>0) AND (bodyaim<>90) AND (bodyaim<>180) AND (bodyaim<>270))
        hoekturn_teller=hoekturn_teller+1
            if (hoekturn_teller>=3)
                blocking (on)
                bodyright (45)
                blocking (off)
                hoekturn_teller=0
            endif
    else
        hoekturn_teller=0
    endif
gosub (gunaiming)
}

Robot
{
    if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0))
        opponent_energy=dtcenergy
    endif
temp_left=150+energy
max(200,150+energy)
temp_left=result
temp_right=100+energy
max(100,temp_right)
temp_right=result
    if (energy>1)
            if ((opponent_energy==1) and (energy>2))
                fire (1)
                rundist=150
                gosub (collideSeeSaw)
            elseif ((opponent_energy-1)*5<energy)
                fire (1)
                rundist=150
                gosub (collideSeeSaw)
            elseif ((opponent_energy==1) and (energy==2) and (scandist<50))
                fire(1)
            elseif ((opponent_energy==1) and (energy==2))
                gosub (collideseesaw)
            elseif (scandist<50)
                gosub (OptimumFire)
                min (energy-1,result)
                max (result,0)
                fire (result)
            elseif (scandist<temp_right)
                gosub (OptimumFire)
                min ((energy-((dtcenergy/4)+1)),result)
                max(result,0)
                gosub (MEF)
                fire (result)
	    elseif ((scandist<temp_left) and (energy>2))
                gosub (MEF1)
                fire(result)
            elseif ((energy==2) and (scandist<60))
                fire (1)
            endif
    endif
gosub (gunaiming)
scan()
    if (dtcrobot)
        gosub (robot)
    endif
    if ((radaraim<bodyaim+10) and (radaraim>bodyaim-10) and (energy>dtcenergy) and (scandist<50))
        print ("The Dodger active")
        print ("preparing The Driller")
        gosub (Dodger)
    endif
}

CollideSeeSaw
{
norm_degrees=radaraim-bodyaim
    if (norm_degrees<0)
        norm_degrees=norm_degrees+360
    endif
    if ((norm_degrees>=0) AND (norm_degrees<=90))
        blocking (on)
        bodyright (norm_degrees-10)
        blocking (off)
        hoekturn_teller=0
        ahead (scandist+10)
            if (rundist<0)
                rundist=-rundist
            endif
    elseif ((norm_degrees>=270) AND (norm_degrees<=360))
        blocking (on)
        bodyleft (360+10-norm_degrees)
        hoekturn_teller=0
        blocking (off)
        ahead (scandist+10)
            if (rundist<0)
                rundist=-rundist
            endif
    elseif ((norm_degrees>=180) AND (norm_degrees<=270))
        blocking (on)
        bodyright (norm_degrees-180-10)
        hoekturn_teller=0
        blocking (off)
        back (scandist+10)
            if (rundist>0)
                rundist=-rundist
            endif
    elseif ((norm_degrees>=90) AND (norm_degrees<=180))
        blocking (on)
        bodyleft (180+10-norm_degrees)
        hoekturn_teller=0
        blocking (off)
        back (scandist+10)
            if (rundist>0)
                rundist=-rundist
            endif
    endif
scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
#scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
scan()
    if (dtcrobot)
        gosub (robot)
    endif
gosub (Trashcan)
print("The Trashcan active")
}

FoundCookie3
{
temp_left=350
    if (scandist<temp_left+50)
        norm_degrees=radaraim-bodyaim
            if (norm_degrees<0)
                norm_degrees=norm_degrees+360
            endif
            if ((norm_degrees>=0) AND (norm_degrees<=90))
                    if ((norm_degrees-10<60) or (scandist<temp_left+50))
                        blocking (on)
                        bodyright (norm_degrees-10+(rondlopen*10))
                        hoekturn_teller=0
                        ahead (scandist+15)
                        blocking (off)
                            if (rundist<0)
                                rundist=-rundist
                            endif
                    endif
            elseif ((norm_degrees>=270) AND (norm_degrees<=360))
                    if ((360+10-norm_degrees<60) or (scandist<temp_left+50))
                        blocking (on)
                        bodyleft (360+10-norm_degrees+(rondlopen*10))
                        hoekturn_teller=0
                        ahead (scandist+15)
                        blocking (off)
                            if (rundist<0)
                                rundist=-rundist
                            endif
                    endif
            elseif ((norm_degrees>=180) AND (norm_degrees<=270))
                    if ((norm_degrees-180-10<60) or (scandist<temp_left+50))
                        blocking (on)
                        bodyright (norm_degrees-180-10-(rondlopen*10))
                        hoekturn_teller=0
                        back (scandist+15)
                        blocking (off)
                            if (rundist>0)
                                rundist=-rundist
                            endif
                    endif
            elseif ((norm_degrees>=90) AND (norm_degrees<=180))
                    if ((180+10-norm_degrees<60) or (scandist<temp_left+50))
                        blocking (on)
                        bodyleft (180+10-norm_degrees)#+(rondlopen*10))
                        hoekturn_teller=0
                        back (scandist+15)
                        blocking (off)
                            if (rundist>0)
                                rundist=-rundist
                            endif
                    endif
            endif
    endif
}

FoundMine
{
    if ((radaraim>=bodyaim-20) AND (radaraim<=bodyaim+20) AND (scandist<50))
        ahead (0)
        fire (1)
    elseif ((radaraim>=bodyaim+160) AND (radaraim<=bodyaim+200) AND (scandist<50))
        ahead (0)
        fire (1)
    elseif ((radaraim>=bodyaim-20) AND (radaraim<=bodyaim+20) AND (scandist<200))
        fire (1)
    elseif ((radaraim>=bodyaim+160) AND (radaraim<=bodyaim+200) AND (scandist<200))
        fire (1)
    endif
}

RobotHit
{
getturns()
if ((drilling==0) and (result>100))
    ahead(0)
endif
#rundist=-rundist   # nieuw
bearing=cldbearing
Gosub(BearingToHeading)
destAngle=heading
Gosub(MinDegreesRight)
    if (rightdegrees>-10)
        lockgun (false)
        radarleft (10)
        lockgun (true)
    endif
    if (rightdegrees>0)
        radarright (rightdegrees*1.1)  # was 1.5
    elseif (rightdegrees<0)
        radarright (rightdegrees*1.1)
    endif
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Scan()
    if (dtcrobot)
        gosub (robot)
    endif
}

Aiming
{
    if (gunrmn<>0)
        scan()
            if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0))
                gosub (Fire7Seesaw)
            endif
    endif
#gosub(gunaiming)
}

BearingToHeading
{
    if(bearing>179 OR bearing<-180)
        return
    endif
heading=bodyAim+bearing
    if(heading<0)
        heading=heading+360
    elseif(heading>359)
        heading=heading-360
    endif
}

MinDegreesRight
{
    if(destAngle>359 OR destAngle<0)
        rightDegrees=0
        return
    endif
temp_right=destAngle-gunaim
    if(temp_right<0)
        temp_right=temp_right+360
    endif
temp_left=-temp_right+360
    if(temp_right<=temp_left)
        rightDegrees=temp_right
    else
        rightDegrees=-temp_left
    endif
}

Fire7SeeSaw
{
radarright(0)
    if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1) and (scandist<50))
        gosub (OptimumFire)
        min (energy-1,result)
        fire (result)
    elseif ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1))
        gosub (OptimumFire)
        min ((energy-((dtcenergy/4)+1)),result)
        max (result,0)
        fire (result)
    elseif ((energy==2) and (scandist<60))
        fire (1)
    endif
Gosub (The_Driller)
    if (gunaim<>radaraim)
        syncgun()
    endif
scan()
    if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1))
        gosub (fire7seesaw)
    endif
}

Gunaiming
{
    if (bodyaim<330)
            if (gunaim>bodyaim+29)
                    if (gunaim<bodyaim+71)
                        gosub(gunaiming1)
                    endif
            endif
            if (gunaim>bodyaim+209)
                    if (gunaim<bodyaim+251)
                        gosub (gunaiming2)
                    endif
            endif
            if (gunaim>bodyaim-149)
                    if (gunaim<bodyaim-109)
                        gosub (gunaiming2)
                    endif
            endif
    elseif (bodyaim>=330)
            if (gunaim>bodyaim+29-360)
                    if (gunaim<bodyaim+71-360)
                        gosub(gunaiming1)
                    endif
            endif
            if (gunaim>bodyaim+209-360)
                    if (gunaim<bodyaim+251-360)
                        gosub (gunaiming2)
                    endif
            endif
            if (gunaim>bodyaim-149)
                    if (gunaim<bodyaim-109)
                        gosub (gunaiming2)
                    endif
            endif
    endif
}

LowEnergySeeSaw
{
lockgun (off)
    If(radarrmn<200)
        gosub(Draaien)
    endif
    if (distrmn<30)  #65
        ahead(0)
    endif
    if(moving==0)
        ahead(rundist)
        rundist=-rundist
    endif
scan()
    if (energy>1)
        syncgun ()
        waitfor (gunrmn==0)
        gunleft (10)
        lockgun(on)
        regcore (SeeSawInit)
    endif
}

Vlucht1
{
cldrobotevents(off)
lockgun(on)
ramming=0
abs(cldbearing)
    if(result>90)
        ahead(100)
    else
        ahead(-100)
    endif
cldrobotevents(on)
}
#########################################################################
#                                                                       #
#                          LYCANTHROPE QUIET                            #
#                                                                       #
#########################################################################
InitQ
{
drilling=0
regcldrobot(crashed,3)
lockgun(true)
blocking (off)
scan()
    if (dtcrobot<>0)
        fire(energy-1)
        ahead (400)
        gosub (seesawinit)
    else
        RegDtcRobot(fireclose,2)
            if ((scandist<200) and (dtcrobot==0))
                upper=true
                lower=false
                bodyright(5)
                ahead (scandist-5)
                stop()
                bodyleft (95)
                radarleft (90)
                continue()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                ahead (rundist)
                rundist=-rundist
                scan()
                radarleft (90)
            else
                lower=true
                upper=false
                bodyleft(5)
                back (364-scandist)
                stop()
                bodyright (95)
                radarright (90)
                continue()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                scan()
                ahead (rundist)
                rundist=-rundist
                scan()
                radarleft (90)
            endif
        regcldrobot(crashed,3)
        rundist=9999
        gunrichting=7
        first_rundist=0
        RegDtcRobot(schietklaarq,2)
        lockgun (false)
        regcore (core3)
    endif
        gunrichting=-gunrichting
}

Core3
{
drilling=0
    if(moving==0)
        ahead(rundist)
        rundist=-rundist
    endif
    if ((bodyaim<>90) and (bodyaim<>270))
        blocking (on)
            if ((bodyaim>=0) and (bodyaim<=90))
                bodyright (90-bodyaim)
            elseif ((bodyaim>90) and (bodyaim<=180))
                bodyleft (bodyaim-90)
            elseif ((bodyaim>180) and (bodyaim<=270))
                bodyright (270-bodyaim)
            elseif ((bodyaim>270) and (bodyaim<=360))
                bodyleft (bodyaim-270)
            endif
        blocking (off)
    endif
    if ((radaraim<>0) and (radaraim<>180))
            if (upper==1)
                radarleft (radaraim-180)
                waitfor (radarrmn==0)
            elseif ((lower==1) and (radaraim<360-radaraim))
                radarleft (radaraim)
                waitfor (radarrmn==0)
            elseif ((lower==1) and (360-radaraim<=radaraim))
                radarright(360-radaraim)
            endif
    endif
    if (distrmn<35)
        syncgun()
            if (gunaim<>radaraim)
                syncgun()
                    if (gunaim<>radaraim)
                        syncgun()
                            if (gunaim<>radaraim)
                                syncgun()
                                    if (gunaim<>radaraim)
                                        syncgun()
                                    endif
                            endif
                    endif
            endif
    endif
scan()
    if (dtccookie>0)
        gosub (foundcookie2)
    endif
    if (scandist<200 and dtcenergy==0 and dtcmine==0 and dtccookie==0 and gunheat==0)
            if (radaraim==180 or 0)
                gosub (ShortDistance)
            endif
    endif
getturns()
    if (result>1500)
        temp_left=25
    else
        temp_left=10
    endif
    if (distrmn<temp_left)
        ahead (0)
        ahead (rundist)
        rundist=-rundist
        scan()
        scan()
        scan()
        gunleft (gunrichting)
        gunrichting=-gunrichting
            if ((rundist>0) and (gunaim<>radaraim+7) and (radaraim==180))
                gunrichting=-gunrichting
            elseif ((rundist<0) and (upper==1) and (gunaim<>radaraim-7) and (radaraim==0))
                gunrichting=-gunrichting
            elseif ((rundist<0) and (gunaim<>radaraim+353) and (lower==1) and (radaraim==0))
                gunrichting=-gunrichting
            endif
    endif
    if(moving==0)
        ahead(rundist)
        rundist=-rundist
    endif
    if ((energy>dtcenergy+20) and (dtcrobot) and (dtcmine==0) and (dtccookie==0) and (cldrobot==0))
        regcore (seesawinit)
    endif
first_rundist=1
}

Fire1
{
    if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1))
            if (energy>2)
                min ((energy-((dtcenergy/4)+1)),1)
                max (result,0)
                gosub (MEF1)
                fire (result)
            elseif (scandist<50)
                fire (1)
            endif
    endif
    if ((dtcenergy==1) and (energy>1))
        syncgun()
        cldrobotevents (off)
        regcore (seesawinit)
    endif
scan()
}

Fire7
{
opponent_energy=dtcenergy
    if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1))
        gosub (OptimumFire)
        min ((energy-((dtcenergy/4)+1)),result)
        max (result,0)
        gosub (MEF7)
        fire (result)
    endif
    if ((dtcenergy==1) and (energy>1))
        syncgun()
        regcore (seesawinit)
    endif
scan()
}

FireClose
{
    if ((gunaim==0) or (gunaim==90) or (gunaim==180) or (gunaim==270))
            if (dtcenergy>0)
                gosub (OptimumFire)
                 min ((energy-((dtcenergy/4)+1)),result)
                 gosub (MEF)
                    if ((energy>2) and (energy-result>0))
                        fire (result)
                    endif
            endif
    elseif (scandist<100)
            if (dtcenergy>0)
                gosub (OptimumFire)
                min ((energy-((dtcenergy/4)+1)),result)
                gosub (MEF)
                    if (energy>2)
                        fire (result)
                    endif
            endif
    endif
    if ((dtcenergy==1) and (energy>1))
        syncgun()
        regcore (seesawinit)
    endif
scan()
}

FireRand
{
    if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1) and (scandist>300))
#    stall(2)
#    print("The Staller activated")
#    scan()
#        if ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1) and (scandist<350))
            gosub (OptimumFire)
            min ((energy-((dtcenergy/4)+1)),result)
            max (result,0)
            gosub (MEF)
            fire (result)
#        endif
    elseif ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1) and (scandist<300))
        gosub (OptimumFire)
        min ((energy-((dtcenergy/4)+1)),result)
        max (result,0)
        gosub (MEF)
        fire (result)
    elseif ((dtcenergy>0) and (dtcmine==0) and (dtccookie==0) and (energy>1) and (scandist>350))
        gosub (fire1)
    endif
    if ((dtcenergy==1) and (energy>1))
        syncgun()
        cldrobotevents (off)
        regcore (seesawinit)
    endif
    if (scandist>250)
        stall(2)
        ahead (rundist)
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
#        scan()
        scan()  # nieuw
        stop()
        back (rundist)
#        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan() # nieuw
    elseif (scandist>150)
        times_firerand=2
        ahead (rundist)
        scan()
        scan()
        scan()
        scan()
        scan()
        stop()
        back (rundist)
        scan()
        scan()
        scan()
        scan()
        scan()
    endif
scan()
}

FoundCookie2
{
regdtcrobot (fire7,2)
temp_left=500
    if (scandist<temp_left and distrmn>20)
        stop()
        ahead (rundist/2000)
        waitfor (moving==0)
        stop()
        blocking (off)
        gunrichting=-gunrichting
        syncgun()
        lockgun(on)
        bodyleft (85)
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        scan()
        waitfor (bodyrmn==0)
        ahead (350)
        stop()
        bodyleft (95)
        continue()
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
            if (moving<>0)
                scan()
            endif
        gunleft (180)
        waitfor (distrmn==0)
            if (upper==1)
                upper=0
                lower=1
            elseif (upper==0)
                upper=1
                lower=0
            endif
        lockgun (off)
        rundist=-rundist
    endif
RegDtcRobot(schietklaarq,2)
}

ShortDistance
{
    if (moving<>0)
        blocking (off)
        dtcrobotevents (off)
        gunrichting= -gunrichting
        Stop()
        bodyleft (85)
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
            if (dtcrobot)
                gosub (MEF1)
                fire (result)
            endif
        scan()
        waitfor (bodyrmn==0)
        ahead (scandist-30)
        stop()
        bodyleft (95)
        continue()
        radarleft (180)
        gunleft (180)
        waitfor (distrmn==0)
            if (upper==1)
                upper=0
                lower=1
            elseif (upper==0)
                upper=1
                lower=0
            endif
        dtcrobotevents (on)
        rundist=-rundist
    endif
}

Schietklaarq
{
regcore (core3)
getturns()
    if (result>1500)
        temp_right=3.14
    endif
    if ((distrmn>180 and scandist>300 and first_rundist==1 and temp_right<>3.14))
        syncgun()
        stop()
        ahead (rundist)
        rundist=-rundist
        gunrichting=-gunrichting
    endif
    if ((distrmn>300 and first_rundist==1 and temp_right<>3.14))
        syncgun()
        stop()
        ahead (rundist)
        rundist=-rundist
        gunrichting=-gunrichting
    endif
    if ((distrmn<20) or (moving==0 and first_rundist==1) or times_firerand==2)
            if (temp_right<>3.14)
                syncgun()
                stop()
                gosub (fireRand)
                times_firerand=0
            endif
    endif
    if ((dtcenergy==1) and (energy>2))
        fire(1)
        blocking (on)
        syncgun()
        lockgun(on)
        regcore (core1)
        dtcrobotevents(off)
        gosub (seesawinit)
    elseif (((dtcenergy-1)*5<energy) and (dtcenergy>0))
        fire(1)
        blocking (on)
        syncgun()
        lockgun(on)
        regcore (core1)
        dtcrobotevents(off)
        gosub (seesawinit)
    elseif ((dtcenergy==1) and (energy==2))
        blocking (on)
        syncgun()
        lockgun(on)
        regcore(core1)
        dtcrobotevents(off)
        gosub (seesawinit)
    endif
temp_left=100+energy
temp_right=30+energy
    if (moving==0)
        gosub (fire7)
    elseif ((scandist<temp_left) and (scandist>temp_right))
        gosub (fire1)
    elseif (scandist<temp_right)
        gosub (fire7)
    endif
}

crashed
{
lockgun(true)
dtcrobotevents (off)
getturns()
    if ((drilling==0) and (result>100))
        stop()
    endif
leftdegrees=(gunaim-bodyaim-cldbearing+900)%360-180
    if (leftdegrees<0)
        gunleft(leftdegrees*1.1)
    elseif (leftdegrees>0)
        gunleft (leftdegrees*1.1)
    endif
temp_left=leftdegrees
Gosub (Aiming)
Gosub (The_Driller)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Scan()
leftdegrees=(gunaim-bodyaim-cldbearing+900)%360-180
    if (leftdegrees<0)
        gunleft(30)
    elseif (leftdegrees>0)
        gunleft (30)
    endif
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
Gosub (Aiming)
blocking (on)
gunright (leftdegrees+temp_right)
blocking (off)
back (rundist)
scan()
dtcrobotevents (on)
drilling=0
}

OptimumFire
{
    if ((dtcenergy>1) or (scandist<50))
            if(dtcrobot)
                Opponent_Energy=dtcenergy
                Norm_Degrees=scandist
            else
                Opponent_Energy=cldenergy
                Norm_Degrees=0
            endif
        truncate(Norm_Degrees/180)
        truncate((Opponent_Energy+3)/4+result)
        temp_left=result
            if(Opponent_Energy<=0)
                temp_left=0
            elseif(Opponent_Energy<=5)
                temp_left=1
            endif
        min(temp_left,energy-1)
        min(result,7)
        temp_left=result
        truncate(Norm_Degrees/180)
            if((temp_left-result)*4-1<4+temp_left)
                temp_left=1
            endif
        temp_right=temp_left
        min(temp_right,temp_right)
    endif
}
The_Driller
{
temp_left=result*4+1
    if (((gunheat>24) and (energy>dtcenergy-temp_left)) or (drilling==1))
        abs(cldbearing)
            if (result<60)
                ahead (250)
                drilling=1
                print("The_Driller active")
            elseif (result>120)
                ahead (-250)
                drilling=1
                print("The_Driller active")
            endif
    elseif ((energy>cldenergy) and (gunheat>22))
        abs(cldbearing)
            if (result<60)
                ahead (250)
                drilling=1
                print("The_Driller activated")
            elseif (result>120)
                ahead (-250)
                drilling=1
                print("The_Driller activated")
            elseif(result>90)
                ahead(-10)
            else
                ahead(10)
            endif
    elseif ((gunheat>23) and (energy<cldenergy-29))
        abs(cldbearing)
        drilling=0
            if(result>90)
                ahead(150)
            else
                ahead(-150)
           endif
    endif
}

MEF
{
    if ((energy-(result+1))<(dtcenergy/4) and (dtcenergy>20))
        min(0,energy-result)
        print ("The Energizer activated")
    endif
}

MEF1
{
    if (energy>3)
            if ((energy-2)<(dtcenergy/4))
                min(0,0)
                print ("The Energizer activated")
            else
                min(1,energy-2)
                max(1,result)
            endif
    endif
}

MEF7
{
    if (energy>9)
            if ((energy-8)<(dtcenergy/5))
                min(0,0)
                print ("The Energizer Activated")
            else
                max (energy-8,energy-1)
            endif
    endif
}

Trashcan
{
return
}

Dodger
{
norm_degrees=radaraim-bodyaim
    if (norm_degrees<0)
        norm_degrees=norm_degrees+360
    endif
    if ((norm_degrees>=0) AND (norm_degrees<=90))
        ahead (scandist+10)
            if (rundist<0)
                rundist=-rundist
            endif
    elseif ((norm_degrees>=270) AND (norm_degrees<=360))
        ahead (scandist+10)
            if (rundist<0)
                rundist=-rundist
            endif
    elseif ((norm_degrees>=180) AND (norm_degrees<=270))
        back (scandist+10)
            if (rundist>0)
                rundist=-rundist
            endif
    elseif ((norm_degrees>=90) AND (norm_degrees<=180))
        back (scandist+10)
            if (rundist>0)
                rundist=-rundist
            endif
    endif
}

######################################################################
#                                                                    #
#                           LYCANTHROPE                              #
#                                                                    #
######################################################################
