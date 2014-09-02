function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 2717 then 
		doTransformItem(itemEx.uid, 3873)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end