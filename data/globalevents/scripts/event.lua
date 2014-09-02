local timeToCreate = 1 -- minutes
local walls = {
	{ x = 417, y = 65, z = 7, stackpos = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE },
	{ x = 417, y = 67, z = 7, stackpos = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE }
}

function removeWalls(item, position)
	doBroadcastMessage("Somente para jogadores experientes.")
	addEvent(createWalls, timeToCreate * 100000000)
	for i = 1, table.maxn(walls) do
		doRemoveItem(getThingfromPos(walls[i]).uid)
		doSendMagicEffect(walls[i], CONST_ME_MAGIC_RED)
	end
	return TRUE
end

function createWalls(item, position)
	for i = 1,table.maxn(walls) do
		doCreateItem(9485, 1, walls[i])
		doSendMagicEffect(walls[i], CONST_ME_MAGIC_GREEN)
	end
	return TRUE
end

function onThink(interval, lastExecution)
	doBroadcastMessage("Blood castle aberto!.")
	addEvent(removeWalls, 1000)
	return TRUE
end
