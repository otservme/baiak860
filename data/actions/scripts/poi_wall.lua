function onUse(cid, item, frompos, item2, topos)
	wall1 = {x=348, y=443, z=8, stackpos=1}
	getwall1 = getThingfromPos(wall1)

	if item.uid == 1030 and item.itemid == 1945 then
		doRemoveItem(getwall1.uid,1)
		doTransformItem(item.uid,item.itemid+1)
	
	elseif item.uid == 1030 and item.itemid == 1946 then
		doCreateItem(1498,1,wall1)
		doTransformItem(item.uid,item.itemid-1)		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end