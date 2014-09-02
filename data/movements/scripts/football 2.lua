function onAddItem(moveitem, tileitem, position)
-- middle pos of soccers  field, change it to position where ust be your ball spawned!
local ballpos = {x=26, y=51, z=7, stackpos=1}
local ball = getThingfromPos(ballpos)
local komanda1 = getPlayerName(getGlobalStorageValue(15026))
local komanda2 = getPlayerName(getGlobalStorageValue(15028))
if tileitem.actionid == 15028 and moveitem.itemid == 2109 then 
local wet = getGlobalStorageValue(15025) + 1
local wet2 = getGlobalStorageValue(15024)
doRemoveItem(moveitem.uid, 1)
doSendMagicEffect(ballpos, 5)
setGlobalStorageValue(15025, wet)
if getGlobalStorageValue(15025) ~= 3 then
doCreateItem(2109, 1, ballpos)
end
doBroadcastMessage("GOOL!!!", MESSAGE_EVENT_ADVANCE)    
    if getGlobalStorageValue(15025) == 3 then
    doBroadcastMessage("Game over! !", MESSAGE_EVENT_ADVANCE)    
    doSetItemActionId(doCreateItem(8058, 1, ballpos), 15029)
    end

elseif tileitem.actionid == 15027 and moveitem.itemid == 2109 then
local wet3 = getGlobalStorageValue(15024) + 1
local wet4 = getGlobalStorageValue(15025)
doRemoveItem(moveitem.uid, 1)
doSendMagicEffect(ballpos, 5)
setGlobalStorageValue(15024, wet3)
if getGlobalStorageValue(15024) ~= 3 then
doCreateItem(2109, 1, ballpos)
end
doBroadcastMessage("GOOL!!!", MESSAGE_EVENT_ADVANCE)    
    if getGlobalStorageValue(15024) == 3 then
    doBroadcastMessage("Game over! !", MESSAGE_EVENT_ADVANCE)
    doSetItemActionId(doCreateItem(8058, 1, ballpos), 15029)
    end
end
return TRUE
end  