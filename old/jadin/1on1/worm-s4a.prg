// worm s41
// by lithis

Init
{
	name("worm s4a")
	
	if (gameNbr == 1)
		print("worm s4a")
		print("by lithis")
		
		PickWall = 0
		HitDist = 115
		TurningPoint = 50
		
		Debug = 0
		DebugTraceHandlers = 0
	endIf
	
	BodyDir = 1
	RadarArcMinSize = 30
	RadarArcSizeInc = 5
	RadarArcSize = RadarArcMinSize
	RadarDir = 1
	TimesFired = 0
	
	blocking(off)
	
	lockAll(on)
	bodyRight(PickWall)
	waitFor(bodyRmn == 0)
	ahead(400)
	ahead(distRmn - 3)
	waitFor(distRmn == 0)
	bodyRight(90)
	lockAll(off)
	lockGun(on)
	waitFor(bodyRmn == 0)
	
	regCore(CoreS)
	regAScan(AScanS, 4)
	regDtcRobot(DtcRobotS, 2)
	regCldRobot(CldRobotS, 1)
	regCldMissile(CldMissileS, 3)
	regCustom(DtcMineOnWallS, 2, dtcMine && (dtcBearing == 0 || dtcBearing == -180))
	//regCustom(DtcCookieInArenaS, 2, dtcCookie && (dtcBearing != 0 && dtcBearing != -180))
}

CoreS
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: CoreS")
	endIf
	
	if (distRmn == 0)
		ahead(400 * BodyDir)
		BodyDir = -BodyDir
	endIf
}

AScanS
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: AScanS")
	endIf
	
	scan()
	
	if (radarRmn == 0)
		scan()
		if (RadarDir == 1)
			min(RadarArcSize, (bodyAim + 180 - radarAim + 360) % 360)
		else
			min(RadarArcSize, (radarAim - bodyAim + 360) % 360)
		endif
		RadarRight(result * RadarDir)
		scan()
		RadarDir = -RadarDir
		RadarArcSize = RadarArcSize + RadarArcSizeInc
	endIf
}

DtcRobotS
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: DtcRobotS")
	endIf
	
	RadarArcSize = RadarArcMinSize
	
	if (gunHeat == 0 && scanDist <= 5 * HitDist && energy > 1)
		stop()
		aScanEvents(off)
		if (dtcBearing != 0 && dtcBearing != -180)
			ahead(-5 * BodyDir)
		//	radarRight(10 * RadarDir)
			Bearing = dtcBearing
			BearingFrom = bodyAim
			gosub(BearingToHeading)
			DestAngle = Heading
			gosub(MinDegreesRight)
			gunRight(RightDegrees)
		endIf
		waitFor(distRmn == 0 && gunRmn == 0)
		if (scanDist > 2 * HitDist || energy < 10)
			fire(1)
		elseIf (scanDist > 1.5 * HitDist)
			fire(2)
		elseIf (scanDist > HitDist)
			fire(3)
		elseIf (scanDist > .75 * HitDist)
			fire(4)
		elseIf (scanDist > .5 * HitDist)
			fire(5)
		elseIf (scanDist > .25 * HitDist)
			fire(6)
		else()
			fire(7)
		endIf
		TimesFired = TimesFired + 1
		aScanEvents(on)
		continue()
	endIf
}

CldRobotS
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: CldRobotS")
	endIf
	
	aScanEvents(off)
	cldRobotEvents(off)
	//regCldRobot(CldRobotC, 1)
	
	stop()
	ahead(-50 * BodyDir)
	
	Bearing = cldBearing
	BearingFrom = bodyAim
	gosub(BearingToHeading)
	DestAngle = Heading
	gosub(MinDegreesRight)
	gunRight(RightDegrees + 10)
	waitFor(gunRmn == 0)
	fire(7)
	
	cldRobotEvents(on)
	aScanEvents(on)
}

CldRobotC
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: CldRobotC")
	endIf
	
	stop()
	
	Bearing = cldBearing
	BearingFrom = bodyAim
	gosub(BearingToHeading)
	DestAngle = Heading
	gosub(MinDegreesRight)
	gunRight(RightDegrees + 10 * RadarDir)
	waitFor(gunRmn == 0)
	fire(7)
	
	continue()
	
	regCldRobot(CldRobotS, 1)
}

CldMissileS
{
	Bearing = cldBearing
	BearingFrom = bodyAim
	gosub(BearingToHeading)
	DestAngle = Heading
	gosub(MinDegreesRight)
	gunRight(RightDegrees + 10 * RadarDir)
	waitFor(gunRmn == 0)
}

DtcMineOnWallS
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: DtcMineOnWallS")
	endIf
	
	if (gunHeat == 0)
		stop()
		fire(1)
		scan()
		continue()
	endIf
}

DtcCookieInArenaS
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: DtcCookieInArenaS")
	endIf
	
	if (gunHeat == 0)
		stop()
		ahead(-4 * BodyDir)
		radarRight(10 * RadarDir)
		fire(1)
		scan()
		continue()
	endIf
}

Dead
{
	if (DebugTraceHandlers > 0)
		print("DebugTraceHandlers: Dead")
	endIf
	
	if (energy < TurningPoint)
		PickWall = PickWall + 90
		if (PickWall > 180 )
			PickWall = PickWall - 360
		endIf
	endIf
	
	TurningPoint = (TurningPoint * 3 + energy) / 3
	
	getHitsOther()
	if (TimesFired > 0)
		HitDist = (HitDist + HitDist + (HitDist * (result / TimesFired + .25))) / 3
	endIf
	
	store(PickWall)
	store(TurningPoint)
	min(HitDist, 2263)
	max(result, 33)
	HitDist = result
	store(HitDist)
	
	store(Debug)
	store(DebugTraceHandlers)
}

# Very usefull subroutine. Changes a bearing value into an absolute
# heading. Before called, this section expects 'bearing' to be filled
# with the number that requires conversion. When complete, 'heading' 
# will contain the converted value.

BearingToHeading
{
	heading = bearingfrom + bearing

	if( heading < 0 )
		heading = heading + 360
	elseif( heading > 359 )
		heading = heading - 360
	endif
}


# Very usefull subroutine. Determines the minimum number of degrees 
# needed to reach 'destAngle'. Before called, this section expects
# 'destAngle' to be filled with the desired angle. When complete, 
# 'rightDegrees' will contain the smallest number of degrees needed
# to reach destAngle turning RIGHT. If 'destAngle' can be reached 
# fastest by turning LEFT, 'rightDegrees' will be negative!

MinDegreesRight
{
	# Do a little error checking

	if( destAngle > 359 OR destAngle < 0 )
		Print( "MinDegreesRight: bad destAngle of" )
		Print( destAngle )
		rightDegrees = 0
		return
	endif


	# MinDegreesRight works with GUNAIM. This could be made 
	# another user variable to make MinDegreesRight more versitile.

	temp_right = destAngle - gunaim
	
	if( temp_right < 0 )
		temp_right = temp_right + 360
	endif
	
	temp_left = -temp_right + 360
	
	if( temp_right <= temp_left )
		rightDegrees = temp_right
	else
		rightDegrees = -temp_left
	endif
}