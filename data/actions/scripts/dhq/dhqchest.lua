function onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 3001 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have a demon helmet.")
   			doPlayerAddItem(cid,2493,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 3002 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found steel boots.")
   			doPlayerAddItem(cid,2645,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 3003 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a demon shield.")
   			doPlayerAddItem(cid,2520,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
	end
   	return 1
end
