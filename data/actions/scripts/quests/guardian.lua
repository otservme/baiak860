-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 4546 then
   		queststatus = getPlayerStorageValue(cid,6691)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a noble axe. It weighs 38.00 oz.")
   			doPlayerAddItem(cid,7456,1)
   			setPlayerStorageValue(cid,6691,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

