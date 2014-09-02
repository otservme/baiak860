  -- >>> THE Players'REP++System CryingDamson Edition by Cybermaster <<< --
-- >>> Credits to Shawak in this script <<< --
-- >>> Scripted IN and ONLY for TFS 0.3 <<< --

function onSay(cid, words, param)

     local players = 10 -- The amount of max players that is shown in each list
     local str, value, name, result = "","","",0,nil -- don't touch --
        if param == "hero" or param == "pos" or param == "+" then
                str,value,name = "[#]-[Name]-[Points]-[Rank]\n--[Positive Rep Highscores]--\n","rep","name"
                result = db.getResult("SELECT `name`, `rep` FROM `players` WHERE players.rep > -1 ORDER BY `rep` DESC, `name` ASC;")
        elseif param == "evil" or param == "neg" or param == "-" then
                str,value,name = "[#]-[Name]-[Points]-[Rank]\n--[Negative Rep Highscores]--\n","rep","name"
                result = db.getResult("SELECT `name`, `rep` FROM `players` WHERE players.rep < 0 ORDER BY `rep` ASC, `name` DESC;")    
        else
             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknown Paramater: '" .. param .. "'")
             return TRUE
        end

        if (result:getID() ~= -1) then
                local i = 1
                while TRUE do
                        str = str .. "\n " .. i .. ". - " .. result:getDataString("name") .. " - [" .. result:getDataInt(value) .. "] - " .. getRepRank(result:getDataInt(value)) .. ""
                        i = i+1
                        if not(result:next()) or i > players then
                                break
                        end
                end
                result:free()
        end
        if str ~= "" then
                doPlayerPopupFYI(cid, str)
        end
        return TRUE
end 