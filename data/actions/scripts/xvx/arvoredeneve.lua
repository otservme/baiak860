function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 7023 then 
		doTransformItem(itemEx.uid, 7024)
		doPlayerAddItem(cid,2111,7)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end