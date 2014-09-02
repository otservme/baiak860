function onSay(cid, words)

	local c = {
	{x=1505, y=1517, z=7},
	{x=1504, y=1517, z=7},
	{x=1504, y=1516, z=7},
	}

		if getCreatureCondition(cid, CONDITION_INFIGHT) then
			return doPlayerSendCancel(cid, "Sorry, you are in battle")
		end
		if getCreatureSkullType(cid) ~= 0 then
			return doPlayerSendCancel(cid, "Não pode usar o comando com battle!")
		end
	doTeleportThing(cid, c[math.random(#c)], true)
	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
	return	TRUE
end