function onUse(cid, item, frompos, item2, topos)

	if item.uid == 6502 then
 	queststatus = getPlayerStorageValue(cid,6010)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found an arbalest.")
 	doPlayerAddItem(cid,5803,1)
 	setPlayerStorageValue(cid,6010,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
 	end
	else
	return 0
	end

	return 1
	end 