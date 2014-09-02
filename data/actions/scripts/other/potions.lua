local ultimateHealthPot = 8473
local greatHealthPot = 7591
local greatManaPot = 7590
local greatSpiritPot = 8472
local strongHealthPot = 7588
local strongManaPot = 7589
local healthPot = 7618
local manaPot = 7620
local smallHealthPot = 8704
local antidotePot = 8474
local greatEmptyPot = 7635
local strongEmptyPot = 7634
local emptyPot = 7636

local antidote = createCombatObject()
setCombatParam(antidote, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(antidote, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(antidote, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)
setCombatParam(antidote, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(antidote, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local exhaust = createConditionObject(CONDITION_EXHAUST_HEAL)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, getConfigInfo('timeBetweenExActions'))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.uid ~= cid or itemEx.itemid ~= 1) then
		return TRUE
	end

	if(getCreatureCondition(cid, CONDITION_EXHAUST_HEAL) == TRUE) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return TRUE
	end

	if(item.itemid == antidotePot) then
		if(doCombat(cid, antidote, numberToVariant(cid)) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, emptyPot)
	elseif(item.itemid == smallHealthPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 50, 100, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, emptyPot)
	elseif(item.itemid == healthPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 100, 200, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, emptyPot)
	elseif(item.itemid == manaPot) then
		if(doTargetCombatMana(0, cid, 70, 130, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, emptyPot)
	elseif(item.itemid == strongHealthPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 200, 400, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, strongEmptyPot)
	elseif(item.itemid == strongManaPot) then
		if(doTargetCombatMana(0, cid, 110, 190, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, strongEmptyPot)
	elseif(item.itemid == greatSpiritPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 200, 400, CONST_ME_MAGIC_BLUE) == LUA_ERROR or doTargetCombatMana(0, cid, 110, 190, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)
	elseif(item.itemid == greatHealthPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 500, 700, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)
	elseif(item.itemid == greatManaPot) then
		if(doTargetCombatMana(0, cid, 300, 500, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)
	elseif(item.itemid == ultimateHealthPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 1300, 1700, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doAddCondition(cid, exhaust)
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)
	end
	return TRUE
end