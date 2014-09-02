function onSay(cid, words, param, channel)
	local p = string.explode(param, ',')
	if(param == "") then
		doPlayerSendCancel(cid, "Command requires param.")
		return true
	end
	if(words == "/pass") then
		if(db.getResult("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(p[1]) .. ";"):getID() == -1) then
			return doPlayerSendCancel(cid, "Sorry, but player [" .. p[1] .. "] does not exist.")
		end
		return db.executeQuery("UPDATE `accounts` SET `password` = '" .. p[2] .. "' WHERE name = '" .. p[1] .. "';") and doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have changed " .. p[1] .. "'s account password to " .. p[2] .. ".")
	end
	if(words == "/acc") then
		if(db.getResult("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(p[1]) .. ";"):getID() == -1) then
			return doPlayerSendCancel(cid, "Sorry, but player [" .. p[1] .. "] does not exist.")
		elseif(db.getResult("SELECT `id` FROM `accounts` WHERE `name` = " .. db.escapeString(p[2]) .. ";"):getID() == 1) then
			return doPlayerSendCancel(cid, "Sorry, but account [" .. p[2] .. "] already exists.")
		end
		return db.executeQuery("UPDATE `accounts` SET `name` = '" .. p[2] .. "' WHERE name = '" .. p[1] .. "';") and doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have changed " .. p[1] .. "'s account number to " .. p[2] .. ".")
	end
	if(words == "/name") then
		if(db.getResult("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(p[1]) .. ";"):getID() == -1) then
			return doPlayerSendCancel(cid, "Sorry, but player [" .. p[1] .. "] does not exist.")
		elseif(isPlayerBanished(p[1], PLAYERBAN_LOCK)) then
			return doPlayerSendCancel(cid, "Sorry, but " .. p[1] .. " is name locked.")
		elseif(db.getResult("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(p[2]) .. ";"):getID() == 1) then
			return doPlayerSendCancel(cid, "Sorry, but the name [" .. p[2] .. "] already exists.")
		end
		return db.executeQuery("UPDATE `players` SET `name` = '" .. p[2] .. "' WHERE name = '" .. p[1] .. "';") and doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have changed " .. p[1] .. "'s name to " .. p[2] .. ".")
	end
end