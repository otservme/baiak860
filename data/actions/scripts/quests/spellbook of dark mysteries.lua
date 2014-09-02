function onUse(cid, item, frompos, item2, topos)
if item.uid == 10010 then
queststatus = getPlayerStorageValue(cid,50001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um Spellbook of Dark Mysteries!.")
doPlayerAddItem(cid,8918,1 )
setPlayerStorageValue(cid,50001,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 