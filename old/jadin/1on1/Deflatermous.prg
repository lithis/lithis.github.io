#######################################################
#    Proof that anybody can make a lock all seesaw    #
#######################################################

Init
{
	Name( "deflatermous" )
	setaccel(5)
	Blocking (off)
	LockAll (1)
	RegCore( seesaw )
	RegCldRobot( smack, 1 )
	RegDtcRobot( bang, 1 )
}

seesaw
{
	scan ()
	if(distrmn ==0)
	ahead (300)
	stop()
	bodyleft (180)
	continue()
	endif
}

Bang
{
	fire(7)
}

Smack
{
stop()
radarright(cldbearing)
waitfor(radarrmn==0)
scan()
if(dtcrobot)
	gosub(Blasto)
endif
continue()
}

Blasto
{
Fire(7)
scan()
if(dtcrobot)
	gosub(Blasto)
endif
}