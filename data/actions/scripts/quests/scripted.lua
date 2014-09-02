function onUse(cid, item, frompos, item2, topos)

	if item.uid == 60035 then
		if getPlayerStorageValue(cid,60035) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a book.")
			local book = doPlayerAddItem(cid,2325,1)
			doSetItemText(book,"Hardek *\nBozo *\nSam ****\n\nOswald\nPartos ***\nQuentin *\nTark ***\nHarsky ***\nStutch *\nFerumbras *\nFrodo **\nNoodles ****")
			setPlayerStorageValue(cid,60035,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60036 then
		if getPlayerStorageValue(cid,60036) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2146,2)
			doAddContainerItem(bag,2546,30)
			setPlayerStorageValue(cid,60036,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60037 then
		if getPlayerStorageValue(cid,60037) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2545,60)
			doAddContainerItem(bag,2456,1)
			setPlayerStorageValue(cid,60037,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60038 then
		if getPlayerStorageValue(cid,60038) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2530,1)
			doAddContainerItem(bag,2480,1)
			setPlayerStorageValue(cid,60038,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60039 then
		if getPlayerStorageValue(cid,60039) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a katana.")
			doPlayerAddItem(cid,2412,1)
			setPlayerStorageValue(cid,60039,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60040 then
		if getPlayerStorageValue(cid,60040) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a viking helmet.")
			doPlayerAddItem(cid,2412,1)
			setPlayerStorageValue(cid,60040,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60044 then
		if getPlayerStorageValue(cid,60044) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2148,50)
			doAddContainerItem(bag,2111,4)
			doAddContainerItem(bag,1294,5)
			setPlayerStorageValue(cid,60044,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60045 then
		if getPlayerStorageValue(cid,60045) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2642,1)
			doAddContainerItem(bag,2563,1)
			doAddContainerItem(bag,2006,6)
			setPlayerStorageValue(cid,60045,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60046 then
		if getPlayerStorageValue(cid,60046) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a banana.")
			doPlayerAddItem(cid,2676,1)
			setPlayerStorageValue(cid,60046,1)
		else
			doPlayerSendTextMessage(cid,25,"The banana palm is empty.")
		end
	elseif item.uid == 60052 then
		if getPlayerStorageValue(cid,60052) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a blood herb.")
			doPlayerAddItem(cid,2798,1)
			setPlayerStorageValue(cid,60052,1)
		else
			doPlayerSendTextMessage(cid,25,"The dead tree is empty.")
		end
	elseif item.uid == 60053 then
		if getPlayerStorageValue(cid,60053) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found 2 elephant tusks.")
			doPlayerAddItem(cid,3956,2)
			setPlayerStorageValue(cid,60053,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end
	elseif item.uid == 60056 then
		if getPlayerStorageValue(cid,60056) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a bag.")
			local bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2214,1)
			doAddContainerItem(bag,2201,1)
			doAddContainerItem(bag,2145,7)
			setPlayerStorageValue(cid,60056,1)
		else
			doPlayerSendTextMessage(cid,25,"It is empty.")
		end

	end
	return TRUE
end