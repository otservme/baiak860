--Cyber's REPutation System Rev5.0 
function onSay(cid, words, param)
     local players = 10 
     local str, value, name, result = "","","",0,nil
        if isInArray({'hero','pos','1','+'}, param) then
			str,value,name = "[#]-[Name]-[Points]-[Rank]\n--[Positive Rep Highscores]--\n","rep","name"
            result = db.getResult("SELECT `name`, `rep` FROM `players` WHERE `rep` > -1 AND `id` > 6 AND `group_id` < 2 ORDER BY `rep` DESC, `name` ASC;")
        elseif isInArray({'evil','neg','2','-'}, param) then
            str,value,name = "[#]-[Name]-[Points]-[Rank]\n--[Negative Rep Highscores]--\n","rep","name"
            result = db.getResult("SELECT `name`, `rep` FROM `players` WHERE `rep` < 0 AND `id` > 6 AND `group_id` < 2 ORDER BY `rep` ASC, `name` DESC;")    
        else
             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknown Paramater: '" .. param .. "'")
             return true
        end

        if (result:getID() ~= -1) then
			local i = 1
            while true do
				str = str .. "\n " .. i .. ". " .. result:getDataString("name") .. " - [" .. result:getDataInt(value) .. "] - " .. rep.getRank(result:getDataInt(value)) .. ""
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
return true
end