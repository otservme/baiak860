function onUse(cid, item, frompos, item2, topos)

	if item.uid == 9090 then
 	queststatus = getPlayerStorageValue(cid,9090)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a One Rare Axe Dark Axe.")
 	doPlayerAddItem(cid,7434,1)
 	setPlayerStorageValue(cid,7434,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
 	end
	else
	return 0
	end

	return 1
	end 