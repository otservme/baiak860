-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 15873 then
   		queststatus = getPlayerStorageValue(cid,5433)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a blessed shield.")
   			doPlayerAddItem(cid,2523,1)
   			setPlayerStorageValue(cid,5433,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

