function onUse(cid, item, frompos, item2, topos)
if item.uid == 10000 then
queststatus = getPlayerStorageValue(cid,20000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma Avenger!.")
doPlayerAddItem(cid,6528,1 )
setPlayerStorageValue(cid,20000,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 