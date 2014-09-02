  local itemFuncs =
{
        ["attackspeed"] = setItemAttackSpeed,
        ["name"] = setItemName,
        ["plural"] = setItemPluralName,
        ["attack"] = setItemAttack,
        ["extraattack"] = setItemExtraAttack,
        ["defense"] = setItemDefense,
        ["armor"] = setItemArmor,
        ["extradefense"] = setItemExtraDefense,
        ["hitchance"] = setItemHitChance,
        ["range"] = setItemShootRange,
        ["actionid"] = doSetItemActionId,
        ["action"] = doSetItemActionId,
        ["aid"] = doSetItemActionId,
        ["description"] = doSetItemSpecialDescription,
        ["desc"] = doSetItemSpecialDescription,
        ["protection"] = doSetItemProtection,
        ["charges"] = doChangeTypeItem,
        ["count"] = doChangeTypeItem
}

local creatureFuncs =
{
        ["health"] = doCreatureAddHealth,
        ["maxhealth"]= setCreatureMaxHealth,
        ["mana"] = doCreatureAddMana,
        ["maxmana"] = setCreatureMaxMana,
        ["speed"] = doChangeSpeed,
        ["droploot"] = doCreatureSetDropLoot,
        ["cannotmove"] = doCreatureSetNoMove,
        ["skull"] = doCreatureSetSkullType,
        ["redskull"] = doPlayerSetRedSkullTicks
}

local playerFuncs =
{
        ["fyi"] = doPlayerPopupFYI,
        ["tutorial"] = doPlayerSendTutorial,
        ["guildrank"] = doPlayerSetGuildRank,
        ["guildnick"] = doPlayerSetGuildNick,
        ["group"] = doPlayerSetGroupId,
        ["vocation"] = doPlayerSetVocation,
        ["promotion"] = setPlayerPromotionLevel,
        ["stamina"] = doPlayerAddStamina,
        ["town"] = doPlayerSetTown,
        ["balance"] = doPlayerDepositMoney
}
       

function onSay(cid, words, param, channel)
        if(param == "") then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
                return TRUE
        end

        local pos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z, stackpos=1}
        if getCreatureLookDirection(cid) == SOUTH then
                pos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z, stackpos=255}
        elseif getCreatureLookDirection(cid) == NORTH then
                pos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z, stackpos=255}
        elseif getCreatureLookDirection(cid) == EAST then
                pos = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z, stackpos=255}
        elseif getCreatureLookDirection(cid) == WEST then
                pos = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z, stackpos=255}
        end

        local t = string.explode(param, ",")
               

        local getThing = getThingFromPos(pos)

        if itemFuncs[t[1]] then
                if getThing.itemid > 0 then
                        if itemFuncs[t[1]](getThing.uid, t[2]) then
                                doSendMagicEffect(pos, CONST_ME_MAGIC_GREEN)
                                return TRUE
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you can not add attribute to this item.")
                                return TRUE
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item not found.")
                        return TRUE
                end
        elseif creatureFuncs[t[1]] then
                if isCreature(getThing.uid) then
                        if creatureFuncs[t[1]](getThing.uid, t[2]) then
                                doSendMagicEffect(pos, CONST_ME_MAGIC_GREEN)
                                return TRUE
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you can not add attribute to this creature.")
                                return TRUE
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Creature not found.")
                        return TRUE
                end
        elseif playerFuncs[t[1]] then
                if isPlayer(getThing.uid) then
                        if playerFuncs[t[1]](getThing.uid, t[2]) then
                                doSendMagicEffect(pos, CONST_ME_MAGIC_GREEN)
                                return TRUE
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you can not add attribute to this player.")
                                return TRUE
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player not found.")
                        return TRUE
                end
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknow attribute.")
                return TRUE
        end
        return TRUE
end 