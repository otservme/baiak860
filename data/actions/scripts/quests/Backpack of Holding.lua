function onUse(cid, item, frompos, item2, topos)
if item.uid == 10003 then
queststatus = getPlayerStorageValue(cid,20001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma Backpack of Holding!.")
doPlayerAddItem(cid,2365,1 )
setPlayerStorageValue(cid,20001,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 