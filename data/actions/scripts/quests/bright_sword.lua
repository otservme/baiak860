function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50028 then
		if getPlayerStorageValue(cid,50028) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Bright Sword.")
			doPlayerAddItem(cid,2407,1)
			setPlayerStorageValue(cid,50028,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end