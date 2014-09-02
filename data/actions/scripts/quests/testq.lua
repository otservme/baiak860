-- magma boots by gorno

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 1002 then
   		queststatus = getPlayerStorageValue(cid,1002)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Magma Boots.")
   			doPlayerAddItem(cid,7891,1)
   			setPlayerStorageValue(cid,1002,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
