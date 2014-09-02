function onUse(cid, item, frompos, item2, topos)
	bridge1 = {x=357, y=450, z=9, stackpos=1}
	getbridge1 = getThingfromPos(bridge1)
	bridge2 = {x=358, y=450, z=9, stackpos=1}
	getbridge2 = getThingfromPos(bridge2)
	bridge3 = {x=359, y=450, z=9, stackpos=1}
	getbridge3 = getThingfromPos(bridge3)

	if item.uid == 1020 and item.itemid == 1945 then
		doRemoveItem(getbridge1.uid,1)
		doCreateItem(405,1,bridge1)
		doRemoveItem(getbridge2.uid,1)
		doCreateItem(405,1,bridge2)
		doRemoveItem(getbridge3.uid,1)
		doCreateItem(405,1,bridge3)
		doTransformItem(item.uid,item.itemid+1)
	
	elseif item.uid == 1020 and item.itemid == 1946 then
		doRemoveItem(getbridge1.uid,1)
		doCreateItem(508,1,bridge1)
		doRemoveItem(getbridge2.uid,1)
		doCreateItem(493,1,bridge2)
		doRemoveItem(getbridge3.uid,1)
		doCreateItem(509,1,bridge3)
		doTransformItem(item.uid,item.itemid-1)		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end