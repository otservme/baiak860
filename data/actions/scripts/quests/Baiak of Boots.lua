function onUse(cid, item, frompos, item2, topos)
if item.uid == 10019 then
queststatus = getPlayerStorageValue(cid,60001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um(a) Baiak of Boots!.")
doPlayerAddItem(cid,9931,1 )
setPlayerStorageValue(cid,60001,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 