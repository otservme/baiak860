local playerPosition =
{
	{x = 32673, y = 32085, z = 8, stackpos = STACKPOS_TOP_CREATURE},
	{x = 32669, y = 32089, z = 8, stackpos = STACKPOS_TOP_CREATURE},
	{x = 32677, y = 32089, z = 8, stackpos = STACKPOS_TOP_CREATURE},
	{x = 32673, y = 32093, z = 8, stackpos = STACKPOS_TOP_CREATURE}
}

local newPosition =
{
	{x = 32671, y = 32069, z = 8},
 	{x = 32672, y = 32069, z = 8},
	{x = 32671, y = 32070, z = 8},
	{x = 32672, y = 32070, z = 8}
}

-- Do not modify the declaration lines below.
local player = {0, 0, 0, 0}
local failed = FALSE

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		for i = 1, 4 do
			failed = TRUE
			player[i] = getThingfromPos(playerPosition[i])
			if player[i].itemid > 0 then
				if isPlayer(player[i].uid) == TRUE then
					if getPlayerStorageValue(player[i].uid, 9012) == -1 then
						if getPlayerLevel(player[i].uid) >= 20 then
							failed = FALSE
						end
					end
				end
			end
			if failed == TRUE then
				doPlayerSendCancel(cid, "Sorry, not possible.")
				return TRUE
			end
		end
		for i = 1, 4 do
			doSendMagicEffect(playerPosition[i], CONST_ME_POFF)
			doTeleportThing(player[i].uid, newPosition[i], FALSE)
			doSendMagicEffect(newPosition[i], CONST_ME_ENERGYAREA)
		end
		doTransformItem(item.uid, item.itemid + 1)
	elseif item.itemid == 1946 then
		doPlayerSendCancel(cid, "Sorry, not possible.")
	end
	return TRUE
end