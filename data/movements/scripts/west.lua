function onStepIn(cid, item, pos, fromPos)

if isPlayer(cid) then

		centerpos = getPlayerPosition(cid)

wall1pos = {x=centerpos.x, y=centerpos.y-1, z=centerpos.z, stackpos=1}
wall2pos = {x=centerpos.x+1, y=centerpos.y-1, z=centerpos.z, stackpos=1}
wall3pos = {x=centerpos.x+2, y=centerpos.y-1, z=centerpos.z, stackpos=1}
wall4pos = {x=centerpos.x, y=centerpos.y, z=centerpos.z, stackpos=1}
wall5pos = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z, stackpos=1}
wall6pos = {x=centerpos.x+2, y=centerpos.y, z=centerpos.z, stackpos=1}
wall7pos = {x=centerpos.x, y=centerpos.y+1, z=centerpos.z, stackpos=1}
wall8pos = {x=centerpos.x+1, y=centerpos.y+1, z=centerpos.z, stackpos=1}
wall9pos = {x=centerpos.x+2, y=centerpos.y+1, z=centerpos.z, stackpos=1}
wall31pos = {x=412, y=218, z=7, stackpos=1}
wall42pos = {x=411, y=218, z=7, stackpos=1}
wall33pos = {x=410, y=218, z=7, stackpos=1}



wall1 = getThingfromPos(wall1pos)
wall2 = getThingfromPos(wall2pos)
wall3 = getThingfromPos(wall3pos)
wall4 = getThingfromPos(wall4pos)
wall5 = getThingfromPos(wall5pos)
wall6 = getThingfromPos(wall6pos)
wall7 = getThingfromPos(wall7pos)
wall8 = getThingfromPos(wall8pos)
wall9 = getThingfromPos(wall9pos)


		tilepos1 = {x=centerpos.x-1, y=centerpos.y-1, z=centerpos.z, stackpos=1}
		tilepos2 = {x=centerpos.x, y=centerpos.y-1, z=centerpos.z, stackpos=1}
		tilepos3 = {x=centerpos.x+1, y=centerpos.y-1, z=centerpos.z, stackpos=1}
		tilepos4 = {x=centerpos.x-1, y=centerpos.y, z=centerpos.z, stackpos=1}
		tilepos5 = {x=centerpos.x, y=centerpos.y, z=centerpos.z, stackpos=1}
		tilepos6 = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z, stackpos=1}
		tilepos7 = {x=centerpos.x-1, y=centerpos.y+1, z=centerpos.z, stackpos=1}
		tilepos8 = {x=centerpos.x, y=centerpos.y+1, z=centerpos.z, stackpos=1}
		tilepos9 = {x=centerpos.x+1, y=centerpos.y+1, z=centerpos.z, stackpos=1}




		playerpos4 = {x=centerpos.x, y=centerpos.y-1, z=centerpos.z, stackpos=253}
		playerpos6 = {x=centerpos.x, y=centerpos.y+1, z=centerpos.z, stackpos=253}
		playerpos7 = {x=centerpos.x+2, y=centerpos.y-1, z=centerpos.z, stackpos=253}
		playerpos9 = {x=centerpos.x+2, y=centerpos.y+1, z=centerpos.z, stackpos=253}


		getplayer4 = getThingfromPos(playerpos4)
		getplayer6 = getThingfromPos(playerpos6)
		getplayer7 = getThingfromPos(playerpos7)
		getplayer9 = getThingfromPos(playerpos9)





		frent = {x=centerpos.x, y=centerpos.y-1, z=centerpos.z, stackpos=1}
		status = getPlayerStorageValue(cid,1234)
		centerpos = getPlayerPosition(cid)

if status == 1 then
doPlayerSendCancel(cid,"east.") 
if status == 1 then


doRemoveItem(wall1.uid,1)
doRemoveItem(wall2.uid,1)
doRemoveItem(wall3.uid,1)
doRemoveItem(wall4.uid,1)
doRemoveItem(wall5.uid,1)
doRemoveItem(wall6.uid,1)
doRemoveItem(wall7.uid,1)
doRemoveItem(wall8.uid,1)
doRemoveItem(wall9.uid,1)

				doSendMagicEffect(tilepos1,12)
				doSendMagicEffect(tilepos2,12)
				doSendMagicEffect(tilepos3,12)
				doSendMagicEffect(tilepos4,12)
				doSendMagicEffect(tilepos5,12)
				doSendMagicEffect(tilepos6,12)
				doSendMagicEffect(tilepos7,12)
				doSendMagicEffect(tilepos8,12)
				doSendMagicEffect(tilepos9,12)

	doCreateItem(1794, 1, tilepos1)
	doCreateItem(1795, 1, tilepos2)
	doCreateItem(1796, 1, tilepos3)
	doCreateItem(1797, 1, tilepos4)
	doCreateItem(1798, 1, tilepos5)
	doCreateItem(1799, 1, tilepos6)
	doCreateItem(1800, 1, tilepos7)
	doCreateItem(1801, 1, tilepos8)
	doCreateItem(1802, 1, tilepos9)


		doTeleportThing(getplayer4.uid,tilepos1)
		doTeleportThing(getplayer6.uid,tilepos7)
		doTeleportThing(getplayer7.uid,tilepos3)
		doTeleportThing(getplayer9.uid,tilepos9)

end
end
return 1
end
end