local wall = {x=32177, y=32148, z=11, stackpos=1}

function onUse(cid, item, frompos, item2, topos)

local getwall = getThingfromPos(wall) 

	if item.uid == 60048 and item.itemid == 1945 then
		doTransformItem(item.uid,item.itemid+1)
		doTransformItem(getwall.uid,5107)
	elseif item.uid == 60048 and item.itemid == 1946 then
		doTransformItem(item.uid,item.itemid-1)
		doTransformItem(getwall.uid,5109)
		local creature = {x=32177, y=32148, z=11, stackpos=253}
		local getCreature = getThingfromPos(creature)
		if isCreature(getCreature.uid) == TRUE then
			doMoveCreature(getCreature.uid,SOUTH)
		end
	end
	return 1
end