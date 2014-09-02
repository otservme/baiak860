function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 5096 then 
		doTransformItem(itemEx.uid, 2726)
		doPlayerAddItem(cid,2678,2)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end