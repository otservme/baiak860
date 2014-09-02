-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 8215 then
   		queststatus = getPlayerStorageValue(cid,6969)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Grrrr!")
			doSendMagicEffect(topos,14)
   			setPlayerStorageValue(cid,6969,1)
   		else
   			doPlayerSendTextMessage(cid,22,"The Devil has been aroused.")
       	end
	else
		return 0
   	end

   	return 1
end	
	

