function onUse(cid, item, frompos, item2, topos)


playerpos = getPlayerPosition(cid)
orsh1pos = {x=103, y=31, z=7}
demon2pos = {x=179, y=42, z=7}
demon3pos = {x=136, y=42, z=7}
demond4pos = {x=137, y=41, z=7}
firelemental5pos = {x=134, y=39, z=7}
firelemental6pos = {x=134, y=49, z=7}
firelemental7pos = {x=140, y=44, z=7}
firelemental8pos = {x=146, y=39, z=7}
firelemental9pos = {x=151, y=40, z=7}
firelemental10pos = {x=160, y=38, z=7}
if item.uid == 9002 then
queststatus = getPlayerStorageValue(cid,9002)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"orshabaal.")
player2pos = {x=295, y=39, z=7}
doTeleportThing(cid,player2pos)
doSummonCreature("Cave Rat", orsh1pos)
doSummonCreature("Cave Rat", demon2pos)
doSummonCreature("Cave Rat", demon3pos)
doSummonCreature("Cave Rat", demon4pos)
doSummonCreature("Cave Rat", firelemental5pos)
doSummonCreature("Rat", firelemental6pos)
doSummonCreature("Rat", firelemental7pos)
doSummonCreature("Rat", firelemental8pos)
doSummonCreature("Rat", firelemental9pos)
doSummonCreature("Rat", firelemental10pos)
doTeleportThing(cid,playerpos)
doSendMagicEffect(topos,12)
setPlayerStorageValue(cid,9002,1000)
else
doPlayerSendTextMessage(cid,22,"Nothing happens.")
end
return 0
end
return 1
end
