function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50004 then
		if getPlayerStorageValue(cid,50004) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Dark Shield.")
			doPlayerAddItem(cid,2521,1)
			setPlayerStorageValue(cid,50004,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50005 then
		if getPlayerStorageValue(cid,50005) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Battle Hammer.")
			doPlayerAddItem(cid,2417,1)
			setPlayerStorageValue(cid,50005,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end