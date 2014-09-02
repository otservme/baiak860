--Demon Oak 2.0 by Ta4e--
--Some scripts based in script of Mazen--
function effect(cid,storage,valor,topos)
    valor = getPlayerStorageValue(cid, storage)
    doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -300, -300, CONST_ME_BIGPLANTS)
    valor = valor + 1
    setPlayerStorageValue(cid, storage,valor)
    doSendMagicEffect(topos, 0)
end

function onUse(cid, item, frompos, item2, topos)

local monster1 = "Crypt Shambler"
local monster2 = "Lich"
local monster3 = "Bone beast"
local monster4 = "Banshee"
local monster5 = "Giant Spider"
local boss1 = "Blightwalker"
local boss2 = "Betrayed Wraith"
local boss3 = "Diabolic Imp"
local boss4 = "Demon"

basepos = {x=32714, y=32353, z=7}
local starting={x=32714, y=32353, z=7, stackpos=253}
local ending={x=32714, y=32353, z=7, stackpos=253}
local trash= {x=32714, y=32353, z=7}

--Alternative Monsters------------------------------------------------------------------------------------------------------------------------------------------
local altmo = 0 -- If it 0 monsters not randomize. If it 1 randomize with this \/

local altmonst1 = "braindeath"
local altmonst2 = "necromancer"
local altmonst3 = "vampire"
local altmonst4 = "giant spider"
local altmonst5 = "demon skeleton"
local altboss1  = "plaguesmith"
local altboss2  = "phantasm"
local altboss3  = "hellhound"
local altboss4  = "behemoth"

----------------------------------------------------------------------------------------------------------------------------------
    
if altmo == 1 then
    if math.random (1,5) == 1 or math.random (1,5) == 5 then
        monster1 = altmonst1
        monster2 = altmonst2
        monster5 = altmonst5
        boss1 = altboss1
        boss3 = altboss3
    else
        monster3 = altmonst3
        monster4 = altmonst4
        boss2 = altboss2
        boss4 = altboss4
    end
end
        
local fourposition1 = {x=32714, y=32353, z=7}
local fourposition2 = {x=32714, y=32353, z=7}
local fourposition3 = {x=32714, y=32353, z=7}
local fourposition4 = {x=32714, y=32353, z=7}
local modpos1 = {x=32714, y=32353, z=7}
local modpos2 = {x=32714, y=32353, z=7}
local modpos3 = {x=32714, y=32353, z=7}
local threeposition1 = {x=32714, y=32353, z=7}
local threeposition2 = {x=32714, y=32353, z=7}
local threeposition3 = {x=32714, y=32353, z=7}
local twopos ={x=32714, y=32353, z=7}
local twopos1 = {x=32714, y=32353, z=7}
local doublepos = {x=32714, y=32353, z=7}
local leftpos = {x=32714, y=32353, z=7}
local crepos = {x=32714, y=32353, z=7}
local gopos = {x=32714, y=32353, z=7}
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local gtotal = getPlayerStorageValue(cid, 15005)
local gcorvo = getPlayerStorageValue(cid, 15001)
local gleft = getPlayerStorageValue(cid, 15002)
local gright = getPlayerStorageValue(cid, 15003)
local gface = getPlayerStorageValue(cid, 15004)
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}

    if item2.itemid == 2717 and item2.uid == 32193 then
        if getPlayerLevel(cid) >= 120  then
            players=0
            totalmonsters=0
            monster = {}
                repeat
                    creature= getThingfromPos(checking)
                        if creature.itemid > 0 then
                            if getPlayerAccess(creature.uid) == 0 then
                                players=players+1
                            end
                                if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
                                    totalmonsters=totalmonsters+1
                                    monster[totalmonsters]=creature.uid
                                end
                        end
                                checking.x=checking.x+1
                                    if checking.x>ending.x then
                                        checking.x=starting.x
                                        checking.y=checking.y+1
                                    end
                until checking.y>ending.y
                                    if players==0 then
                                        current=0
                                        repeat
                                            current=current+1
                                            doTeleportThing(monster[current],trash)
                                        until current>=totalmonsters
        doTeleportThing(cid, topos, 0)
        setPlayerMultiplyStorageValues(cid,{15001,15002,15003,15004},1)
        doTransformItem(item2.uid, 3669)
        doCreateTeleport(1387, gopos, crepos)
        local getrem1 = getThingfromPos({x=basepos.x-3, y=basepos.y-7, z=7, stackpos = 3})
        doSetItemActionId(getrem1.uid,32195)
                                    end
        else
            doPlayerSendTextMessage(cid, "You need level 120 to enter in arena.", result)
        end

    elseif item2.itemid == 8288 then
        if gcorvo <10 then
            effect(cid,15001,gcorvo,topos)
                if gcorvo == 3 then
                    doSummonCreatures(monster1, {fourposition1,fourposition2,fourposition3,fourposition4})
                elseif gcorvo == 5 then
                    doSummonCreatures(monster2, {threeposition1,threeposition2,threeposition3})
                elseif gcorvo == 7 then
                    doSummonCreature(boss1, fourposition3)
                elseif gcorvo == 9 then
                    gtotal = gtotal + 1
                    setPlayerStorageValue(cid, 15005,gtotal)
                end
        else
            doSendMagicEffect(topos, 2)
        end

    elseif item2.itemid == 8289 then
        if gleft <10 then
            effect(cid,15002,gleft,topos)
                if gleft == 3 then
                    doSummonCreature(monster1, {fourposition1,fourposition2,fourposition3,fourposition4})
                elseif gleft == 4 then
                    doSummonCreatures(monster3, {modpos1,modpos2,modpos3})
                    doSummonCreature(monster3, fourposition2)
                elseif gleft == 7 then
                    doSummonCreatures(monster1, {fourposition1,fourposition2,fourposition3,fourposition4})
                elseif gleft == 9 then
                    doSummonCreature(boss2, leftpos)
                    gtotal = gtotal + 1
                    setPlayerStorageValue(cid, 15005,gtotal)
                end
        else
            doSendMagicEffect(topos, 2)
        end

    elseif item2.itemid == 8290 then
        if gright <10 then
            effect(cid,15003,gright,topos)
                if gright == 2 then
                    doSummonCreatures(monster4, {twopos,twopos1})
                elseif gright == 4 then
                    doSummonCreatures(monster1, {fourposition1,fourposition2,fourposition3,fourposition4})
                elseif gright == 7 then
                    doSummonCreatures(monster1, {fourposition1,fourposition2,fourposition3,fourposition4})
                elseif gright == 9 then
                    doSummonCreature(boss3,leftpos)
                    gtotal = gtotal + 1
                    setPlayerStorageValue(cid, 15005,gtotal)
                end
        else
            doSendMagicEffect(topos, 2)
        end

    elseif item2.itemid == 8291 then
        if gface <10 then
            effect(cid,15004,gface,topos)
                if gface == 1 then
                    doSummonCreature(monster2, doublepos)
                    doSummonCreature(monster5, fourposition2)
                elseif gface == 4 then
                    doSummonCreatures(monster1, {fourposition1,fourposition2,fourposition3,fourposition4})
                elseif gface == 6 then
                    doSummonCreature(boss4, leftpos)
                elseif gface == 9 then
                    gtotal = gtotal + 1
                    setPlayerStorageValue(cid, 15005,gtotal)
                end
        else
            doSendMagicEffect(topos, 2)
        end
    end
end