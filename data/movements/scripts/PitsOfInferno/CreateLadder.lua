function onStepIn(cid, item, frompos, item2, topos) 
	wall1 = {x=461, y=1374, z=10, stackpos=1}
	getwall1 = getThingfromPos(wall1)

	if item.uid == 10225 then
		doCreateItem(1386,1,wall1)
end
end

function onStepOut(cid, item, frompos, item2, topos)
	wall1 = {x=461, y=1374, z=10, stackpos=1}
	getwall1 = getThingfromPos(wall1)

	if item.uid == 10225 then
		doRemoveItem(getwall1.uid,1)
	end

	return 1
end