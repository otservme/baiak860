-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5433 then
   		queststatus = getPlayerStorageValue(cid,5433)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a rainbow shield.")
   			doPlayerAddItem(cid,8905,1)
   			setPlayerStorageValue(cid,5433,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end
