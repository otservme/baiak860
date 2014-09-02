function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 7158) then
		doTransformItem(itemEx.uid, 2240)
		doCreateItem(2668, 4, toPosition)
		doDecayItem(itemEx.uid)
		return true
	end
	return destroyItem(cid, itemEx, toPosition)
end
