function onUse(cid, item, frompos, item2, topos)

playerpos = getPlayerPosition(cid)
novapos = {x=61, y=121, z=7}

if item.itemid == 2719 then
getThingfromPos(playerpos)
doSendMagicEffect(playerpos,2)
doTeleportThing(cid,novapos)
doSendMagicEffect(novapos,10)
doPlayerSendTextMessage(cid,22, 'Welcome to the Demon Oak Chalengerrr!')
end
return 1
end