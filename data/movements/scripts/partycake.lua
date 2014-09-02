function onAddItem(moveitem, tileitem, position, cid)
	if(moveitem.itemid == 2679) then
		doTransformItem(moveitem.uid, 6279)
		doSendMagicEffect(position, CONST_ME_HITBYFIRE)
	end
	return true
end
