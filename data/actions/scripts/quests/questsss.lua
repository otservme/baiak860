-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5500 then
   		queststatus = getPlayerStorageValue(cid,5500)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found crystalline armor.")
   			doPlayerAddItem(cid,8878,1)
   			setPlayerStorageValue(cid,5500,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5200 then
   		queststatus = getPlayerStorageValue(cid,51100)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found justice seeker.")
   			doPlayerAddItem(cid,7390,1)
   			setPlayerStorageValue(cid,51100,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5300 then
   		queststatus = getPlayerStorageValue(cid,56600)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found divine plate.")
   			doPlayerAddItem(cid,8885,1)
   			setPlayerStorageValue(cid,56600,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5400 then
   		queststatus = getPlayerStorageValue(cid,57700)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found vile axe.")
   			doPlayerAddItem(cid,7388,1)
   			setPlayerStorageValue(cid,57700,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
