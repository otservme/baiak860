-- Paladin Vocation Teleport --
function onUse(cid, item, frompos, item2, topos)
if item.uid == 8002 and item.itemid == 1945 then

temple1pos = {x=1000, y=1000, z=7}
doPlayerSetMasterTown(cid, 1, temple1pos, "Enigma City")

player1pos = {x=533, y=530, z=6, stackpos=253}
player1 = getThingfromPos(player1pos)

player1level = getPlayerLevel(player1.uid)

voclevel = 8

if player1level >= voclevel then

nplayer1pos = {x=1000, y=1000, z=7}

doSendMagicEffect(player1pos,2)

doTeleportThing(player1.uid,nplayer1pos)

doSendMagicEffect(nplayer1pos,10)

if getPlayerVocation(cid) == 0 then
doPlayerSetVocation(cid, getPlayerVocation(cid)+3)
doPlayerSendTextMessage(cid, 22, "You have now become a paladin.")
else
doPlayerSendCancel(cid,"You already have a vocation.")
end

elseif item.uid == 8002 and item.itemid == 1946 then
end
else
return 0
end

return 1
end