function onUse(cid, item, frompos, item2, topos)

if doPlayerRemoveItem(cid,2149,1) == 1 then
coins_uid = doPlayerAddItem(cid,7761,1)
doPlayerSendTextMessage(cid,22,"Você encantou uma Esmeralda.")
doSendMagicEffect(topos,12)
else
doPlayerSendTextMessage(cid,22,"Você precisa de um Small Emerald para poder encantar.")
end

return 1
end