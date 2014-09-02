function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 4006 then 
		doTransformItem(itemEx.uid, 4008)
		doPlayerAddItem(cid,2675,5)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end