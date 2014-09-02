function onUse(cid, item, frompos, item2, topos)

	if item.uid == 50033 then
		if getPlayerStorageValue(cid,50033) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2323,1)
			doAddContainerItem(bag,2197,1)
			doAddContainerItem(bag,2131,1)
			setPlayerStorageValue(cid,50033,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end