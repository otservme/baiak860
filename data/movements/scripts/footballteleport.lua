function onStepIn(cid, item, pos)
--soccer system by Fare, otland.net
 if item.actionid == 15029 then
    local position = {x=40, y=54, z=7, stackpos=255} -- where players must be teleported after match
    local position2 = {x=5, y=53, z=7, stackpos=255}  -- middle of the field(ball spawn)
    local getplayer = getThingfromPos(position2)
    doTeleportThing(getplayer.uid,position,0)
     if getGlobalStorageValue(15029) == -1 or getGlobalStorageValue(15029) == 0 then
     setGlobalStorageValue(15029, 2)
     elseif getGlobalStorageValue(15029) == 2 then
     setGlobalStorageValue(15029, 3)
     elseif getGlobalStorageValue(15029) == 3 then
     setGlobalStorageValue(15029, 4)
     elseif getGlobalStorageValue(15029) == 4 then
     setGlobalStorageValue(15029, 5)
     elseif getGlobalStorageValue(15029) == 5 then
     setGlobalStorageValue(15029, 6)
     elseif getGlobalStorageValue(15029) == 6 then
     setGlobalStorageValue(15029, 0)
     local teleportPosition = {x=5, y=53, z=7, stackpos=1} -- middle of the field(ball spawn)
     local getTeleport = getThingfromPos(teleportPosition)
        if getTeleport.itemid == 8058 then
        doRemoveItem(getTeleport.uid, 1)
        doCreateItem(1387, 1, teleportPosition)
        end
    end
end
end  