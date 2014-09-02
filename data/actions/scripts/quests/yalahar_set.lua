function onUse(cid, item, frompos, item2, topos)


	if item.uid == 50001 then
		if getPlayerStorageValue(cid,50001) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Yalahari Mask.")
			doPlayerAddItem(cid,9778,1)
			setPlayerStorageValue(cid,50001,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50002 then
		if getPlayerStorageValue(cid,50001) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Yalahari Armor.")
			doPlayerAddItem(cid,9776,1)
			setPlayerStorageValue(cid,50001,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 50003 then
		if getPlayerStorageValue(cid,50001) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Yalahari Leg Piece.")
			doPlayerAddItem(cid,9777,1)
			setPlayerStorageValue(cid,50001,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end
	
	end
	return TRUE
end