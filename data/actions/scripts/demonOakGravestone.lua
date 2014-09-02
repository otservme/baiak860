function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=22, y=112, z=8} -- reward room
        if getPlayerStorageValue(cid, 15005) > 1 then
                doTeleportThing(cid, position)
                doSendMagicEffect(position, CONST_ME_TELEPORT)
        else
                return FALSE
        end
        return TRUE
end