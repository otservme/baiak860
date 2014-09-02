  function onSay(cid, words, param)

local config = {
        bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem')),
        playerIsFighting = hasCondition(cid, CONDITION_INFIGHT)
}

if config.bankSystemEnabled == TRUE then
        if config.playerIsFighting == FALSE then

local m = tonumber(param)

if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command requires param.")
        return TRUE
end

if(not m) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command requires numeric param.")
        return TRUE
end

m = math.abs(m)
if m <= getPlayerBalance(cid) then
        doPlayerWithdrawMoney(cid, m)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Here you are, " .. m .. " gold. Your account balance is " .. getPlayerBalance(cid) .. ".")

else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "There is not enough gold on your account.")
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