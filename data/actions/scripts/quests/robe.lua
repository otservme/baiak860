----leo---

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 5901 then
 	queststatus = getPlayerStorageValue(cid,5502)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a dark lord's cape.")
 	doPlayerAddItem(cid,8865,1)
 	setPlayerStorageValue(cid,5502,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	else
	return 0
	end
	end
	return 1