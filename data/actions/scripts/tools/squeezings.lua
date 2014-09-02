local holes = {468, 481, 483, 7932}
local holeId = {294, 369, 370, 383, 392, 408, 409, 427, 428, 430, 462, 469, 470, 482, 484, 485, 489, 924, 3135, 3136}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local value = getPlayerStorageValue(cid, 10)
	if(value ~= -1 and os.clock()-value < 60)then
		doPlayerSay(cid, "The tool jammed. Please wait " .. 60-math.floor(os.clock()-value) .. " seconds before using it again.", TALKTYPE_MONSTER)
		return TRUE
	end
	if(math.random(1, 10) == 1)then
		setPlayerStorageValue(cid, 10, os.clock())
		doPlayerSay(cid, "The tool jammed. Please wait 60 seconds before using it again.", TALKTYPE_MONSTER)
		return TRUE
	end
	-- Shovel
	if isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1) 
		doDecayItem(itemEx.uid)
		return FALSE
	-- Rope
	elseif toPosition.x == CONTAINER_POSITION or toPosition.x == 0 and toPosition.y == 0 and toPosition.z == 0 then
		return FALSE
	end

	local groundTile = getThingfromPos(toPosition)
	if groundTile.itemid == 384 or groundTile.itemid == 418 or groundTile.itemid == 8278 then
		doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, FALSE)
	elseif isInArray(holeId, itemEx.itemid) == TRUE then
		local hole = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
		if hole.itemid > 0 then
			doTeleportThing(hole.uid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z}, FALSE)
		else
			doPlayerSendCancel(cid, "Sorry, not possible.")
		end
		return FALSE
	-- Pick
	elseif (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355 or itemEx.itemid == 9024 or itemEx.itemid == 9025) then
		doTransformItem(itemEx.uid, 392)
		doDecayItem(itemEx.uid)
		return TRUE
	elseif itemEx.uid == 60001 then
		doTeleportThing(cid, {x=329, y=772, z=10})
		doSendMagicEffect({x=329, y=772, z=10},10)
		return TRUE
	-- Machete
	elseif itemEx.itemid == 2782 then
		doTransformItem(itemEx.uid, 2781)
		doDecayItem(itemEx.uid)
		return TRUE
	elseif itemEx.itemid == 1499 then
		doRemoveItem(itemEx.uid)
		return TRUE
	-- Scythe
	elseif itemEx.itemid == 2739 then 
		doTransformItem(itemEx.uid, 2737)
		doCreateItem(2694, 1, toPosition)
		doDecayItem(itemEx.uid)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end
