local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 300000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEE, 30)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, 30)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 30)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, 30)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, -60)

function onUse(cid, item, frompos, item2, topos)
if(isInArray({4,8}, getPlayerVocation(cid)) == TRUE) then
var = numberToVariant(cid)
doTargetCombatCondition(0, cid, condition, CONST_ME_MAGIC_RED)
doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"This potion can only be consumed by knights.")
return 1
end
end