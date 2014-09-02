-- dhq lever

function onUse(cid, item, frompos, item2, topos)
if item.uid == 5051 and item.itemid == 1945 then

player1pos = {x=1467, y=1595, z=11, stackpos=253}
player1 = getThingfromPos(player1pos)

player1level = getPlayerLevel(player1.uid)

questlevel = 100

if player1level >= questlevel then

nplayer1pos = {x=1464, y=1589, z=12}

doSendMagicEffect(player1pos,2)

doTeleportThing(player1.uid,nplayer1pos)

doSendMagicEffect(nplayer1pos,10)

doTransformItem(item.uid,item.itemid+1)
else
doPlayerSendCancel(cid,"You dont have enough level for this quest.")
end

elseif item.uid ==5051 and item.itemid == 1946 then
if getPlayerAccess(cid) - 0 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
else
return 0
end

return 1
end