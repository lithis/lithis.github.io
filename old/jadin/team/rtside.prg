Init
{
        name("TeamSide")
        SetAccel(2)
        RegCore(Core)
        RegDtcRobot(TrvFoundRobot,1)
        RegDtcCookie(FoundCookie,3)
        RegDtcMine(FoundMine,4)
        RegAScan(AutoScan,5)
        LockAll(1)
        back(400)
        Bodyright(90)
        LockAll(0)
        LockGun(1)
        RegCldRobot(Damage,2)
        RegDtcRobot(SideFoundRobot,1)
}

Core
{
        Gosub(ScanPath)
        GunLeft(95)
        MovingUp=TRUE
        Ahead(movedist)
        GunLeft(85)
        Gosub(ScanPath)
        GunRight(85)
        MovingUp=FALSE
        Back(movedist)
        GunRight(95)
}

ScanPath
{
        DtcCookieEvents(0)
        DtcMineEvents(1)
        Scan()
        if(dtccookie)
                movedist=scandist+5
	else
                movedist=scandist
	endif
        DtcMineEvents(0)
        DtcCookieEvents(1)
}

AutoScan
{
	Scan()
}

Damage
{	
        Stop()
        movedist=(400-33)-distrmn
}

SideFoundRobot
{
        Gosub(fire)
}

TrvFoundRobot
{
        stop()
        Gosub(Fire)
        Scan()
        if(dtcrobot==0)
                Blocking(0)
                Continue()
                Blocking(1)
	endif
}
Fire
{
        if(scandist>200||energy<10)
                fire(1)
        elseif(scandist>100)
                fire(3)
        elseif(scandist>50)
                fire(5)
        else()
                fire(7)
	endif
        scan()
}

FoundMine
{
        fire(1)
}

FoundCookie
{
        Stop()
        Back(movingup*4)
        fire(1)
        Ahead(movingup*4)
        Blocking(0)
        Continue()
        Blocking(1)
}
