  function onSay(cid, words, param)

local config = {
        bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem')),
        playerIsFighting = hasCondition(cid, CONDITION_INFIGHT)
}

if config.bankSystemEnabled == TRUE then
        if config.playerIsFighting == FALSE then

if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command requires param.")
        return TRUE
end

local m = tonumber(param)

if(not m) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Command requires numeric param.")
        return TRUE
end

m = math.abs(m)
if m <= getPlayerMoney(cid) then
        doPlayerDepositMoney(cid, m)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Alright, you have added the amount of " .. m .. " gold to your balance. You can withdraw your money anytime you want to. Your account balance is " .. getPlayerBalance(cid) .. ".")

else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You do not have enough money.")
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