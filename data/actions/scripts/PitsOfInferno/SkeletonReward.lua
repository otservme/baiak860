function onUse(cid, item, frompos, item2, topos)

if item.uid == 10282 then
queststatus = getPlayerStorageValue(cid, 10282)

if queststatus == -1 then
doPlayerSendTextMessage(cid, 22, 'You have found a Pirate Backpack.')
item1 = doPlayerAddItem(cid, 5926, 1)
doPlayerSendTextMessage(cid, 22, 'You have found a Ceremonial Ankh.')
item2 = doPlayerAddItem(cid, 6561, 1)
doPlayerSendTextMessage(cid, 22, 'You have found a Death Ring.')
item3 = doPlayerAddItem(cid, 6300, 1)
doPlayerSendTextMessage(cid, 22, 'You have found a Life Ring.')
item4 = doPlayerAddItem(cid, 2168, 1)
doPlayerSendTextMessage(cid, 22, 'You have found 5 White Pearls.')
item5 = doPlayerAddItem(cid, 2143, 5)
doPlayerSendTextMessage(cid, 22, 'You have found 2 Soul Orbs.')
item6 = doPlayerAddItem(cid, 5944, 2)
doPlayerSendTextMessage(cid, 22, 'You have found 11 Platinum Coins.')
item7 = doPlayerAddItem(cid, 2152, 11)
setPlayerStorageValue(cid, 10282, 1)
else
doPlayerSendTextMessage(cid,22,"The corpse is empty.")
end
return 1
else
return 0
end
end

--Bandits Quest

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 10282 then
		queststatus = getPlayerStorageValue(cid,10282)
		if queststatus == -1 then
			bp = doPlayerAddItem(cid,5926,1) --pirate backpack
			doAddContainerItem(bp,6561,1) --Ceremonial Ankh
			doAddContainerItem(bp,6300,1) --Death Ring
			doAddContainerItem(bp,2168,1) --Life Ring
			doAddContainerItem(bp,2143,5) --White Pearls
			doAddContainerItem(bp,5944,2) --Soul Orbs
			doAddContainerItem(bp,2152,11) --Platinum Coins
			setPlayerStorageValue(cid,10282,1)
			doSendMagicEffect(frompos,12)
			doPlayerSendTextMessage(cid,22,'You have found something in the skeleton.')
	elseif queststatus == 1 then	
		doPlayerSendTextMessage(cid,22,'The corpse is empty.')
end
return 1
else
return 0
end
end