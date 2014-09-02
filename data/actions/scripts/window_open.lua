function onUse(cid, item, frompos, item2, topos)
	if getTileHouseInfo(getPlayerPosition(cid)) ~= 0 then
		return doTransformItem(item.uid, item.itemid + 2)
	else
		return 0	
	end
end