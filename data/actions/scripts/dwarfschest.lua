-- dwarfs chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7510 then
   		queststatus = getPlayerStorageValue(cid,7510)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Dwarven Axe.")
   			doPlayerAddItem(cid,2435,1)
   			setPlayerStorageValue(cid,7510,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7511 then
   		queststatus = getPlayerStorageValue(cid,7511)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found War Hammer.")
   			doPlayerAddItem(cid,2391,1)
   			setPlayerStorageValue(cid,7511,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7512 then
   		queststatus = getPlayerStorageValue(cid,7512)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Dwarven Armor.")
   			doPlayerAddItem(cid,2503,1)
   			setPlayerStorageValue(cid,7512,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7513 then
   		queststatus = getPlayerStorageValue(cid,7513)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Crusader Helmet.")
   			doPlayerAddItem(cid,2497,1)
   			setPlayerStorageValue(cid,7513,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
