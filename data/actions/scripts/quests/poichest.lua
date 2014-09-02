-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5957 then
   		queststatus = getPlayerStorageValue(cid,5957)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Backpack of Holding.")
   			doPlayerAddItem(cid,2365,1)
   			setPlayerStorageValue(cid,5957,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5956 then
   		queststatus = getPlayerStorageValue(cid,5956)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Stuffed Dragon.")
   			doPlayerAddItem(cid,5791,1)
   			setPlayerStorageValue(cid,5956,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5955 then
   		queststatus = getPlayerStorageValue(cid,5955)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Soft Boots.")
   			doPlayerAddItem(cid,6132,1)
   			setPlayerStorageValue(cid,5955,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5954 then
   		queststatus = getPlayerStorageValue(cid,5954)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Frosen Satarlight.")
   			doPlayerAddItem(cid,2361,1)
   			setPlayerStorageValue(cid,5954,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5953 then
   		queststatus = getPlayerStorageValue(cid,5953)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Ornamented Ankh.")
   			doPlayerAddItem(cid,2354,1)
   			setPlayerStorageValue(cid,5953,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
