  function onSay(cid, words, param)

local config = {
        bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem')),
        playerIsFighting = hasCondition(cid, CONDITION_INFIGHT)
}

if config.bankSystemEnabled == TRUE then
        if config.playerIsFighting == TRUE then

if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command requires param.")
        return TRUE
end

local t = string.explode(param, ",")
local m = tonumber(t[2])
local tmp = string.explode(t[2], ",")

if(not m) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "No money specified.")
        return TRUE
end

m = math.abs(m)
if m <= getPlayerBalance(cid) then
        if playerExists(t[1]) then
        doPlayerTransferMoneyTo(cid, t[1], m)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have transferred " .. m .. " gold to " .. t[1] .. ". Your account balance is " .. getPlayerBalance(cid) .. " gold.")

else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Player " .. t[1] .. " does not exist.")
        end
else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "There is not enough gold on your account. Your account balance is " .. getPlayerBalance(cid) .. ". Please tell the amount of gold coins you would like to transfer.")
        end
        return TRUE
else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bank can not be used in fight.")
        return TRUE
end
else
        return FALSE
        end
end 