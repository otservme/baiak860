local config = {
    priceForEachMessage = 10000, -- preço de cada mensagem
    levelToUseQuestService = 50 -- level para poder usar este comando
}

function onSay(cid, words, param, channel)
    if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ERROR] Command requires param.")
        return TRUE
    end
    
    local t = string.explode(param, ",")
    if(not t[2]) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ERROR] !service servicename, preço(gold coins)")
        return TRUE
    end    
    
    if(isNumber(t[2]) == FALSE) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ERROR] Preço can be only numbers.")
        return TRUE
    end        
    
    if(getPlayerLevel(cid) <= config.levelToUseQuestService) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[ERROR] Only Players Level " .. config.levelToUseQuestService .. " or more may use this command.")    
        return TRUE 
    end

    if(doPlayerRemoveMoney(cid, config.priceForEachMessage) == TRUE) then
        doBroadcastMessage("QuestService: " .. getPlayerName(cid) .. "'s now starting a " .. t[1] .. "! Preço: " .. t[2] .. "k.", MESSAGE_STATUS_WARNING)
    else
        doPlayerSendCancel(cid, "[ERROR] You need " .. config.priceForEachMessage .. " gold coins to send a message.")
    end
    return TRUE 
end  