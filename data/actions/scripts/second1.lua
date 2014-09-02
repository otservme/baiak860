function onUse(cid, item, frompos, item2, topos)
	wall1 = {x=1231, y=1619, z=10, stackpos=1}
	getwall1 = getThingfromPos(wall1)

	if item.uid == 6101 and item.itemid == 1945 then
		doRemoveItem(getwall1.uid,1)
		doCreateItem(5107,1,wall1)
		doTransformItem(item.uid,item.itemid+1)
	
	elseif item.uid == 6101 and item.itemid == 1946 then
		doRemoveItem(getwall1.uid,1)
		doCreateItem(1025,1,wall1)
		doTransformItem(item.uid,item.itemid-1)		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end