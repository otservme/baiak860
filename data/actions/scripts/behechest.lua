-- behe quest by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5000 then
   		queststatus = getPlayerStorageValue(cid,5000)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Giant Sword.")
   			doPlayerAddItem(cid,2393,1)
   			setPlayerStorageValue(cid,5000,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
-- poi
   	elseif item.uid == 5957 then
   		queststatus = getPlayerStorageValue(cid,5957)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found 100 infernal bolts.")
   			doPlayerAddItem(cid,6529,100)
                  doSendMagicEffect(topos,30)
   			setPlayerStorageValue(cid,5957,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5956 then
   		queststatus = getPlayerStorageValue(cid,5956)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found ornameted ankh.")
   			doPlayerAddItem(cid,6561,1)
   			doPlayerAddItem(cid,2365,1)
                  doSendMagicEffect(topos,30)
   			setPlayerStorageValue(cid,5956,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5955 then
   		queststatus = getPlayerStorageValue(cid,5955)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found stuffed dragon.")
   			doPlayerAddItem(cid,6566,1)
                  doSendMagicEffect(topos,30)
   			setPlayerStorageValue(cid,5955,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5954 then
   		queststatus = getPlayerStorageValue(cid,5954)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found soft boots.")
   			doPlayerAddItem(cid,6132,1)
                  doSendMagicEffect(topos,30)
   			setPlayerStorageValue(cid,5954,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5953 then
   		queststatus = getPlayerStorageValue(cid,5953)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found frozen starlight.")
   			doPlayerAddItem(cid,2361,1)
                  doSendMagicEffect(topos,30)
   			setPlayerStorageValue(cid,5953,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
-- end poi
   	elseif item.uid == 5002 then
   		queststatus = getPlayerStorageValue(cid,5002)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Demon shield.")
   			doPlayerAddItem(cid,2520,1)
   			setPlayerStorageValue(cid,5002,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5005 then
   		queststatus = getPlayerStorageValue(cid,5005)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Golden Armor.")
   			doPlayerAddItem(cid,2466,1)
   			setPlayerStorageValue(cid,5005,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5001 then
   		queststatus = getPlayerStorageValue(cid,5001)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Guardian Halberd.")
   			doPlayerAddItem(cid,2427,1)
   			setPlayerStorageValue(cid,5001,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
