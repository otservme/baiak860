-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5990 then
   		queststatus = getPlayerStorageValue(cid,5990)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Divine Plate.")
   			doPlayerAddItem(cid,8885,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end
