function onUse(cid, item, frompos, item2, topos)

	if item.uid == 5300 then
 	queststatus = getPlayerStorageValue(cid,5300)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a divine plate.")
 	doPlayerAddItem(cid,8885,1)
 	setPlayerStorageValue(cid,5300,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	else
	return 0
	end
	
	return 1