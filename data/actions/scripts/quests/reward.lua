--Function by Ta4e 07/11/2008--
--90% Arena quest in tibia rl--
--Version 4.0--

function onUse(cid, item, frompos, item2, topos)

--Storages values when you win a reward--
warlord = 5012
scrapper = 5011
greenhorn = 5010

--Caution when modify--
--------------------------------------------------------------------------------------------------

--ARENA warlord--
if item.uid == 5300 then
queststatus = getPlayerStorageValue(cid,warlord)
if queststatus == -1 then
   if getPlayerFreeCap(cid) >= 39.00 then
doPlayerSendTextMessage(cid,24,"You have found a blessed sceptre.")
doPlayerAddItem(cid,7429,1)
setPlayerStorageValue(cid,warlord,1)
else
     doPlayerSendTextMessage(cid,24,"You have found a blessed sceptre. Weighing 39.00 oz it is too heavy.")
   end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5301 then
queststatus = getPlayerStorageValue(cid,warlord)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 92.00 then
doPlayerSendTextMessage(cid,24,"You have found a Royal Axe.")
doPlayerAddItem(cid,7434,1)
setPlayerStorageValue(cid,warlord,1)
else
doPlayerSendTextMessage(cid,24,"You have found a Royal Axe. Weighing 92.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5302 then
queststatus = getPlayerStorageValue(cid,warlord)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 50.00 then
doPlayerSendTextMessage(cid,24,"You have found a justice seeker.")
doPlayerAddItem(cid,7390,1)
setPlayerStorageValue(cid,warlord,1)
else
doPlayerSendTextMessage(cid,24,"You have found a justice seeker. Weighing 50.00  oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5303 then
queststatus = getPlayerStorageValue(cid,warlord)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 20.00 then
doPlayerSendTextMessage(cid,24,"You have found a present.")
container = doPlayerAddItem(cid,1990,1)
doAddContainerItem(container, 6558, 1) --panda
doAddContainerItem(container, 6574, 1) --chocolate
doAddContainerItem(container, 6569,10) --candy
doAddContainerItem(container, 7372, 1) --ice cream
setPlayerStorageValue(cid,warlord,1)
else
doPlayerSendTextMessage(cid,24,"You have found a present. Weighing 20.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5304 then
queststatus = getPlayerStorageValue(cid,warlord)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 110.00 then
doPlayerSendTextMessage(cid,24,"You have found a backpack.")
container = doPlayerAddItem(cid,7342,1)
doAddContainerItem(container, 2268, 50)
doAddContainerItem(container, 2273, 50)
doAddContainerItem(container, 7440, 1)
doAddContainerItem(container, 7439, 1)
doAddContainerItem(container, 6529, 100)
setPlayerStorageValue(cid,warlord,1)
else
doPlayerSendTextMessage(cid,24,"You have found a backpack. Weighing 110.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end



--ARENA scrapper--
elseif item.uid == 5305 then
queststatus = getPlayerStorageValue(cid,scrapper)
if queststatus == -1 then
   if getPlayerFreeCap(cid) >= 78.00 then
doPlayerSendTextMessage(cid,24,"You have found a Cranial Basher.")
doPlayerAddItem(cid,4715,1)
setPlayerStorageValue(cid,scrapper,1)
else
     doPlayerSendTextMessage(cid,24,"You have found a Cranial Basher. Weighing 78.00 oz it is too heavy.")
   end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5306 then
queststatus = getPlayerStorageValue(cid,scrapper)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 61.00 then
doPlayerSendTextMessage(cid,24,"You have found a heroic axe.")
doPlayerAddItem(cid,7389,1)
setPlayerStorageValue(cid,scrapper,1)
else
doPlayerSendTextMessage(cid,24,"You have found a heroic axe. Weighing 61.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5307 then
queststatus = getPlayerStorageValue(cid,scrapper)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 35.00 then
doPlayerSendTextMessage(cid,24,"You have found a mystic blade.")
doPlayerAddItem(cid,7384,1)
setPlayerStorageValue(cid,scrapper,1)
else
doPlayerSendTextMessage(cid,24,"You have found a mystic blade. Weighing 35.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5308 then
queststatus = getPlayerStorageValue(cid,scrapper)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 15.00 then
doPlayerSendTextMessage(cid,24,"You have found a present.")
container = doPlayerAddItem(cid,1990,1)
doAddContainerItem(container, 7184, 1)
doAddContainerItem(container, 6574, 1) --chocolate
doAddContainerItem(container, 6569,10) --candy
doAddContainerItem(container, 7372, 1) --ice cream
setPlayerStorageValue(cid,scrapper,1)
else
doPlayerSendTextMessage(cid,24,"You have found a present. Weighing 15.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end


elseif item.uid == 5309 then
queststatus = getPlayerStorageValue(cid,scrapper)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 158.00 then
doPlayerSendTextMessage(cid,24,"You have found a backpack.")
container = doPlayerAddItem(cid,7342,1)
doAddContainerItem(container, 2304, 50)
doAddContainerItem(container, 2311, 50)
doAddContainerItem(container, 7365, 100)
doAddContainerItem(container, 2457, 100)
setPlayerStorageValue(cid,scrapper,1)
else
doPlayerSendTextMessage(cid,24,"You have found a backpack. Weighing 158.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end



--ARENA greenhorn--
elseif item.uid == 5310 then
queststatus = getPlayerStorageValue(cid,greenhorn)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 158.00 then
doPlayerSendTextMessage(cid,24,"You have found a backpack.")
container = doPlayerAddItem(cid,7342,1)
doAddContainerItem(container, 7364, 100)
doAddContainerItem(container, 7365, 100)
setPlayerStorageValue(cid,greenhorn,1)
else
doPlayerSendTextMessage(cid,24,"You have found a backpack. Weighing 158.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end


elseif item.uid == 5311 then
queststatus = getPlayerStorageValue(cid,greenhorn)
if queststatus == -1 then
   if getPlayerFreeCap(cid) >= 54.00 then
doPlayerSendTextMessage(cid,24,"You have found a orcish maul.")
doPlayerAddItem(cid,7392,1)
setPlayerStorageValue(cid,greenhorn,1)
else
  doPlayerSendTextMessage(cid,24,"You have found a orcish maul. Weighing 54.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5312 then
queststatus = getPlayerStorageValue(cid,greenhorn)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 73.80 then
doPlayerSendTextMessage(cid,24,"You have found a HeadChopper.")
doPlayerAddItem(cid,7380,1)
setPlayerStorageValue(cid,greenhorn,1)
else
 doPlayerSendTextMessage(cid,24,"You have found a HeadChopper. Weighing 73.80 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5313 then
queststatus = getPlayerStorageValue(cid,greenhorn)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 59.00 then
doPlayerSendTextMessage(cid,24,"You have found a Blacksteel Sword.")
doPlayerAddItem(cid,7406,1)
setPlayerStorageValue(cid,greenhorn,1)
else
  doPlayerSendTextMessage(cid,24,"You have found a Blacksteel Sword. Weighing 59.00  oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end

elseif item.uid == 5314 then
queststatus = getPlayerStorageValue(cid,greenhorn)
if queststatus == -1 then
if getPlayerFreeCap(cid) >= 18.00 then
doPlayerSendTextMessage(cid,24,"You have found a present.")
container = doPlayerAddItem(cid,1990,1)
doAddContainerItem(container, 2114, 1)
doAddContainerItem(container, 6570, 1)
doAddContainerItem(container, 6574, 1)
doAddContainerItem(container, 2668,10)
doAddContainerItem(container, 7372, 1)
setPlayerStorageValue(cid,greenhorn,1)
else
doPlayerSendTextMessage(cid,24,"You have found a present. Weighing 18.00 oz it is too heavy.")
end
else
doPlayerSendTextMessage(cid,24,"The chest is empty.")
end


end
return 1
end