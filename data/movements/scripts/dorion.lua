local oldPos = {x=100,y=40,z=7}
local newPos = {x=100,y=40,z=7}

function onSay(cid, param)
if getPlayerVocation(cid) == 0 then
    if item.actionid == 10001 and getPlayerLevel(cid) >= 10 then
    doSendMagicEffect(oldPos, 10)
    doTeleportThing(cid,newPos)
    doSendMagicEffect(newPos, 10)
    end
    return 1
end
