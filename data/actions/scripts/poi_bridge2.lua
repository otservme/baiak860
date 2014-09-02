function onUse(cid, item, frompos, item2, topos)
	bridge1 = {x=540, y=480, z=13, stackpos=1}
	getbridge1 = getThingfromPos(bridge1)
	bridge2 = {x=540, y=479, z=13, stackpos=1}
	getbridge2 = getThingfromPos(bridge2)

	if item.uid == 1021 and item.itemid == 1945 then
		doRemoveItem(getbridge1.uid,1)
		doCreateItem(405,1,bridge1)
		doRemoveItem(getbridge2.uid,1)
		doCreateItem(405,1,bridge2)
		doTransformItem(item.uid,item.itemid+1)
	
	elseif item.uid == 1021 and item.itemid == 1946 then
		doRemoveItem(getbridge1.uid,1)
		doCreateItem(1509,1,bridge1)
		doRemoveItem(getbridge2.uid,1)
		doCreateItem(1509,1,bridge2)
		doTransformItem(item.uid,item.itemid-1)		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end