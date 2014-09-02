function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50013 then
		if getPlayerStorageValue(cid,50013) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Blue Legs.")
			doPlayerAddItem(cid,7730,1)
			setPlayerStorageValue(cid,50013,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50014 then
		if getPlayerStorageValue(cid,50014) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a 50 Platinum Coins.")
			doPlayerAddItem(cid,2152,50)
			setPlayerStorageValue(cid,50014,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50019 then
		if getPlayerStorageValue(cid,50019) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a piece of broken amulet.")
			doPlayerAddItem(cid,8262,1)
			setPlayerStorageValue(cid,50019,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50020 then
		if getPlayerStorageValue(cid,50020) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a piece of broken amulet.")
			doPlayerAddItem(cid,8263,1)
			setPlayerStorageValue(cid,50020,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end	

	elseif item.uid == 50021 then
		if getPlayerStorageValue(cid,50021) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a piece of broken amulet.")
			doPlayerAddItem(cid,8264,1)
			setPlayerStorageValue(cid,50021,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50022 then
		if getPlayerStorageValue(cid,50022) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a piece of broken amulet.")
			doPlayerAddItem(cid,8265,1)
			setPlayerStorageValue(cid,50022,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	end
	return TRUE
end