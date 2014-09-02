--[[ 
    Talking Tp/signs/tiles for TFS 0.2+
    70%shawak,30%Damadgerz
    Idea by Damadgerz
]]--
    local time = 5    -- 1 = 1 sec, 2 = 2 sec, ...

     local say_events = {}
local function SayText(cid)
    if isPlayer(cid) == TRUE then
         if say_events[getPlayerGUID(cid)] ~= nil then
             if isPlayer(cid) == TRUE then
                 doSendAnimatedText(getPlayerPosition(cid),"Treinando!", math.random(01,255))
             end
             say_events[getPlayerGUID(cid)] = addEvent(SayText, time * 1000 / 2, cid)       
         end                                                       
    end
    return TRUE
end
function onSay(cid, words, param, channel) 
    if(param == '') then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
     return true
     end
     if param == "on" then
        if isPlayer(cid) == TRUE then
            doSendAnimatedText(getPlayerPosition(cid),"Treinando!", math.random(01,255))
        end
        say_events[getPlayerGUID(cid)] = addEvent(SayText, time * 1000, cid)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"You Now Stated you are (afk).")
     elseif param == "off" then
            stopEvent(say_events[getPlayerGUID(cid)])
            say_events[getPlayerGUID(cid)] = nil
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"You Now stated your are not (afk).")
    end
    return TRUE
end
