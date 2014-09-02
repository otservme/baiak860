-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7102 then
   		queststatus = getPlayerStorageValue(cid,5491)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Ancient Full Helmet.")
   			doPlayerAddItem(cid,2343,1)
   			setPlayerStorageValue(cid,5491,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7101 then
   		queststatus = getPlayerStorageValue(cid,5491)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Demon Legs.")
   			doPlayerAddItem(cid,2495,1)
   			setPlayerStorageValue(cid,5491,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7103 then
   		queststatus = getPlayerStorageValue(cid,5491)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Golden Boots.")
   			doPlayerAddItem(cid,2646,1)
   			setPlayerStorageValue(cid,5491,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7103 then
   		queststatus = getPlayerStorageValue(cid,5491)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Golden Boots.")
   			doPlayerAddItem(cid,2646,1)
   			setPlayerStorageValue(cid,5491,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
