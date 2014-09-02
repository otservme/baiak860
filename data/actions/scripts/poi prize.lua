function onUse(cid, item, frompos, item2, topos)
if item.uid == 22222 and item.itemid == 1945 then

player1pos = {x=382, y=336, z=10, stackpos=253}
player1 = getThingfromPos(player1pos)

if getPlayerStorageValue(cid,1234561) == 1 or getPlayerStorageValue(cid,1234562) == 1 or getPlayerStorageValue(cid,1234563) == 1 or getPlayerStorageValue(cid,1234564) == 1 or getPlayerStorageValue(cid,1234565) == 1 or getPlayerStorageValue(cid,1234566) == 1 or getPlayerStorageValue(cid,1234567) == 1 then

nplayer1pos = {x=286, y=494, z=12}

doSendMagicEffect(player1pos,2)

doTeleportThing(player1.uid,nplayer1pos)

doSendMagicEffect(nplayer1pos,10)

doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"You absorbed enough energy! You may pass.")
else
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"Sorry, but you did not absorb enough energy!")
end

elseif item.uid == 22222 and item.itemid == 1946 then
if getPlayerAccess(cid) > 3 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
else
return 0
end

return 1
end