-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5877 then
   		queststatus = getPlayerStorageValue(cid,9991)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a winged helmet.")
   			doPlayerAddItem(cid,2474,1)
   			setPlayerStorageValue(cid,9991,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

