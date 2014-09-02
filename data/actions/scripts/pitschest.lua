-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5058 then
   		queststatus = getPlayerStorageValue(cid,8742)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Sprite Wand.")
   			doPlayerAddItem(cid,2453,1)
   			setPlayerStorageValue(cid,8742,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5059 then
   		queststatus = getPlayerStorageValue(cid,8742)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Avenger.")
   			doPlayerAddItem(cid,6528,1)
   			setPlayerStorageValue(cid,8742,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5060 then
   		queststatus = getPlayerStorageValue(cid,8742)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Arbalest.")
   			doPlayerAddItem(cid,5803,1)
   			setPlayerStorageValue(cid,8742,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
