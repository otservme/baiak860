function onUse(cid, item, frompos, item2, topos)
if item.uid == 10005 then
queststatus = getPlayerStorageValue(cid,20003)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma Soft Boots!.")
doPlayerAddItem(cid,6132,1 )
setPlayerStorageValue(cid,20003,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 