function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 4330) then
       doTeleportThing(getTopCreature({x=1021,y=954,z=6}).uid, {x=1020,y=954,z=4})
	elseif (item.actionid == 4331) then
		doTeleportThing(getTopCreature({x=1020,y=954,z=4}).uid, {x=1021,y=954,z=6})
	end
	return true
end