function onUse(cid, item, frompos, item2, topos)
	wall1 = {x=1096, y=1461, z=7, stackpos=1}
	getwall1 = getThingfromPos(wall1)

	if item.uid == 1011 and item.itemid == 1945 then
		doRemoveItem(getwall1.uid,1)
		doTransformItem(item.uid,item.itemid+1)
	
	elseif item.uid == 1011 and item.itemid == 1946 then
		doCreateItem(6396,1,wall1)
		doTransformItem(item.uid,item.itemid-1)		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end