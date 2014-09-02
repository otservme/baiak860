function onUse(cid, item, frompos, item2, topos)


	if item.uid == 60062 then
		if getPlayerStorageValue(cid,60062) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a crusader helmet.")
			doPlayerAddItem(cid,2497,1)
			setPlayerStorageValue(cid,60062,1)
		else
			doPlayerSendTextMessage(cid,25,"The pile of bones is empty.")
		end
	
	end
	return TRUE
end