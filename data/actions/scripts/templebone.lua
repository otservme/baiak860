-- Sorcerer Vocation Teleport --
function onUse(cid, item, frompos, item2, topos)
if item.uid == 5100 and item.itemid == 1945 then

temple1pos = {x=1140, y=1467, z=7}
doPlayerSetMasterTown(cid, 1, temple1pos, "BoneTown")

player1pos = {x=1140, y=1468, z=8, stackpos=253}
player1 = getThingfromPos(player1pos)

player1level = getPlayerLevel(player1.uid)

voclevel = 8

if player1level >= voclevel then

nplayer1pos = {x=1140, y=1467, z=7}

doSendMagicEffect(player1pos,2)

doTeleportThing(player1.uid,nplayer1pos)

doSendMagicEffect(nplayer1pos,10)

elseif item.uid == 5100 and item.itemid == 1946 then
end
else
return 0
end

return 1
end