function onUse(cid, item, frompos, item2, topos)
if item.uid == 10020 then
queststatus = getPlayerStorageValue(cid,60002)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um(a) Baiak Armor!.")
doPlayerAddItem(cid,8892,1 )
setPlayerStorageValue(cid,60002,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 