function onUse(cid, item, frompos, item2, topos)
if item.uid == 10015 then
queststatus = getPlayerStorageValue(cid,50001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma Royal Crossbow!.")
doPlayerAddItem(cid,8851,1 )
setPlayerStorageValue(cid,50001,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 