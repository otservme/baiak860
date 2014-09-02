-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5952 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Jagged Sword.")
   			doPlayerAddItem(cid,8602,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5951 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Steel Axe.")
   			doPlayerAddItem(cid,8601,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5950 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Daramanian Mace.")
   			doPlayerAddItem(cid,2439,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5949 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Wand of Vortex.")
   			doPlayerAddItem(cid,2190,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5948 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Snakebit Rod.")
   			doPlayerAddItem(cid,2182,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5947 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Hunting Spear.")
   			doPlayerAddItem(cid,3965,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5946 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found 5 Throwing stars.")
   			doPlayerAddItem(cid,2399,5)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
