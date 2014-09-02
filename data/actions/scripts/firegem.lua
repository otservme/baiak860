function onUse(cid, item, frompos, item2, topos)

if doPlayerRemoveItem(cid,2147,1) == 1 then
coins_uid = doPlayerAddItem(cid,7760,1)
doPlayerSendTextMessage(cid,22,"Você encantou um Ruby.")
doSendMagicEffect(topos,12)
else
doPlayerSendTextMessage(cid,22,"Você precisa de um Small Ruby para poder encantar.")
end

return 1
end