local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, 30)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, -50)

function onUse(cid, item, frompos, item2, topos)
if(isInArray({3,7}, getPlayerVocation(cid)) == TRUE) then
var = numberToVariant(cid)
doTargetCombatCondition(0, cid, condition, CONST_ME_MAGIC_RED)
doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"This potion can only be consumed by paladins.")
return 1
end
end