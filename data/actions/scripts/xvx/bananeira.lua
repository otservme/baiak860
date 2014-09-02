function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 5095 then 
		doTransformItem(itemEx.uid, 5092)
		doPlayerAddItem(cid,2676,18)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end