function onUse(cid, item, frompos, item2, topos)

if doPlayerRemoveItem(cid,2150,1) == 1 then
coins_uid = doPlayerAddItem(cid,7762,1)
doPlayerSendTextMessage(cid,22,"Você encantou uma Amethyst.")
doSendMagicEffect(topos,12)
else
doPlayerSendTextMessage(cid,22,"Você precisa de um Small Amethyst para poder encantar.")
end

return 1
end