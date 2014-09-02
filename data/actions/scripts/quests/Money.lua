function onUse(cid, item, frompos, item2, topos)
if item.uid == 10004 then
queststatus = getPlayerStorageValue(cid,20002)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou 100k !.")
doPlayerAddItem(cid,6529,100 )
setPlayerStorageValue(cid,20002,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 