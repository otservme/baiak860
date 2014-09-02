function onUse(cid, item, frompos, item2, topos)

	if item.uid == 50030 then
		if getPlayerStorageValue(cid,50030) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Vampire Shield.")
			doPlayerAddItem(cid,2534,1)
			setPlayerStorageValue(cid,50030,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50031 then
		if getPlayerStorageValue(cid,50031) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Dragon Lance.")
			doPlayerAddItem(cid,2414,1)
			setPlayerStorageValue(cid,50031,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end