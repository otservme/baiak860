--- Made by Mazen ---

function onUse(cid, item, fromPosition, itemEx, toPosition)
    
        newnPosition  = {x=32786, y=32412, z=8} --- Reward Room Position ---

    if getPlayerStorageValue(cid,21545) == 2 then
        doTeleportThing(cid,newnPosition)
        doSendMagicEffect(newnPosition,10)
    else
        return FALSE
    end
    return TRUE
end