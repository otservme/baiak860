function onUse(cid, item, frompos, item2, topos)

	if item.uid == 50009 then
		if getPlayerStorageValue(cid,50009) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Noble Armor.")
			doPlayerAddItem(cid,2486,1)
			setPlayerStorageValue(cid,50009,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50010 then
		if getPlayerStorageValue(cid,50010) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Crown Helmet.")
			doPlayerAddItem(cid,2491,1)
			setPlayerStorageValue(cid,50010,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end