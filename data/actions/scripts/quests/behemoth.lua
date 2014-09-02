function onUse(cid, item, frompos, item2, topos)

	if item.uid == 60057 then
		if getPlayerStorageValue(cid,60057) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Guardian Halberd.")
			doPlayerAddItem(cid,2427,1)
			setPlayerStorageValue(cid,60057,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 60058 then
		if getPlayerStorageValue(cid,60058) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Demon Shield.")
			doPlayerAddItem(cid,2520,1)
			setPlayerStorageValue(cid,60058,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 60059 then
		if getPlayerStorageValue(cid,60059) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Golden Armor.")
			doPlayerAddItem(cid,2466,1)
			setPlayerStorageValue(cid,60059,1)
		else
			doPlayerSendTextMessage(cid,25,"The is empty.")
		end

	elseif item.uid == 60060 then
		if getPlayerStorageValue(cid,60060) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2171,1)
			doAddContainerItem(bag,2168,1)
			doAddContainerItem(bag,2124,1)
			doAddContainerItem(bag,2145,3)
			doAddContainerItem(bag,2146,4)
			setPlayerStorageValue(cid,60060,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end	
	end
	return TRUE
end