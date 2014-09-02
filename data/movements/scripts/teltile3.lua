function onStepIn(cid, item, frompos, item2, topos)

if item.uid == 11053 then

newpos = {x=174, y=136, z=5}
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,66)
setPlayerStorageValue(cid,11053,2)


end

end