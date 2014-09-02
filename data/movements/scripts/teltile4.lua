function onStepIn(cid, item, frompos, item2, topos)

if item.uid == 11054 then

newpos = {x=174, y=136, z=5}
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,66)
setPlayerStorageValue(cid,11054,2)


end

end