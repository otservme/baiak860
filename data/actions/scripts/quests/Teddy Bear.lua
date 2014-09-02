function onUse(cid, item, frompos, item2, topos)
if item.uid == 10007 then
queststatus = getPlayerStorageValue(cid,20005)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um Teddy Bear!.")
doPlayerAddItem(cid,2361,1 )
setPlayerStorageValue(cid,20005,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 