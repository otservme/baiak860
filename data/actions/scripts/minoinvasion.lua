function onUse(cid, item, frompos, item2, topos)


playerpos = getPlayerPosition(cid)
minoguard1pos = {x=103, y=31, z=7}
minoguard2pos = {x=179, y=42, z=7}
minoguard3pos = {x=136, y=42, z=7}
minoguard4pos = {x=137, y=41, z=7}
minoguard5pos = {x=134, y=39, z=7}
minoguard6pos = {x=134, y=49, z=7}
minoguard7pos = {x=140, y=44, z=7}
minoarcher8pos = {x=146, y=39, z=7}
minoarcher9pos = {x=151, y=40, z=7}
minomage10pos = {x=160, y=38, z=7}
if item.uid == 9006 then
queststatus = getPlayerStorageValue(cid,9006)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Invasion of minotaurs.")
player2pos = {x=295, y=39, z=7}
doTeleportThing(cid,player2pos)
doSummonCreature("General Murius", minoguard1pos)
doSummonCreature("The Horned Fox", minoguard2pos)
doSummonCreature("Minotaur Guard", minoguard3pos)
doSummonCreature("Minotaur Guard", minoguard4pos)
doSummonCreature("Minotaur Guard", minoguard5pos)
doSummonCreature("Minotaur Guard", minoguard6pos)
doSummonCreature("Minotaur Guard", minoguard7pos)
doSummonCreature("Minotaur Archer", minoarcher8pos)
doSummonCreature("Minotaur Archer", minoarcher9pos)
doSummonCreature("Minotaur Mage", minomage10pos)
doTeleportThing(cid,playerpos)
doSendMagicEffect(topos,12)
setPlayerStorageValue(cid,9006,1000)
else
doPlayerSendTextMessage(cid,22,"Nothing happens.")
end
return 0
end
return 1
end
