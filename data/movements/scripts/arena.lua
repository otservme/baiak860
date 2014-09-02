--Function by Ta4e 07/11/2008--
--90% Arena quest in tibia rl--
--Version 4.0--
--This script make create a globet, summons monsters and create and delete teleports--

function onStepIn(cid, item, position, fromPosition)

getele = getThingfromPos(arenaroom)
getele1 = getThingfromPos(arenache1)
getele2 = getThingfromPos(arenache2)
getele3 = getThingfromPos(arenache3)
getele4 = getThingfromPos(arenache4)
getele5 = getThingfromPos(arenache5)
getele6 = getThingfromPos(arenache6)
getele7 = getThingfromPos(arenache7)
getele8 = getThingfromPos(arenache8)
getele9 = getThingfromPos(arenache9)
getele10 = getThingfromPos(arenache10)

greenhornstatus = getPlayerStorageValue(cid,5000)
scrapperstatus = getPlayerStorageValue(cid,5001)
warlordstatus = getPlayerStorageValue(cid,5002)

-----------------------------------------------------------------------------------------------------------------

        if item.itemid == 1387 and item.actionid == 5110 then
                doTeleportThing(getele.uid,arenapos,0)
                doSendMagicEffect(arenapos,10)
                    if warlordstatus == 1 then
                        doSummonCreature(bossw1, monsterpos1)
                        setPlayerStorageValue(cid,5002,2)
                    elseif scrapperstatus == 1 then
                        doSummonCreature(bosss1, monsterpos1)
                        setPlayerStorageValue(cid,5001,2)
                    elseif greenhornstatus == 1 then
                        doSummonCreature(bossg1, monsterpos1)
                        setPlayerStorageValue(cid,5000,2)
                    else
                    doPlayerSendCancel(cid,"You need talk to halvar")
                    end
                    
                    
        elseif item.itemid == 1387 and item.actionid == 5100 then
                doTeleportThing(getele1.uid,arenapos2,0)
                doSendMagicEffect(arenapos2,10)
                getrem1 = getThingfromPos({x=arenache1.x, y=arenache1.y, z=arenache1.z, stackpos =1})
                doCreateItem(1354,1,arenache1)
                doRemoveItem(getrem1.uid,1)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw2, monsterpos2)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss2, monsterpos2)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg2, monsterpos2)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5101 then
                doTeleportThing(getele2.uid,arenapos3,0)
                doSendMagicEffect(arenapos3,10)
                local getrem2 = getThingfromPos({x=arenache2.x, y=arenache2.y, z=arenache2.z, stackpos =1})
                doRemoveItem(getrem2.uid,1)
                doCreateItem(1354,1,arenache2)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw3, monsterpos3)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss3, monsterpos3)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg3, monsterpos3)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5102 then
                doTeleportThing(getele3.uid,arenapos4,0)
                doSendMagicEffect(arenapos4,10)
                local getrem3 = getThingfromPos({x=arenache3.x, y=arenache3.y, z=arenache3.z, stackpos =1})
                doRemoveItem(getrem3.uid,1)
                doCreateItem(1354,1,arenache3)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw4, monsterpos4)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss4, monsterpos4)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg4, monsterpos4)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5103 then
                doTeleportThing(getele4.uid,arenapos5,0)
                doSendMagicEffect(arenapos5,10)
                local getrem4 = getThingfromPos({x=arenache4.x, y=arenache4.y, z=arenache4.z, stackpos =1})
                doRemoveItem(getrem4.uid,1)
                doCreateItem(1354,1,arenache4)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw5, monsterpos5)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss5, monsterpos5)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg5, monsterpos5)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5104 then
                doTeleportThing(getele5.uid,arenapos6,0)
                doSendMagicEffect(arenapos6,10)
                local getrem5 = getThingfromPos({x=arenache5.x, y=arenache5.y, z=arenache5.z, stackpos =1})
                doRemoveItem(getrem5.uid,1)
                doCreateItem(1354,1,arenache5)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw6, monsterpos6)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss6, monsterpos6)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg6, monsterpos6)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5105 then
                doTeleportThing(getele6.uid,arenapos7,0)
                doSendMagicEffect(arenapos7,10)
                local getrem6 = getThingfromPos({x=arenache6.x, y=arenache6.y, z=arenache6.z, stackpos =1})
                doRemoveItem(getrem6.uid,1)
                doCreateItem(1354,1,arenache6)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw7, monsterpos7)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss7, monsterpos7)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg7, monsterpos7)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5106 then
                doTeleportThing(getele7.uid,arenapos8,0)
                doSendMagicEffect(arenapos8,10)
                local getrem7 = getThingfromPos({x=arenache7.x, y=arenache7.y, z=arenache7.z, stackpos =1})
                doRemoveItem(getrem7.uid,1)
                doCreateItem(1354,1,arenache7)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw8, monsterpos8)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss8, monsterpos8)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg8, monsterpos8)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5107 then
                doTeleportThing(getele8.uid,arenapos9,0)
                doSendMagicEffect(arenapos8,10)
                local getrem8 = getThingfromPos({x=arenache8.x, y=arenache8.y, z=arenache8.z, stackpos =1})
                doRemoveItem(getrem8.uid,1)
                doCreateItem(1354,1,arenache8)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw9, monsterpos9)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss9, monsterpos9)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg9, monsterpos9)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5108 then
                doTeleportThing(getele9.uid,arenapos10,0)
                doSendMagicEffect(arenapos9,10)
                local getrem9 = getThingfromPos({x=arenache9.x, y=arenache9.y, z=arenache9.z, stackpos =1})
                doRemoveItem(getrem9.uid,1)
                doCreateItem(1354,1,arenache9)
                    if warlordstatus == 2 then
                        doSummonCreature(bossw10, monsterpos10)
                    elseif scrapperstatus == 2 then
                        doSummonCreature(bosss10, monsterpos10)
                    elseif greenhornstatus == 2 then
                        doSummonCreature(bossg10, monsterpos10)
                    end
                    
        elseif item.itemid == 1387 and item.actionid == 5109 then
                doTeleportThing(getele10.uid,rewardpos,0)
                doSendMagicEffect(rewardpos,10)
                local getrem10 = getThingfromPos({x=arenache10.x, y=arenache10.y, z=arenache10.z, stackpos =1})
                doRemoveItem(getrem10.uid,1)
                doCreateItem(1354,1,arenache10)
                    if warlordstatus == 2 then
                        setPlayerStorageValue(cid,5002,3)
                        setPlayerStorageValue(cid,5007,1)
                    elseif scrapperstatus == 2 then
                        setPlayerStorageValue(cid,5001,3)
                        setPlayerStorageValue(cid,5006,1)
                    elseif greenhornstatus == 2 then
                        setPlayerStorageValue(cid,5000,3)
                        setPlayerStorageValue(cid,5005,1)
                    end
                    
                    
        elseif item.itemid == 1387 and item.actionid == 5111 then
            if warlordstatus == 2 then
                    setPlayerStorageValue(cid,5002,0)
            elseif scrapperstatus == 2 then
                    setPlayerStorageValue(cid,5001,0)
            elseif greenhornstatus == 2 then
                    setPlayerStorageValue(cid,5000,0)
            end
                    
        elseif item.itemid == 426 then
            if item.actionid == 5010 then
                doTransformItem(item.uid, 425)
                    if getPlayerStorageValue(cid,5017) == -1 then
                        local golden = doCreateItem(8698,1,globet1)
                            doSetItemSpecialDescription(golden, 'rox by'..getPlayerName(cid)..'.')
                        doSendMagicEffect(globet1,10)
                        setPlayerStorageValue(cid,5017,1)
                    else
                        doSendMagicEffect(globet1,2)
                    end
                    
            elseif item.actionid == 5011 then
                doTransformItem(item.uid, 425)
                    if getPlayerStorageValue(cid,5016) == -1 then
                        local golden = doCreateItem(7370,1,globet2)
                        doSetItemSpecialDescription(golden, 'rox by'..getPlayerName(cid)..'.')
                        doSendMagicEffect(globet2,10)
                        setPlayerStorageValue(cid,5016,1)
                    else
                        doSendMagicEffect(globet2,2)
                    end

            elseif item.actionid == 5012 then
                doTransformItem(item.uid, 425)
                    if getPlayerStorageValue(cid,5015) == -1 then
                    local golden = doCreateItem(7371,1,globet3)
                    doSetItemSpecialDescription(golden, 'rox by'..getPlayerName(cid)..'.')
                    doSendMagicEffect(globet3,10)
                    setPlayerStorageValue(cid,5015,1)
                    else
                        doSendMagicEffect(globet3,2)
                    end
            end

                    
        end
return TRUE
end

function onAddItem(moveitem, tileitem, position)

    if moveitem.itemid == 7349 and tileitem.actionid == 5000 then
        local getrem1 = getThingfromPos({x=arenache1.x, y=arenache1.y, z=arenache1.z, stackpos =1})
        doRemoveItem(getrem1.uid,1)
        doCreateItem(1387,1,arenache1)
        doMakeEffect(arenache1,13)
            local getrem1 = getThingfromPos({x=arenache1.x, y=arenache1.y, z=arenache1.z, stackpos =1})
            doSetItemActionId(getrem1.uid,5100)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5001 then
        local getrem2 = getThingfromPos({x=arenache2.x, y=arenache2.y, z=arenache2.z, stackpos =1})
        doRemoveItem(getrem2.uid,1)
        doCreateItem(1387,1,arenache2)
        doMakeEffect(arenache2,13)
            local getrem2 = getThingfromPos({x=arenache2.x, y=arenache2.y, z=arenache2.z, stackpos =1})
            doSetItemActionId(getrem2.uid,5101)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5002 then
        local getrem3 = getThingfromPos({x=arenache3.x, y=arenache3.y, z=arenache3.z, stackpos =1})
        doRemoveItem(getrem3.uid,1)
        doCreateItem(1387,1,arenache3)
        doMakeEffect(arenache3,13)
            local getrem3 = getThingfromPos({x=arenache3.x, y=arenache3.y, z=arenache3.z, stackpos =1})
            doSetItemActionId(getrem3.uid,5102)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5003 then
        local getrem4 = getThingfromPos({x=arenache4.x, y=arenache4.y, z=arenache4.z, stackpos =1})
        doRemoveItem(getrem4.uid,1)
        doCreateItem(1387,1,arenache4)
        doMakeEffect(arenache4,13)
            local getrem4 = getThingfromPos({x=arenache4.x, y=arenache4.y, z=arenache4.z, stackpos =1})
            doSetItemActionId(getrem4.uid,5103)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5004 then
        local getrem5 = getThingfromPos({x=arenache5.x, y=arenache5.y, z=arenache5.z, stackpos =1})
        doRemoveItem(getrem5.uid,1)
        doCreateItem(1387,1,arenache5)
        doMakeEffect(arenache5,13)
            local getrem5 = getThingfromPos({x=arenache5.x, y=arenache5.y, z=arenache5.z, stackpos =1})
            doSetItemActionId(getrem5.uid,5104)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5005 then
        local getrem6 = getThingfromPos({x=arenache6.x, y=arenache6.y, z=arenache6.z, stackpos =1})
        doRemoveItem(getrem6.uid,1)
        doCreateItem(1387,1,arenache6)
        doMakeEffect(arenache6,13)
            local getrem6 = getThingfromPos({x=arenache6.x, y=arenache6.y, z=arenache6.z, stackpos =1})
            doSetItemActionId(getrem6.uid,5105)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5006 then
        local getrem7 = getThingfromPos({x=arenache7.x, y=arenache7.y, z=arenache7.z, stackpos =1})
        doRemoveItem(getrem7.uid,1)
        doCreateItem(1387,1,arenache7)
        doMakeEffect(arenache7,13)
            local getrem7 = getThingfromPos({x=arenache7.x, y=arenache7.y, z=arenache7.z, stackpos =1})
            doSetItemActionId(getrem7.uid,5106)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5007 then
        local getrem8 = getThingfromPos({x=arenache8.x, y=arenache8.y, z=arenache8.z, stackpos =1})
        doRemoveItem(getrem8.uid,1)
        doCreateItem(1387,1,arenache8)
        doMakeEffect(arenache8,13)
            local getrem8 = getThingfromPos({x=arenache8.x, y=arenache8.y, z=arenache8.z, stackpos =1})
            doSetItemActionId(getrem8.uid,5107)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5008 then
        local getrem9 = getThingfromPos({x=arenache9.x, y=arenache9.y, z=arenache9.z, stackpos =1})
        doRemoveItem(getrem9.uid,1)
        doCreateItem(1387,1,arenache9)
        doMakeEffect(arenache9,13)
            local getrem9 = getThingfromPos({x=arenache9.x, y=arenache9.y, z=arenache9.z, stackpos =1})
            doSetItemActionId(getrem9.uid,5108)
            
    elseif moveitem.itemid == 7349 and tileitem.actionid == 5009 then
        local getrem10 = getThingfromPos({x=arenache10.x, y=arenache10.y, z=arenache10.z, stackpos =1})
        doRemoveItem(getrem10.uid,1)
        doCreateItem(1387,1,arenache10)
        doMakeEffect(arenache10,13)
            local getrem10 = getThingfromPos({x=arenache10.x, y=arenache10.y, z=arenache10.z, stackpos =1})
            doSetItemActionId(getrem10.uid,5109)
    end
end