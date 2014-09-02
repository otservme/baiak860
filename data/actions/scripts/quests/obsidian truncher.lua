function onUse(cid, item, frompos, item2, topos)
if item.uid == 10014 then
queststatus = getPlayerStorageValue(cid,50001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma obsidian truncheon!.")
doPlayerAddItem(cid,8928,1 )
setPlayerStorageValue(cid,50001,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 