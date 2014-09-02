  local pos = {x=101,y=37,z=7,stackpos=2}
local function destroyWindow()
doTransformItem(getThingfromPos(pos).uid, 9657, 1)
doSendMagicEffect(pos, CONST_ME_POFF)
return TRUE
end
local function showGhost()
doSendMagicEffect(pos, 60)
return TRUE
end

function onThink(interval, lastExecution)
doTransformItem(getThingfromPos(pos).uid, 9656, 1)
doSendMagicEffect(pos, 12)
addEvent(destroyWindow, 1000)
time = 1
repeat
        addEvent(showGhost, time*1000)
        time = time + 1
until time == 8
return TRUE
end 