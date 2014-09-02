function onUse(cid, item, frompos, item2, topos)

	if item.uid == 5053 then
 	queststatus = getPlayerStorageValue(cid,5020)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a demon helmet.")
 	doPlayerAddItem(cid,2493,1)
 	setPlayerStorageValue(cid,5020,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
 	end
	else
	return 0
	end

	return 1
	end 