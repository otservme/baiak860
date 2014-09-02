function onStepOut(cid, item, position, fromPosition)

newnPosition = {x=61, y=121, z=7}
if getPlayerStorageValue(cid,15005) == 3 then
doTeleportThing(cid,newnPosition)
doSendMagicEffect(newnPosition,10)
else
return 0
end

return 1
end