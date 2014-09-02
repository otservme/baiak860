function onSay(cid, words, param)
    local storage = 8860
    local exhaustTime = 5 * 60 -- 5 minutes
    local message = getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]: " .. param
    
    if exhaust.check(cid, storage) == TRUE then
        doPlayerSendCancel(cid, "Sorry, you may only broadcast once every ".. math.ceil(exhaustTime / 60) .." minutes.")
        return TRUE
    end
    if isPremium(cid) ~= TRUE then
        doPlayerSendCancel(cid, "Sorry, you haven't premium account.")
    end

    exhaustion.set(cid, storage, exhaustTime)                   
    doBroadcastMessage(cid, message, MESSAGE_EVENT_ADVANCE)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Broadcast sent.")
return TRUE
end  