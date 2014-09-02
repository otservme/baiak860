function onStepIn(cid, item, frompos, item2, topos)

if item.uid == 11051 then

newpos = {x=403, y=76, z=15}
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,66)
setPlayerStorageValue(cid,11051,2)


end

end