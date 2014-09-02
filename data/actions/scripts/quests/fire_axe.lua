function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50032 then
		if getPlayerStorageValue(cid,50032) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Fire Axe.")
			doPlayerAddItem(cid,2432,1)
			setPlayerStorageValue(cid,50032,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	end
	return TRUE
end