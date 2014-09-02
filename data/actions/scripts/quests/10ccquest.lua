function onUse(cid, item, frompos, item2, topos)
  	-- 10cc Quest
  	if item.uid == 34871 then
  		queststatus = getPlayerStorageValue(cid,34871)
  		if queststatus == -1 then
  			if getPlayerLevel(cid) >= 50 then
  				doPlayerSendTextMessage(cid,22,"You have found your reward.")
  				doPlayerAddItem(cid,2160,10)
  				setPlayerStorageValue(cid,34871,1)
  			else
  				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
  			end
  		else
  			doPlayerSendTextMessage(cid,22,"It is empty.")
  		end
  	end
end