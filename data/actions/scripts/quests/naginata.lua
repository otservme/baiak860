function onUse(cid, item, frompos, item2, topos)

	if item.uid == 50029 then
		if getPlayerStorageValue(cid,50029) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Naginata.")
			doPlayerAddItem(cid,2426,1)
			setPlayerStorageValue(cid,50029,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	end
	return TRUE
end