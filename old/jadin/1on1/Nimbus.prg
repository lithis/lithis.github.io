
#==========================>
# Version history:
# 27/10 - 97
# Sei Froh v.01 coded, using MS 1.3, starring Trib 2.0b and VeloZyte ][
# 28/10 - 97
# v.20 coded, added Beauty, upgraded MS to 1.31 and added SF. Miraculous effects!
# 29/11 - 97
# v.30 coded, Cerise 2 added. Some nifty debugging print output added :)
# Name changed to Nimbus.
# v.40, Corny 2.0 added, now multibot support!
# v.50, FCentyr added.
# 2/9 - 98
# v0.55 upgrade, for the Olympics!
#==============================>

Init
{
	Name( "Nimbus v0.55" )

	If( Gamenbr == 1 )
		Print( "|================================================|" )
		Print( "-,-.-,.-.-.,.,-.,-.-,.-,.-,.-,.-,.N.I,M-B,U.S.,.-.,.-,.-,.--,.-.,.,-.-,.-,.,..," )
		Print( ".-.,.-,.-,.--.,.-,.-.-,,.-,''States of supremacy'',.-,.-.,..,,..,-.,-,.-,-.,-" )
		Print( "-.,-.,-.-,.,.,.,-.-,.-.,.,-.,-.-,.-,.-,,-.,-.,-.,-.-.,-.,-.,-.-,.-,.-.-,.-.,-.-,.-,.-" )
		Print( ".,-.,-.-,.,.for  RB 1.3x.--.-.,-.,-.,-.-,by Christian Soderstrom,-..-." )
		Print( "|================================================|" )
		Print( "Featuring:" )
		Print( " Trib 2.0b" )
		Print( " VeloZyte ][" )
		Print( " Beauty" )
		Print( " Cerise 2.0" )
		Print( " Fcentyr" )
		Print( "Using:" )
		Print( " Modeshell 1.3" )

		S_Forget = TRUE
		S_ff = 0.99
		S_Rndbounds = 32
		S_Keepwinningmode = TRUE

		pts = 0

		m1w = 4
		m1t = 6
		m2w = 4
		m2t = 6
		m3w = 4
		m3t = 6
		m4w = 4
		m4t = 6
		m5w = 4.5
		m5t = 6
	EndIf
	Gosub( S_Gen_Opts )
	Gosub( S_Opt )
	Gosub( S_Applymode )
}


S_Gen_Opts
{
	x = S_Rndbounds		// Just to make my life easier :)
	GetRandom( x )
	m1opt = ( m1w / m1t ) + ( result / 100 )
	GetRandom( x )
	m2opt = ( m2w / m2t ) + ( result / 100 )
	GetRandom( x )
	m3opt = ( m3w / m3t ) + ( result / 100 )
	GetRandom( x )
	m4opt = ( m4w / m4t ) + ( result / 100 )
	GetRandom( x )
	m5opt = ( m5w / m5t ) + ( result / 100 )
}

S_Opt
{
	If( m1+m2+m3+m4+m5 )

		// Keep the old winning mode
	Else
_0= m1opt
_1= m2opt
_2= m3opt
_3= m4opt
_4= m5opt 
Gosub( Max_ )

		If( result == m1opt )
			m1 = TRUE
		ElseIf( m2opt == result )
			m2 = TRUE
		ElseIf( m3opt == result )
			m3 = TRUE
		ElseIf( m4opt == result )
			m4 = TRUE
		ElseIf( m5opt == result )
			m5 = TRUE
		EndIf
	EndIf
}

S_Applymode
{
	GetOthers()
	If( result < 4 )

	If( m1 )
		m1t = m1t + 1
		Gosub( T2_Init )
	ElseIf( m2 )
		m2t = m2t + 1
		Gosub( V_Init )
	ElseIf( m3 )
		m3t = m3t + 1
		Gosub( B_Init )
	ElseIf( m4 )
		m4t = m4t + 1
		Gosub( C2_Init )
	ElseIf( m5 )
		m5t = m5t + 1
		Gosub( F_Init )
	EndIf

	ElseIf( result > 3 )
		Gosub( C6_Init )
	EndIf
}


Dead
{
	GetOthers()

	If( m1 )
		Print( "Trib 2.0b" )
	ElseIf( m2 )
		Print( "VeloZyte ][" )
	ElseIf( m3 )
		Print( "Beauty" )
	ElseIf( m4 )
		Print( "Cerise 2.0" )
	ElseIf( m5 )
		Print( "FCentyr" )
	EndIf

	If( result * S_Keepwinningmode )
		m1 = FALSE
		m2 = FALSE
		m3 = FALSE
		m4 = FALSE
		m5 = FALSE
	EndIf

	If( result == 0 )
	Print( "-----------win" )
	pts = pts + 2
	If( m2 )
		m2w = m2w + 1
	ElseIf( m1 )
		m1w = m1w + 1
	ElseIf( m3 )
		m3w = m3w + 1
	ElseIf( m4 )
		m4w = m4w + 1
	ElseIf( m5 )
		m5w = m5w + 1
	EndIf
	Else
		Print( "-----------loss" )
	EndIf
	If( S_Forget )
		m1t = m1t * S_ff
		m2t = m2t * S_ff
		m3t = m3t * S_ff
		m4t = m4t * S_ff
		m5t = m5t * S_ff

// This is untested by me, but you might not wanna do forgetting with values
// below 1, make a few If() statements.
		m1t = m1t + (m1t < 1)*(1-m1t)
		m2t = m2t + (m2t < 1)*(1-m2t)
		m3t = m3t + (m3t < 1)*(1-m3t)
		m4t = m4t + (m4t < 1)*(1-m4t)
		m5t = m5t + (m5t < 1)*(1-m5t)

	EndIf

	Store( m1t )
	Store( m2t )
	Store( m3t )
	Store( m4t )
	Store( m5t )
	Store( m1w )
	Store( m2w )
	Store( m3w )
	Store( m4w )
	Store( m5w )
	Store( m1 )
	Store( m2 )
	Store( m3 )
	Store( m4 )
	Store( m5 )
	Store( S_ff )
	Store( S_Rndbounds )
	Store( S_Keepwinningmode )
	Store( S_Forget )
	Store( pts )
	Gosub( PrintStatus )
}

---
{}

Max_
{
	Max( _0, _1 )
	Max( result, _2 )
	Max( result, _3 )
	Max( result, _4 )
	Max( result, _5 )
	Max( result, _6 )
	Max( result, _7 )
	Max( result, _8 )
	Max( result, _9 )

	_2 = 0
	_3 = 0
	_4 = 0
	_5 = 0
	_6 = 0
	_7 = 0
	_8 = 0
	_9 = 0
}


Slide
{
	If( _2 )
		GunRight( _2 )
	EndIf
	Ahead( _0 )
	Stop()
	BodyRight( _1 )
	Continue()
	_2 = 0
}

SSlide
{
	Abs( _1 )
	mod = _1 / result
	If( _2 )
		GunRight( _2 )
	EndIf

	Ahead( _0 )
	Stop()
	BodyLeft( mod * 5 )
	BodyRight( _1 + mod * 5 )
	Continue()
	_2 = 0
}

Mindegreesright
{
	out1=(_1-_0+900)%360-180
}

ToFire
{
	_dt=dtcenergy
	_sc=scandist
	_n=_0
	_tk=(_dt-1)/4+(_sc/180+.75)
	if(_dt<=0)
		_tk=0
	elseif(_dt<6)
		_tk=1
	endif
	if(_tk>energy-1)
		_tk=energy-1
	endif
	min(_n,_tk)
	_n=result
	_en1=_n*4-_sc/45
	if(_en1<5)
		_n=1
	endif
	out1=_n
}

## In: Max desired energy level to fire at.
## Out: Energy required to kill robot with data stored in dtcenergy
##      and scandist.
## Comments: Function written by David Finch <mef@wave.net>


CC_Main
{
	Blocking( OFF )

	CC_Blocking_Suf = _0
	CC_backup = _1
	CC_Bodybackup = _2

_0= Gunaim
_1= Bodyaim+cldbearing 
Gosub( Mindegreesright )

	Stop()

	Abs( out1 )
	If( result > CLD_GUESS )
		Moved = TRUE
		RadarRight( out1 )
_0= 1 
Gosub( CC_Loop )
	Else
		Moved = FALSE
		Scan()
		If( dtcrobot )
			Gosub( Fireloop )
		EndIf
	EndIf

	If( CC_Backup >= 0 && Moved )
_0= Gunaim
_1= CC_backup 
Gosub( Mindegreesright )
		RadarRight( out1 )
	EndIf
	If( CC_Bodybackup >= 0 )
_0= BodyAim
_1= CC_Bodybackup 
Gosub( Mindegreesright )
		BodyRight( out1 )
	EndIf
	If( gunrmn + bodyrmn )
		Waitfor( gunrmn + bodyrmn == 0 )
	EndIf

	Blocking( CC_Blocking_suf )
}


CC_Loop
{
	Scan()
	If( dtcrobot )
		Fire( energy - 1 )
		Gosub( Fireloop )
	EndIf

	If( _0 == 1 )
		If( gunrmn && dtcrobot == 0 )
			Gosub( CC_Loop )
		EndIf
	EndIf
} 

CC_Init
{
_0= Gunaim
_1= bodyaim+cldbearing 
Gosub( Mindegreesright )
	Abs( out1 )
	LockGun( ON )
	If( ( result > 120 ) || ( cldenergy-20 > energy ) )
		Gosub( Escape )
	Else
_0= 0
_1= 0 
Gosub( CC_Main )
		m = 1
		tempus = 0
	EndIf
}

goThere
{
	goto_bear = _0
	goto_dist = _1
_0= bodyaim
_1= bodyaim+goto_bear 
Gosub( Mindegreesright )
	t_1=out1
	vm = 1
	Abs( t_1 )
	If( result > 90 )
_0= bodyaim-180
_1= bodyaim+goto_bear 
Gosub( Mindegreesright )
		t_1=out1
		vm = -1
	EndIf
	BodyRight( t_1 )
	Waitfor( bodyrmn == 0 )
	Ahead( goto_dist * vm )
	Waitfor( moving == 0 )
}

Fireloop
{
	If( Gunheat )
		Scan()
		If( Dtcrobot && energy > 1 )
			Gosub( Fireloop )
		EndIf
	ElseIf( energy > 1 )
		ToKill = ( DtcEnergy / 3 ) + 1
		Min( energy - 1, ToKill )
		Fire( result )
		Gosub( Fireloop )
	EndIf
}

InitWin
{
	Fire( energy - 1 )
	Ahead( scandist )
	Scan()
	If( dtcrobot )
		Gosub( InitWin )
	EndIf
}

Wait
{
	Scan()
	If( dtcrobot && _1 == 1 )
		temp_0 = _0
_0=7
Gosub( ToFire )
		Fire( out1 )
		_0 = temp_0
	EndIf
	If( dtcrobot && _1 == 2 )
		temp_0 = _0
_0= 7 
Gosub( ToFire )
		Fire( out1 )
		_0 = temp_0
	EndIf
	
	If( _0 == 1 )
		If( moving )
			Gosub( Wait )
		EndIf
	ElseIf( _0 == 2 )
		If( moving + bodyrmn )
			Gosub( Wait )
		EndIf
	ElseIf( _0 == 3 )
		If( moving + bodyrmn + gunrmn )
			Gosub( Wait )
		EndIf
	ElseIf( _0 == 4 )
		If( distrmn > 10 || (bodyrmn+gunrmn ) )
			Gosub( Wait )
		EndIf
	EndIf
}

Escape
{
	If( cldbearing > 90 || cldbearing < -90 )
_0= 400
_1= 90 
Gosub( Slide )
	Else
_0= 400
_1= -90 
Gosub( Slide )
	EndIf
	RadarRight( out1 )
}

LockState
{
	LockAll( ON )
	If( _0 == 0 )
		LockAll( OFF )
		LockGun( OFF )
	ElseIf( _0 == 1 )
		LockAll( OFF )
		LockGun( ON )
	EndIf
}

--+
{}


T2_Dead
{
	GetOthers()
	
	T2_points = T2_points - (result*b) + ((result==0)*b) * (cum<5)
	cum = (cum+1 * (cum<5)) * result
	
	//( T2_points )
	//( cum )
	
	Store( cum )
	Store( T2_points )
}

T2_Init
{
	## Optimization variables
	CLD_GUESS = 20
	CLD_BOUNDS = 10
	DTC_STOP_LIM = 100
	
	If( gamenbr == 1 )
		cum = 0
		T2_points = 0
	EndIf
	
	b = (t2_points>0)-(t2_points<1)
	
	m = 1
	Blocking( OFF )
	LockGun( ON )
	Scan()
	If( dtcrobot )
		Gosub( Initwin )
	EndIf
	SetAccel( 5 )
_0= -400
_1= -45*b
_2= -90*b 
Gosub( Slide )
	RegCldRobot( T2_Collide, 5 )
_0= 3
_1= 1 
Gosub( Wait )
	Scan()
	If( dtcrobot )
		Stop()
		Gosub( Fireloop )
	EndIf
	RegCore( T2_Core )
}

T2_Core
{
	Scan()
	If( distrmn < 10  AND ( bodyrmn + gunrmn == 0 ) AND accel > 1 )

		If( ((Bodyaim+45)%90+Gunaim%45) )

			BodyRight( 90 - ( (BodyAim+45)%90 ) )
			RadarLeft( (GunAim%90) )
			WaitFor( gunrmn+bodyrmn == 0 )
		EndIf

_0= 400*m
_1= -90*b
_2= 0 
Gosub( Slide )
		m = -m

		If( scandist < 10 )
			GunLeft( -90*b )
			WaitFor( gunrmn == 0 )
		ElseIf( scandist > 350 )
			GunRight( -90*b )
			WaitFor( gunrmn == 0 )
		EndIf
		
	EndIf
	If( dtcrobot )
_0= 7 
Gosub( ToFire )
		Fire( out1 )
		SetAccel( 1 )
		If( distrmn < DTC_STOP_LIM && Gunrmn == 0 )
			Stop()
		EndIf
		Gosub( fireloop )
		SetAccel( 5 )
	EndIf
	If( distrmn < 120 && gunrmn == 0 && distrmn > 50 )
		GunRight( 90*b )
	EndIf
}

T2_Collide
{
	body = Bodyaim + (bodyrmn * b)
_0= 0
_1= GunAim + radarrmn
_2= body 
Gosub( CC_Main )
	SetAccel( 5 )
}

T2_Fireloop
{
	SetAccel( 1 )
	Fireloop_FLAG = TRUE
	If( gunheat OR energy == 1 )
		Scan()
		If( dtcrobot AND energy > 1 )
			Gosub( Fireloop )
		EndIf
	Else
_0= 7 
Gosub( ToFire )
		Fire( out1 )
		Gosub( Fireloop )
	EndIf
	Fireloop_FLAG = FALSE
	SetAccel( 5 )
}

-+-
{}


V_Init
{
	SetAccel( 5 )
	
	RegCldRobot( V_cld, 5 )
	ovr = 1
	e = -1
	_lasthits = 0
	_lastscandist = 0
	_firedlasttime = 0
	
	Blocking( OFF )
	If( Gun_align == 1 )
		LockAll( ON )
	EndIf
	If( Gun_align == 2 )
		LockGun( ON )
		GunRight( 90 )
	EndIf
	
_0= 400
_1= -90 
Gosub( Slide )
	LockAll( OFF )
	LockGun( ON )
	WaitFor( Bodyrmn + Moving + gunrmn == 0 )
	Scan()
	If( Scandist < 200 )
		Back( 400 )
	EndIf
	WaitFor( distRmn < 200 )
	BodyLeft( 5 )
	RegCore( V_Core )
}

V_Core
{
	Scan()
	
	If( Dtcrobot )
		If( ( GunRmn && Gun_align == 1 ) || ( Gun_align == 1 && scandist > 300 && distrmn > 80 ) )
		Else
			Gosub( V_Gefunnen )
		EndIf
	EndIf
	
	If( distrmn < 80 && gunrmn == 0 && cldrobot == FALSE )
		If( Gun_align == 0 )
			//( distrmn )
			If( ovr )
				GunLeft( 90 )
			EndIf
		EndIf
	EndIf
	
	If( distrmn < 360 && distrmn > 300 && Gun_align == 2 && gunrmn == 0 )
		GunLeft( 90 )
	EndIf
	
	If( distrmn < 9 AND bodyrmn == 0 AND ( dtcrobot == FALSE || Gun_align == 2 ) )
		e = -e
		If( flagged == FALSE )
			_firedlasttime = FALSE
			timesnotfound = timesnotfound + 1
			cum_timesnotfound = cum_timesnotfound + 1
		EndIf
		flagged = FALSE
		ovr = 1
		If( timesnotfound == 6 )
_0= Gun_align 
Gosub( V_ChangeGUN )
		EndIf
		
		If( Gun_align == 0 )
_0= 400 * e
_1= 90 
Gosub( Slide )
		ElseIf( Gun_align == 1 )
_0= 400 * e
_1= 90 
Gosub( Slide )
			If( ovr )
				GunLeft( 90 )
			EndIf
		ElseIf( Gun_align == 2 )
_0= 400 * e
_1= 90 
Gosub( Slide )
		EndIf
	Endif
}

V_Check
{
	CheckA = BodyAim + 5
	Round( CheckA / 90, 0 )
	If( result != CheckA / 90 )
		Blocking( ON )
		BodyLeft( CheckA - result * 90 )
		Blocking( OFF )
	EndIf
}

V_Gefunnen
{
	Flagged = TRUE
	timesnotfound = 0
	cum_timesnotfound = 0
	lim = 7
	
	GetTurns()
	If( result > limit )
		
		// Set fire limits for dif' modes
		If( Gun_align == 1 || Gun_align == 0 )
			
			// If fired last time at approx this scandist and missed
			
			If( gunheat == 0 )
			EndIf
			
			If( _firedlasttime && GunHeat == 0 )
				GetHitsOther()
				If( result == _lasthits )	// Did I miss?
					Abs( _lastscandist - scandist )
					If( result < 15 )
						lim = 0
						GetTurns()
						limit = result + 10
					EndIf
				EndIf
			EndIf
			
			If( gunheat == 0 )
				_firedlasttime = TRUE
				_lastscandist = scandist
				GetHitsOther()
				_lasthits = result
			EndIf
			
		ElseIf( Gun_align == 0 )
			lim = 7
		EndIf
		
_0= lim 
Gosub( ToFire )
		Fire( out1 )
	EndIf
}

V_Cld
{
	//( "This is highly irregular..." )
_0= gunaim
_1= bodyaim+cldbearing 
Gosub( Mindegreesright )
	If( out1 )
		RadarRight( out1 )
		WaitFor( radarrmn == 0 )
	EndIf
	
	Scan()
	If( dtcrobot )
		Gosub( fireloop )
	Endif
	
	If( out1 )
		RadarLeft( out1 )
		WaitFor( radarrmn == 0 )
	EndIf
}

V_ChangeGUN
{
	If( _0 == 0 )
		Gun_align = 1
		GunLeft( 100 )
	ElseIf( _0 == 1 )
		If( cum_timesnotfound > 12 )
			Gosub( V_ChangeACC )
		EndIf
		Gun_align = 2
		GunRight( -90 )
	ElseIf( _0 == 2 )
		Gun_align = 0
	EndIf
	timesnotfound = 0
	ovr = 0
}

V_ChangeACC
{
	SetAccel( accel - .1 )
	If( accel < 2 )
		SetAccel( 5 )
	EndIf
}

V_Dead
{
}

+--
{}


B_Init
{
	CLD_GUESS = 20
	TEMPUS_LIM = 40
	STOP_SET = 50
	RAM_DLIM = 400
	RAM_ELIM = 1.0
	RAM_DO = TRUE
	MOVE_TURN = -20
	
	SetAccel( 5 )
	Blocking( OFF )
	RegCore( B_Core )
	RegCldRobot( CC_Init, 5 )
	m = 1
	mv = 1
	tempus = 0
	tempus2 = 0
	ramming = 0
	STOP_temp = STOP_SET
}

B_Core
{
_0= tempus 
Gosub( B_restoreRadar )
	Scan()
_0= dtcrobot 
Gosub( B_fire )
_0= scandist
_1= dtcenergy 
Gosub( B_ram )
_0= scandist + dtcrobot*1000
_1= tempus2 
Gosub( B_radarBounce )
_0= 10 * -m 
Gosub( B_setGunAlign )
_0= radarrmn 
Gosub( B_radarMove )
_0= distrmn 
Gosub( B_move )
_0= dtccookie 
Gosub( B_getCookie )
}

B_getCookie
{
	If( _0 )
		step = -10*m
_0= dtcbearing+step
_1= scandist + 20 
Gosub( goThere )
		STOP_temp = 1
	EndIf
}

B_restoreRadar
{
	GetTurns()
	If( result - tempus > TEMPUS_LIM )
		m = 1
		tempus = 2^15
	EndIf
}

B_setGunAlign
{
	g_ideal = RadarAim + _0
	If( (g_ideal-GunAim)%360 )
		//( "B_setGunAlign" )
		RadarRight( 0 )
		LockGun( OFF )
_0= gunaim
_1= g_ideal 
Gosub( Mindegreesright )
		GunRight( out1 )
		LockGun( ON )
	EndIf
}

B_radarBounce
{
	If( _0 < 80 )
		GetTurns()
		If( result - tempus2 > 30 )
			//( "B_radarBounce" )
			m = -m
			RadarRight( 0 )
			tempus2 = result
		EndIf
	EndIf
}

B_radarMove
{
	If( _0 == 0 )
		//( "B_radarMove" )
		RadarRight( 9999 * m )
	EndIf
}

B_fire
{
	If( _0 )
		GetTurns()
		tempus = result + TEMPUS_LIM
		m = 0
		//( "B_fire" )
_0= 7 
Gosub( ToFire )
		Fire( out1 )
	EndIf
}

B_move
{
	If( _0 < STOP_temp )
_0= 400 * mv
_1= MOVE_TURN 
Gosub( Slide )
		mv = -mv
		STOP_temp = STOP_SET
		ramming = 0
		If( distrmn < STOP_SET )
			STOP_temp = 1
		EndIf
	EndIf
}

B_ram
{
	If( _0 < RAM_DLIM && _1/energy < RAM_ELIM && dtcrobot && ramming == 0 && RAM_DO )
		m = 0
		GetTurns()
		tempus = result
		ramming = 1
		STOP_temp = 1
_0= dtcbearing
_1= scandist + 50 
Gosub( goThere )
	EndIf
}    

-++
{}

C2_Init
{
	m = 1
	t = 1
	CLD_GUESS = 20

	
	Blocking( OFF )
	LockGun( ON )
	SetAccel( 5 )

	RegCldRobot( C2_CCInit, 10 )

	RegCore( C2_Cerise )
_0= -400
_1= 90
_2= -90 
Gosub( SSlide )
_0= 2 
Gosub( C2_Wait )
_0= -400
_1= -45
_2= 0 
Gosub( SSlide )
_0= 2 
Gosub( C2_Wait )
}

C2_Cerise
{
_0= gunaim
_1= bodyaim 
Gosub( Mindegreesright )
_0= 800
_1= -135*m
_2= out1 
Gosub( SSlide )
	ondiagonal = TRUE
_0= 2 
Gosub( C2_Wait )
	t = t+1

_0= gunaim
_1= bodyaim 
Gosub( Mindegreesright )
_0= 500
_1= -135*m
_2= out1 
Gosub( SSlide )
	ondiagonal = FALSE
_0= 2 
Gosub( C2_Wait )
	t = t+1
}

C2_Wait
{
	Scan()
	If( dtcrobot )
_0= 7 
Gosub( ToFire )
		Fire( out1 )
	EndIf

	If( distrmn > 10 || bodyrmn )
		Gosub( Wait )
	EndIf
}

C2_CCInit
{
_0= 0
_1= -1
_2= -1 
Gosub( CC_Main )
} 

+-+
{}

C6_Init
{
	RegCldRobot( CC_Init, 9 )
_0= 1 
Gosub( LockState )
	Blocking( OFF )
	dir = 1
	notfirst = FALSE
	CLD_GUESS = 15

_0= -400
_1= 90
_2= 90 
Gosub( Slide )
_0= 3
_1= 1 
Gosub( C6_Wait )
_0= 0 
Gosub( LockState )
	Back( 400 )
	GunRight( 10 )
_0= 3
_1= 1 
Gosub( C6_Wait )

	RegCore( C6_Core )
}

C6_Core
{
_0= 0 
Gosub( LockState )
	If( notfirst )
		target= radaraim+(10*dir)
_0= gunaim
_1= target 
Gosub( Mindegreesright )
		GunRight( out1 )
		Scan()
		If( dtcrobot )
		EndIf
		WaitFor( gunrmn == 0 )
	EndIf
	dir = -dir
_0= 1 
Gosub( LockState )
	GunRight( 90*dir )
_0= 3
_1= 1 
Gosub( C6_Wait )
	notfirst = TRUE
}

C6_Wait
{
	GetOthers()
	If( result < 3 )
		Gosub( B_Init )
	EndIf
	Scan()
	If( dtcrobot )
		If( _1 == 1 )
			B = _0
			Gosub( C6_GoFire )
			_0 = B
		EndIf
	EndIf
	If( _0 == 1 )
		If( moving )
			Gosub( C6_Wait )
		EndIf
	ElseIf( _0 == 2 )
		If( moving + bodyrmn )
			Gosub( C6_Wait )
		EndIf
	ElseIf( _0 == 3 )
		If( moving + bodyrmn + gunrmn )
			Gosub( C6_Wait )
		EndIf
	EndIf
}

C6_GoFire
{
	out1 = 0
	If( scandist < 200 )
_0= 1 
Gosub( ToFire )
	EndIf
	If( scandist < 100 )
_0= 3 
Gosub( ToFire )
	EndIf
	If( scandist < 50 )
_0= 7 
Gosub( ToFire )
	EndIf
	Fire( out1 )
} 
++-
{}

F_Init
{
	Blocking( OFF )
	RegCldRobot( CC_Init, 10 )
	way = 1
	m = -1

	SetAccel( 5 )

_0= 2 
Gosub( LockState )
_0= 400 * way
_1= 90*way
_2= 0 
Gosub( SSlide )
_0= 1 
Gosub( LockState )
_0= 9 
Gosub( F_Wait )
	Scan()
	If( dtcrobot )
		Gosub( Fireloop )
	EndIf
	GunRight( 90 )
_0= 3 
Gosub( Wait )

	RegCore( F_Core )
}

F_Core
{
	Scan()
	If( dtcrobot )
		Gosub( F_Fire )
	EndIf
	If( dtccookie )
		Print( "FCentyr Cookie" )
		BodyRight( 90 )
		WaitFor( bodyrmn == 0 )
		Print( scandist+20 )
_0= scandist+20
_1= 90 
Gosub( Slide )
_0= 2
_1= 1 
Gosub( Wait )
_0= -400
_1= -90 
Gosub( Slide )
		WaitFor( distrmn < 20 )
_0= 1 
Gosub( LockState )
	EndIf
	If( distrmn < 9 )
		If( bodyaim%90 )
			BodyLeft( bodyaim%90 )
			WaitFor( bodyrmn==0 )
		EndIf
		If( Gunaim%90 )
			GunLeft( Gunaim%90 )
			WaitFor( gunrmn==0 )
		EndIf
		If( (Gunaim-Bodyaim)%180 == 0 )
			GunLeft( -90 )
			WaitFor( gunrmn == 0 )
		EndIf
		m = -m
		Ahead( m * 400 )
	EndIf
}

F_Fire
{
	If( dtcenergy == 1 || ( dtcenergy < 10 && energy > 40 ) || ( dtcenergy < 29 && energy > 90 ) )
		Print( "FCentyr has done its  job, over to Beauty!" )
		Gosub( B_Init )
	EndIf
	floped= 0
	If( distrmn < 32 || distrmn > 350 )
		Stop()
		Gosub( F_Fireloop )
		floped = 1
	EndIf
	If( floped == 0 && scandist < 200 )
_0= 7 
Gosub( ToFire )
	Fire( out1 )
	EndIf
}

F_Fireloop
{
	If( scandist < 200 )
		Print( "Go fire ")
		Print( scandist )
_0= 7 
Gosub( ToFire )
		Fire( out1 )
	EndIf

	oldE = dtcenergy
	oldD = scandist
	Scan()
	If( scandist < oldD && dtcrobot )		// Robot is a-heading this way
_0= 5 
Gosub( ToFire )
		Fire( out1 )
		Gosub( F_Wallswitch )
	Else
		Gosub( F_Doddle )
	EndIf
}

F_Doddle
{
	Back( 500 * m )
	If( distrmn < 100 )
		Ahead( 500 * m )
	EndIf
	WaitFor( distrmn < 320 )
	Stop()
	Ahead( 500 * m )
	If( distrmn > 200 )
		Back( 500 * m )
	EndIf
	WaitFor( distrmn < 9 )
	Scan()
	If( dtcrobot )
	Gosub( F_Fireloop )
	EndIf
}

F_Wallswitch
{
	If( distrmn > 200 )
_0= 3 
Gosub( LockState )
_0= 400*m
_1= 90*m 
Gosub( SSlide )
	If( distrmn < 100 )
		Stop()
_0= -400*m
_1= -90*m 
Gosub( SSlide )
	EndIf
_0= 4 
Gosub( Wait )
_0= 1 
Gosub( LockState )
	Else
_0= 3 
Gosub( LockState )
_0= -400*m
_1= -90*m 
Gosub( SSlide )
	If( distrmn < 100 )
		Stop()
_0= 400*m
_1= 90*m 
Gosub( SSlide )
	EndIf
_0= 4 
Gosub( Wait )
_0= 1 
Gosub( LockState )
	EndIf
}

F_Wait
{
	Scan()
	If( dtcrobot )
		Fire( energy - 1 )
	EndIf
	If( distrmn > _0 )
		Gosub( F_Wait )
	EndIf
	b_temp = bodyrmn
	Stop()
	If( b_temp )
		BodyRight( b_temp )
		GunRight( b_temp )
_0= 3 
Gosub( Wait )
	EndIf
}

+++
{}

PrintStatus
{
	opp = (gamenbr*2)-pts
	If( opp > pts )
		Print( "The opponent is in the lead:" )
	ElseIf( pts > opp )
		Print( "Nimbus is in the lead:" )
	Else
		Print( "The game is a tie:" )
	EndIf
	Print( pts )
	Print( opp )
} 
