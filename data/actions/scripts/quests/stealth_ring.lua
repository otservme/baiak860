function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50011 then
		if getPlayerStorageValue(cid,50011) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Stealth Ring.")
			doPlayerAddItem(cid,2165,1)
			setPlayerStorageValue(cid,50011,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50012 then
		if getPlayerStorageValue(cid,50012) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Protection Amulet.")
			doPlayerAddItem(cid,2200,1)
			setPlayerStorageValue(cid,50012,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end