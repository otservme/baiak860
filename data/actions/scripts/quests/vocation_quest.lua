function onUse(cid, item, frompos, item2, topos)


	if item.uid == 9012 then
		if getPlayerStorageValue(cid,9012) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 100 Platinum Coins.")
			doPlayerAddItem(cid,2152,100)
			setPlayerStorageValue(cid,9012,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	elseif item.uid == 9013 then
		if getPlayerStorageValue(cid,9013) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Intense Healing Rune.")
			doPlayerAddItem(cid,2265,100)
			setPlayerStorageValue(cid,9013,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 9014 then
		if getPlayerStorageValue(cid,9014) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 100 Brown Mushroom's.")
			doPlayerAddItem(cid,2789,100)
			setPlayerStorageValue(cid,9014,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	end
	return TRUE
end