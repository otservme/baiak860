function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 7732 then 
		doTransformItem(itemEx.uid, 2717)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end