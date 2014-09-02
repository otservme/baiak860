function onUse(cid, item, frompos, item2, topos)


playerpos = getPlayerPosition(cid)
orsh1pos = {x=236, y=80, z=7}
demon2pos = {x=237, y=84, z=7}
demon3pos = {x=228, y=87, z=7}
demond4pos = {x=224, y=95, z=7}
firelemental5pos = {x=246, y=93, z=7}
firelemental6pos = {x=246, y=94, z=7}
firelemental7pos = {x=238, y=85, z=7}
firelemental8pos = {x=239, y=85, z=7}
firelemental9pos = {x=239, y=86, z=7}
firelemental10pos = {x=241, y=115, z=7}
if item.uid == 9010 then
queststatus = getPlayerStorageValue(cid,9010)
if queststatus == -1 or queststatus == 0 then
doPlayerSay(cid,"/B Ancient Scarabs in Desert!")
player2pos = {x=295, y=39, z=7}
doTeleportThing(cid,player2pos)
doSummonCreature("Ancient Scarab", orsh1pos)
doSummonCreature("Ancient Scarab", demon2pos)
doSummonCreature("Ancient Scarab", demon3pos)
doSummonCreature("Larva", demon4pos)
doSummonCreature("Larva", firelemental5pos)
doSummonCreature("Larva", firelemental6pos)
doSummonCreature("Ancient Scarab", firelemental7pos)
doSummonCreature("Scarab", firelemental8pos)
doSummonCreature("Scarab", firelemental9pos)
doSummonCreature("Ancient Scarab", firelemental10pos)
doTeleportThing(cid,playerpos)
doSendMagicEffect(topos,12)
setPlayerStorageValue(cid,9010,1000)
else
doPlayerSendTextMessage(cid,22,"Nothing happens.")
end
return 0
end
return 1
end
