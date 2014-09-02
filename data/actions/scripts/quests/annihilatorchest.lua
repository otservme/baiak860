
if item.uid == 5006 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
doPlayerAddItem(cid,2494,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5007 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
doPlayerAddItem(cid,2400,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5008 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
doPlayerAddItem(cid,2431,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5009 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a Thunder Hammer.")
doPlayerAddItem(cid,2421,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end