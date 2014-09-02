function onUse(cid, item, fromPosition, itemEx, toPosition)

newnPosition = {x=22, y=112, z=8}
if getPlayerStorageValue(cid,15005) == 8 then
doTeleportThing(cid,newnPosition)
doSendMagicEffect(newnPosition,10)
else
return 0
end

return 1
end