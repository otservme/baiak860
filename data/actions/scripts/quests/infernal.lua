-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9978 then
   		queststatus = getPlayerStorageValue(cid,9976)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Infernal Bolt.")
   			doPlayerAddItem(cid,6529,1)
   			setPlayerStorageValue(cid,9976,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

