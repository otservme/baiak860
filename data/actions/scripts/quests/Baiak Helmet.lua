function onUse(cid, item, frompos, item2, topos)
if item.uid == 10018 then
queststatus = getPlayerStorageValue(cid,60000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um(a) Baiak Helmet!.")
doPlayerAddItem(cid,7957,1 )
setPlayerStorageValue(cid,60000,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 