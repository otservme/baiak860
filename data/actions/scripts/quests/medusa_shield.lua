function onUse(cid, item, frompos, item2, topos)

	if item.uid == 50015 then
		if getPlayerStorageValue(cid,50015) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2536,1)
			doAddContainerItem(bag,2436,1)
			doAddContainerItem(bag,2656,1)
			setPlayerStorageValue(cid,50015,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end