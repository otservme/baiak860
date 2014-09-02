function onAddItem(moveitem, tileitem, pos)
    if(moveitem.itemid ~= 2109 and tileitem.actionid <= 23310) then -- remove trash
        match = football_positions_uids[tileitem.actionid-23300]
        exitPos = getThingPos(match[1])
        doSendMagicEffect(exitPos, CONST_ME_BATS)
        doTeleportThing(moveitem.uid, exitPos, TRUE)
    else -- goal or trash (ignore) in gate
        if(moveitem.itemid == 2109 and tileitem.actionid > 23310) then
            for i = 1, #football_positions_uids do
                match = football_positions_uids[i]
                if(match[8] == tileitem.actionid) then
                    footballGoal(pos, moveitem, match[6], match[7], match[3], getThingPos(match[2]))
                    break
                elseif(match[9] == tileitem.actionid) then
                    footballGoal(pos, moveitem, match[6], match[7], match[2], getThingPos(match[3]))
                    break
                end
            end
        end
    end
    return TRUE
end

function onStepIn(cid, item, position, fromPosition)
    if(item.actionid <= 23304) then
        match = football_positions_uids[item.actionid-23300]
        if(getCreatureSpeed(cid) ~= match[10]) then
            doRemoveCondition(cid, CONDITION_HASTE)
            doChangeSpeed(cid, match[10] - getCreatureSpeed(cid))
        end
    end
    return TRUE
end  