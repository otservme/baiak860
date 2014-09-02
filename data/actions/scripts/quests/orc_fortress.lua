function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50006 then
		if getPlayerStorageValue(cid,50006) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Knight Axe.")
			doPlayerAddItem(cid,2430,1)
			setPlayerStorageValue(cid,50006,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50007 then
		if getPlayerStorageValue(cid,50007) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Knight Armor.")
			doPlayerAddItem(cid,2476,1)
			setPlayerStorageValue(cid,50007,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50008 then
		if getPlayerStorageValue(cid,50008) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Fire Sword.")
			doPlayerAddItem(cid,2392,1)
			setPlayerStorageValue(cid,50008,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end