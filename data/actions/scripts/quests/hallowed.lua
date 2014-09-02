-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 4549 then
   		queststatus = getPlayerStorageValue(cid,6693)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Hallowed Axe. It weighs 41.00 oz. Go to Demon Oak!")
   			doPlayerAddItem(cid,8293,1)
   			setPlayerStorageValue(cid,6693,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

