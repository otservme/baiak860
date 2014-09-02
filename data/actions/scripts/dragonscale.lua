function onUse(cid, item, frompos, item2, topos)

	if item.uid == 9394 then
 	queststatus = getPlayerStorageValue(cid,9394)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a Dragon Scale Legs.")
 	doPlayerAddItem(cid,2469,1)
 	setPlayerStorageValue(cid,9394,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	else
	return 0
	end
	
	return 1
	end 