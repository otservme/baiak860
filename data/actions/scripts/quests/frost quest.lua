-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5992 then
   		queststatus = getPlayerStorageValue(cid,5992)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Justice Seeker.")
   			doPlayerAddItem(cid,7390,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end
