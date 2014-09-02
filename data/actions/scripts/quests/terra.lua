-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5889 then
   		queststatus = getPlayerStorageValue(cid,9993)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a terra legs.")
   			doPlayerAddItem(cid,7885,1)
   			setPlayerStorageValue(cid,9993,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

