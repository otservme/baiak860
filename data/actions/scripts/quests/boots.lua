-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 4787 then
   		queststatus = getPlayerStorageValue(cid,5999)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a firewalker boots.")
   			doPlayerAddItem(cid,9933,1)
   			setPlayerStorageValue(cid,5999,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end
