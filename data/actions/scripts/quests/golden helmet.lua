function onUse(cid, item, frompos, item2, topos)
if item.uid == 10008 then
queststatus = getPlayerStorageValue(cid,50000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um Golden Helmet!.")
doPlayerAddItem(cid,2471,1 )
setPlayerStorageValue(cid,50000,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 