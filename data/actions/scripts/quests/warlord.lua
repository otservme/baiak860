-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6013 then
   		queststatus = getPlayerStorageValue(cid,3333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a justice seeker.")
   			doPlayerAddItem(cid,7390,1)
   			setPlayerStorageValue(cid,3333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 6009 then
   		queststatus = getPlayerStorageValue(cid,3333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a royal axe.")
   			doPlayerAddItem(cid,7434,1)
   			setPlayerStorageValue(cid,3333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 6010 then
   		queststatus = getPlayerStorageValue(cid,3333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a blessed spectre.")
   			doPlayerAddItem(cid,7429,1)
   			setPlayerStorageValue(cid,3333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 6011 then
   		queststatus = getPlayerStorageValue(cid,3333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a present.")
   			doPlayerAddItem(cid,2321,1)
   			setPlayerStorageValue(cid,3333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
		end
   	elseif item.uid == 6012 then
   		queststatus = getPlayerStorageValue(cid,3333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a fur backpack.")
   			doPlayerAddItem(cid,7342,1)
   			setPlayerStorageValue(cid,3333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
