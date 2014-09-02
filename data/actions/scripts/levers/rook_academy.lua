local wall = {x=32095, y=32173, z=8, stackpos=1}

function onUse(cid, item, frompos, item2, topos)

local getwall = getThingfromPos(wall) 

	if item.uid == 60041 and item.itemid == 1945 then
		doTransformItem(item.uid,item.itemid+1)
		doRemoveItem(getwall.uid)
	elseif item.uid == 60041 and item.itemid == 1946 then
		doTransformItem(item.uid,item.itemid-1)
		doCreateItem(1026, 1, wall)
		local creature = {x=32095, y=32173, z=8, stackpos=253}
		local getCreature = getThingfromPos(creature)
		if isCreature(getCreature.uid) == TRUE then
			doMoveCreature(getCreature.uid,SOUTH)
		end
	end
	return 1
end