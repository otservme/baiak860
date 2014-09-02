local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 300000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICPOINTS, 40)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, -30)

function onUse(cid, item, frompos, item2, topos)
if(isInArray({1,2,5,6,9,10}, getPlayerVocation(cid)) == TRUE) then
var = numberToVariant(cid)
doTargetCombatCondition(0, cid, condition, CONST_ME_MAGIC_RED)
doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"This potion can only be consumed by sorcerers and druids.")
return 1
end
end