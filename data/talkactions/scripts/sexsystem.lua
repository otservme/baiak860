local ITEM_CONDON = 6527
local ITEM_GOLD = 2148
local ITEM_PLATINUM = 2152
local ITEM_CRYSTAL = 2160
local ITEM_CHILD = 6579
local damage = 50
local times = 50
local noCondon = math.random(1,4)


local combat = createCombatObject()
local condition = createConditionObject(CONDITION_DROWN)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, times, 100, -damage)
setCombatCondition(combat, condition)

function onSay(cid, words, param)
	local playerPos = geCreaturePosition(cid)
	if (getPlayerLookDir(cid) == 1) then 
		target = {x = playerPos.x + 1, y = playerPos.y, z = playerPos.z, stackpos = 253}
	elseif (getPlayerLookDir(cid) == 2) then
		target = {x = playerPos.x, y = playerPos.y + 1, z = playerPos.z, stackpos = 253}
	elseif (getPlayerLookDir(cid) == 3) then
		target = {x = playerPos.x - 1, y = playerPos.y, z = playerPos.z, stackpos = 253}
	else
		target = {x = playerPos.x, y = playerPos.y - 1, z = playerPos.z, stackpos = 253}
	end
	target = getThingfromPos(target)
	if (isPlayer(target.uid) == TRUE) then
		if (getPlayerLookDir(target.uid) == getPlayerLookDir(cid)) then
			if (getPlayerItemCount(cid, ITEM_CONDON) > 0) then
				doSendAnimatedText(playerPos, 'Craw!!!', TEXTCOLOR_GOLD)
				doSendAnimatedText(getThingPos(target.uid), 'Oh God!!', TEXTCOLOR_CRYSTAL)
				doPlayerRemoveItem(cid, ITEM_CONDON, 1)
			else
				if (noCondon < 3) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You got AIDS!')
					doCombat(0,combat,numberToVariant(cid))
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You got a child!')
					local child = doPlayerAddItem(ITEM_CHILD, 1)
			doSetItemSpecialDescription(doPlayerAddItem(cid,ITEM_CHILD, 1),'It is a son of '..getCreatureName(cid)..' and '..getCreatureName(target.uid)..'.')
					local gps = getPlayerItemCount(cid, ITEM_GOLD)
					local pcs = getPlayerItemCount(cid, ITEM_PLATINUM)
					local ccs = getPlayerItemCount(cid, ITEM_CRYSTAL)
					if (gps > 0 or pcs > 0 or ccs > 0) then
						doPlayerRemoveItem(cid, ITEM_GOLD, gps)
						doPlayerRemoveItem(cid, ITEM_PLATINUM, pcs)
						doPlayerRemoveItem(cid, ITEM_CRYSTAL, ccs)
					else
						return TRUE
					end
				end
			end
		else
			return TRUE
		end
	else
		return TRUE
	end
	return FALSE
end
