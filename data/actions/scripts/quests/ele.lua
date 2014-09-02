----leo---

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 5910 then
 	queststatus = getPlayerStorageValue(cid,5501)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a greenwood coat.")
 	doPlayerAddItem(cid,8869,1)
 	setPlayerStorageValue(cid,5501,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	else
	return 0
	end
	end
	return 1