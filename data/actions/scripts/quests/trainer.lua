function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.uid == 50034 then
		doTeleportThing(cid, {x = 33271, y = 31797, z = 11})
		doSendMagicEffect({x = 33271, y = 31797, z = 11},11)
	elseif itemEx.uid == 50035 then
		doTeleportThing(cid, {x = 33271, y = 31797, z = 6})
		doSendMagicEffect({x = 33271, y = 31797, z = 6},11)
		return TRUE
	end
	return FALSE
end