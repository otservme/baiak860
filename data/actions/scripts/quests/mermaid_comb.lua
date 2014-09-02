function onUse(cid, item, frompos, item2, topos)

	if item.uid == 50016 then
		if getPlayerStorageValue(cid,50016) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Mermaid Comb.")
			doPlayerAddItem(cid,5945,1)
			setPlayerStorageValue(cid,50016,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end