-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 8883 then
   		queststatus = getPlayerStorageValue(cid,6694)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a obsidian knife.")
   			doPlayerAddItem(cid,5908,1)
   			setPlayerStorageValue(cid,6694,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

