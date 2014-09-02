function onUse(cid, item, frompos, item2, topos)
	wall1 = {x=1472, y=1593, z=11, stackpos=1}
	getwall1 = getThingfromPos(wall1)
	wall2 = {x=1472, y=1594, z=11, stackpos=1}
	getwall2 = getThingfromPos(wall2)
	wall3 = {x=1472, y=1595, z=11, stackpos=1}
	getwall3 = getThingfromPos(wall3)
	wall4 = {x=1472, y=1596, z=11, stackpos=1}
	getwall4 = getThingfromPos(wall4)
	wall5 = {x=1472, y=1597, z=11, stackpos=1}
	getwall5 = getThingfromPos(wall5)


	if item.uid == 5052 and item.itemid == 1945 then
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doRemoveItem(getwall3.uid,1)
		doRemoveItem(getwall4.uid,1)
		doRemoveItem(getwall5.uid,1)
		doTransformItem(item.uid,item.itemid+1)
	
	elseif item.uid == 5052 and item.itemid == 1946 then
		doCreateItem(1198,1,wall1)
		doCreateItem(1198,1,wall2)
		doCreateItem(1198,1,wall3)
		doCreateItem(1198,1,wall4)
		doCreateItem(1198,1,wall5)
		doTransformItem(item.uid,item.itemid-1)		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end