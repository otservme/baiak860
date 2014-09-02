function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 4830) then
       doTeleportThing(getTopCreature({x=993,y=960,z=1}).uid, {x=993,y=960,z=4})
	elseif (item.actionid == 4831) then
		doTeleportThing(getTopCreature({x=993,y=960,z=4}).uid, {x=993,y=960,z=1})
	elseif (item.actionid == 4832) then
		doTeleportThing(getTopCreature({x=995,y=968,z=4}).uid, {x=1063,y=948,z=10})
	elseif (item.actionid == 4833) then
		doTeleportThing(getTopCreature({x=1063,y=948,z=10}).uid, {x=995,y=968,z=4})
	end
	return true
end