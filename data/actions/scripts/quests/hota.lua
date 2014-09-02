-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9980 then
   		queststatus = getPlayerStorageValue(cid,9923)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Helmet of The Ancients.")
   			doPlayerAddItem(cid,2342,1)
   			setPlayerStorageValue(cid,9923,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

