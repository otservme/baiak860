-- Paladin Vocation Teleport --
function onUse(cid, item, frompos, item2, topos)

if item.uid == 6102 and item.itemid == 1945 then

player1pos = {x=1205, y=1619, z=10, stackpos=253}
player1 = getThingfromPos(player1pos)

player1level = getPlayerLevel(player1.uid)

voclevel = 100

if player1level >= voclevel then

nplayer1pos = {x=1000, y=1000, z=7}

doSendMagicEffect(player1pos,2)

doTeleportThing(player1.uid,nplayer1pos)

doSendMagicEffect(nplayer1pos,10)

if getPlayerVocation(cid) < 8 then
doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
doPlayerSendTextMessage(cid, 22, "You have now got your second promotion.")
else
doPlayerSendCancel(cid,"You already have gotten your second promotion.")
end

elseif item.uid == 6102 and item.itemid == 1946 then
end
else
return 0
end

return 1
end