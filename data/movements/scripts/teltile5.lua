function onStepIn(cid, item, frompos, item2, topos)

if item.uid == 11055 then

newpos = {x=203, y=244, z=8}
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,33)
setPlayerStorageValue(cid,11055,2)


end

end