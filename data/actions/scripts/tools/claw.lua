local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_POISON)
	function onUse(cid, item, frompos, item2, topos, var)
	doTransformItem(item.uid, item.itemid + 1)
	return TRUE
end