--script on hallowed axe--
function onUse(cid,item,frompos,item2,topos)
number = math.random(1,100)
chance = 95
minItem = 1
maxItem = 3
mind = 300
maxd = 500


if chance > 100 or chance == 0 then
chance = 100
end
-----------------------------------------------------------------------------------------
-- Variables
leftspikedballpos11 = {x=32714, y=32353, z=7}
leftspikedballpos12 = {x=32714, y=32353, z=7}
leftspikedballpos13 = {x=32714, y=32353, z=7}
leftspikedballpos14 = {x=32714, y=32353, z=7}
leftspikedballpos21 = {x=32714, y=32353, z=7}
leftspikedballpos22 = {x=32714, y=32353, z=7}
leftspikedballpos31 = {x=32714, y=32353, z=7}
leftspikedballpos32 = {x=32714, y=32353, z=7}

birdpos11 = {x=32714, y=32353, z=7}
birdpos12 = {x=32714, y=32353, z=7}
birdpos13 = {x=32714, y=32353, z=7}
birdpos14 = {x=32714, y=32353, z=7}
birdpos21 = {x=32714, y=32353, z=7}
birdpos22 = {x=32714, y=32353, z=7}
birdpos31 = {x=32714, y=32353, z=7}
birdpos32 = {x=32714, y=32353, z=7}

rightspikedballpos11 = {x=32714, y=32353, z=7}
rightspikedballpos12 = {x=32714, y=32353, z=7}
rightspikedballpos13 = {xx=32714, y=32353, z=7}
rightspikedballpos14 = {x=32714, y=32353, z=7}
rightspikedballpos21 = {x=32714, y=32353, z=7}
rightspikedballpos22 = {x=32714, y=32353, z=7}
rightspikedballpos31 = {x=32714, y=32353, z=7}
rightspikedballpos32 = {x=32714, y=32353, z=7}

faceoftreepos11 = {x=32714, y=32353, z=7}
faceoftreepos12 = {x=32714, y=32353, z=7}
faceoftreepos13 = {x=32714, y=32353, z=7}
faceoftreepos14 = {x=32714, y=32353, z=7}
faceoftreepos21 = {x=32714, y=32353, z=7}
faceoftreepos22 = {x=32714, y=32353, z=7}
faceoftreepos31 = {x=32714, y=32353, z=7}
faceoftreepos32 = {x=32714, y=32353, z=7}
-----------------------------------------------------------------------------------------

--------------------Demon oak(The left spiked ball)--------------------
if item2.itemid == 8289 then
leftspikedball = getPlayerStorageValue(cid,20000)
if leftspikedball == -1 or leftspikedball == 0 then
if number <= chance then
surp = math.random(minItem, maxItem)
if surp == 1 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("bone beast",leftspikedballpos11)
doSummonCreature("bone beast",leftspikedballpos12)
doSummonCreature("bone beast",leftspikedballpos13)
doSummonCreature("bone beast",leftspikedballpos14)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("lich",leftspikedballpos11)
doSummonCreature("lich",leftspikedballpos12)
doSummonCreature("lich",leftspikedballpos13)
doSummonCreature("lich",leftspikedballpos14)
end
end
if surp == 2 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("lich",leftspikedballpos21)
doSummonCreature("giant spider",leftspikedballpos22)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("grim reaper",leftspikedballpos21)
doSummonCreature("dark torturer",leftspikedballpos22)
end
end
if surp == 3 then
if number <= 50 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("undead dragon",leftspikedballpos31)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("grim reaper",leftspikedballpos31)
doSummonCreature("dark torturer",leftspikedballpos32)
end
end

else
doSendMagicEffect(topos,2)
setPlayerStorageValue(cid,20000,1)
end
else
doSendMagicEffect(topos,2)
end
return 1
end

--------------------Demon oak(The bird)--------------------
if item2.itemid == 8288 then
bird = getPlayerStorageValue(cid,20001)
if bird == -1 or bird == 0 then
if number <= chance then
surp = math.random(minItem, maxItem)
if surp == 1 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("banshee",birdpos11)
doSummonCreature("banshee",birdpos12)
doSummonCreature("banshee",birdpos13)
doSummonCreature("banshee",birdpos14)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("braindeath",birdpos11)
doSummonCreature("braindeath",birdpos12)
doSummonCreature("braindeath",birdpos13)
doSummonCreature("braindeath",birdpos14)
end
end
if surp == 2 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("demon",birdpos21)
doSummonCreature("diabolic imp",birdpos22)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("blightwalker",birdpos21)
doSummonCreature("betrayed wraith",birdpos22)
end
end
if surp == 3 then
if number <= 50 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("undead dragon",birdpos31)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("hand of cursed fate",birdpos31)
doSummonCreature("dark torturer",birdpos32)
end
end

else
doSendMagicEffect(topos,2)
setPlayerStorageValue(cid,20001,1)
end
else
doSendMagicEffect(topos,2)
end
return 1
end

--------------------Demon oak(The right spiked ball)--------------------
if item2.itemid == 8290 then
rightspikedball = getPlayerStorageValue(cid,20002)
if rightspikedball == -1 or rightspikedball == 0 then
if number <= chance then
surp = math.random(minItem, maxItem)
if surp == 1 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("lich",rightspikedballpos11)
doSummonCreature("lich",rightspikedballpos12)
doSummonCreature("lich",rightspikedballpos13)
doSummonCreature("lich",rightspikedballpos14)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("giant spider",rightspikedballpos11)
doSummonCreature("giant spider",rightspikedballpos12)
doSummonCreature("giant spider",rightspikedballpos13)
doSummonCreature("giant spider",rightspikedballpos14)
end
end
if surp == 2 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("dark torturer",rightspikedballpos21)
doSummonCreature("demon",rightspikedballpos22)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("diabolic imp",rightspikedballpos21)
doSummonCreature("diabolic imp",rightspikedballpos22)
end
end
if surp == 3 then
if number <= 50 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("hand of cursed fate",rightspikedballpos31)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("grim reaper",rightspikedballpos31)
doSummonCreature("grim reaper",rightspikedballpos32)
end
end

else
doSendMagicEffect(topos,2)
setPlayerStorageValue(cid,20002,1)
end
else
doSendMagicEffect(topos,2)
end
return 1
end

--------------------Demon oak(The face of the tree)--------------------
if item2.itemid == 8291 then
faceoftree = getPlayerStorageValue(cid,20003)
if faceoftree == -1 or faceoftree == 0 then
if number <= chance then
surp = math.random(minItem, maxItem)
if surp == 1 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("vampire",faceoftreepos11)
doSummonCreature("vampire",faceoftreepos12)
doSummonCreature("vampire",faceoftreepos13)
doSummonCreature("vampire",faceoftreepos14)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("diabolic imp",faceoftreepos11)
doSummonCreature("diabolic imp",faceoftreepos12)
doSummonCreature("diabolic imp",faceoftreepos13)
doSummonCreature("diabolic imp",faceoftreepos14)
end
end
if surp == 2 then
if number <= 75 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("demon",faceoftreepos21)
doSummonCreature("grim reaper",faceoftreepos22)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("hand of cursed fate",faceoftreepos21)
doSummonCreature("hand of cursed fate",faceoftreepos22)
end
end
if surp == 3 then
if number <= 50 then
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("undead dragon",faceoftreepos31)
doSummonCreature("hand of cursed fate",faceoftreepos32)
else
doSendMagicEffect(topos,0)
doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -290, -510, CONST_ME_BIGPLANTS)
doSummonCreature("grim reaper",faceoftreepos31)
doSummonCreature("hand of cursed fate",faceoftreepos32)
end
end

else
doSendMagicEffect(topos,2)
setPlayerStorageValue(cid,20003,1)
end
else
doSendMagicEffect(topos,2)
end
return 1
end

return 0
end
