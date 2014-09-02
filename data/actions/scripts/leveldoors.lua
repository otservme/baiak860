function onStepOut(cid, item, pos)
	
	if isPlayer(cid) == 1 then
		if item.actionid < 2000 and item.actionid >= 1000 then
			doorHandler:useDoor(item, getThingPos(item.uid), cid, nil, false)
		end
	end
	return 1
end
