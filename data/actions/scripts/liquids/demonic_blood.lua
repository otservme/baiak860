local POTIONS = {7588, 7589}
local EMPTY_POTION = 7634
function onUse(cid, item, fromPosition, itemEx, toPosition)
	doRemoveItem(item.uid, 1)
     doPlayerAddItem(cid, EMPTY_POTION, 1)
	doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)
	return true
end
