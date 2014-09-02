function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50025 then
		if getPlayerStorageValue(cid,50025) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Demon Helmet.")
			doPlayerAddItem(cid,2493,1)
			setPlayerStorageValue(cid,50025,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50026 then
		if getPlayerStorageValue(cid,50026) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Demon Shield.")
			doPlayerAddItem(cid,2520,1)
			setPlayerStorageValue(cid,50026,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end


	elseif item.uid == 50027 then
		if getPlayerStorageValue(cid,50027) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Steel Boots.")
			doPlayerAddItem(cid,2645,1)
			setPlayerStorageValue(cid,50027,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
		
	end
	return TRUE
end