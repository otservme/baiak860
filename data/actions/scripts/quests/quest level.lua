function onUse(cid, item, frompos, item2, topos)

if item.uid == 9966 then
queststatus = getPlayerStorageValue(cid,99000)
if queststatus == -1 then
rand = math.random(1000,1200)
doPlayerAddHealth(cid,rand)
doPlayerAddMana(cid,rand)
doPlayerSendTextMessage(cid,22,"Você Conseguiu Exp.")
doSendAnimatedText(getPlayerPosition(cid),"EXP!", TEXTCOLOR_RED)
doPlayerAddExp(cid,1000000)
doSendMagicEffect(topos, 5)
setPlayerStorageValue(cid,99000,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
else
return 0
end

return 1
end