function onStepIn(cid, item, frompos, item2, topos) 
	wall1 = {x=434, y=1326, z=10, stackpos=1}
	getwall1 = getThingfromPos(wall1)

	if item.uid == 10257 then
		doCreateItem(1304,1,wall1)
end
end