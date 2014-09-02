function onStepIn(cid, item, frompos, item2, topos)

if item.uid == 11052 then

newpos = {x=423, y=76, z=15}
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,66)
setPlayerStorageValue(cid,11052,2)


end

end