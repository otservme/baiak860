  function onSay(cid, words, param)

local config = {
        bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem')),
        playerIsFighting = hasCondition(cid, CONDITION_INFIGHT)
}

if config.bankSystemEnabled == TRUE then

if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command requires param.")
        return TRUE
end

local t = string.explode(param, ",")

if playerExists(param) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have transferred " .. getPlayerBalance(cid) .. " gold to " .. param .. ".")
        doPlayerTransferAllMoneyTo(cid, param)
else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Player " .. param .. " does not exist.")
        return TRUE
end
else
        return FALSE
        end
end 