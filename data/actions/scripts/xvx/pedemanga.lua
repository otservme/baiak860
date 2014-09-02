function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 5157 then 
		doTransformItem(itemEx.uid, 5156)
		doPlayerAddItem(cid,5097,6)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end