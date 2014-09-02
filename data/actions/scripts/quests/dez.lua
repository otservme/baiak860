-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5970 then
   		queststatus = getPlayerStorageValue(cid,5970)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Great Shield.")
   			doPlayerAddItem(cid,2522,1)
   			setPlayerStorageValue(cid,5970,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

