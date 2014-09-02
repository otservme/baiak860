local timeToCreate = 1 -- minutes
local walls = {
	{ x = 104, y = 58, z = 7, stackpos = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE },
	{ x = 104, y = 57, z = 7, stackpos = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE }
}

function removeWalls(item, position)
	doBroadcastMessage("Event is open!")
	addEvent(createWalls, timeToCreate * 1000)
	for i = 1, table.maxn(walls) do
		doRemoveItem(getThingfromPos(walls[i]).uid)
		doSendMagicEffect(walls[i], CONST_ME_MAGIC_RED)
	end
	return TRUE
end

function createWalls(item, position)
	for i = 1,table.maxn(walls) do
		doCreateItem(1039, 1, walls[i])
		doSendMagicEffect(walls[i], CONST_ME_MAGIC_GREEN)
	end
	return TRUE
end

function onThink(interval, lastExecution)
	doBroadcastMessage("Next event in 3 hours.")
	addEvent(removeWalls, 1000)
	return TRUE
end
