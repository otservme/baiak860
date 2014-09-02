function onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 2000 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a demon armor.")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 2001 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a  magic sword.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 2002 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a stonecutter axe.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
   	elseif item.uid == 2003 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a present.")
			local bag = doPlayerAddItem(cid,1990,1)
			doAddContainerItem(bag,2326,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	end
   	return 1
end
