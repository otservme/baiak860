function onUse(cid, item, frompos, item2, topos)

	if item.uid == 6500 then
 	queststatus = getPlayerStorageValue(cid,6010)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a sprite wand.")
 	doPlayerAddItem(cid,2453,1)
 	setPlayerStorageValue(cid,6010,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
 	end
	else
	return 0
	end

	return 1
	end 