-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 4066 then
   		queststatus = getPlayerStorageValue(cid,4066)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have absorved the spirit of Apocalypse, Total Destruction.")
   			setPlayerStorageValue(cid,4066,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 4064 then
   		queststatus = getPlayerStorageValue(cid,4064)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have absorved the spirit of Ashfalor, the Right Hand of Urgith. The general of the undead hordes.")
   			setPlayerStorageValue(cid,4064,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 4060 then
   		queststatus = getPlayerStorageValue(cid,4060)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have absorved the spirit of Infernatil, the Incendiary of Hell.")
   			setPlayerStorageValue(cid,4060,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 4062 then
   		queststatus = getPlayerStorageValue(cid,4062)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have absorved the spirit of Tafariel, the Mistress of the Damned.")
   			setPlayerStorageValue(cid,4062,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 4058 then
   		queststatus = getPlayerStorageValue(cid,4058)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have absorved the spirit of Verminor, the Plaguelord.")
   			setPlayerStorageValue(cid,4058,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   	   	
   		end
	else
		return 0
   	end

   	return 1
end
