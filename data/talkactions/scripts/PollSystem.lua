--[[
	Poll System v3.0 by Magus
	See changes on: http://forums.otserv.com.br/f232/poll-system-sistema-de-enquete-80706/
	Configure somethings below
-]]

PollSystem = {
	CONST_POLL_TIME = 120, --Tempo para votar na enquete (em segundos)
	CONST_POLL_ADM = 4, --Group_id mínimo necessário para manusear enquetes
	CONST_POLL_SHOWOPTIONS = 1, --0 = não mostrar resultados da enquete, 1 = mostrar resultados percentuais da enquete, 2 = mostrar resultados percentuais e reais da enquete
	CONST_POLL_FTIME = "%d/%m/%y, %H:%M" --Formato da data
}
PollSystem_mt = { __index = PollSystem }

function PollSystem:load()
	return setmetatable(PollSystem, PollSystem_mt)
end

function PollSystem:exists(id)
	local Query = db.getResult("SELECT * FROM `polls` WHERE `id` = " .. id)
	return Query:getID() ~= -1 and true or false
end

function PollSystem:getLastByName(name)
	local Query = db.getResult("SELECT `id` FROM `polls` WHERE `poll` = " .. db.escapeString(name) .. " ORDER BY `id` DESC LIMIT 1")
	return Query:getID() ~= -1 and Query:getDataInt("id") or 0
end

function PollSystem:getNamebyID(id)
	local Query = db.getResult("SELECT `poll` FROM `polls` WHERE `id` = " .. id)
	return Query:getID() ~= -1 and Query:getDataString("poll") or nil
end

function PollSystem:getOptionsTable(id)
	local Query = db.getResult("SELECT `options` FROM `polls` WHERE `id` = " .. id)
	return Query:getID() ~= -1 and string.explode(Query:getDataString("options"), "|") or {}
end

function PollSystem:getVotes(id)
	local Query = db.getResult("SELECT `votes` FROM `poll_votes` WHERE `poll_id` = " .. id)
	return Query:getID() ~= -1 and string.explode(Query:getDataString("votes"), ",") or -1
end

function PollSystem:getAll()
	local Query = db.getResult("SELECT * FROM `polls` ORDER BY `id` DESC LIMIT 0, 10")
	if(Query:getID() ~= -1) then
		local _i = {}
		local x = 1
		repeat
			_i[x] = {
				ID = Query:getDataInt("id"),
				PLAYER_ID = Query:getDataInt("player_id"),
				POLL = Query:getDataString("poll"),
				OPT = Query:getDataString("options"),
				TIME = os.date(self.CONST_POLL_FTIME, Query:getDataInt("timestamp"))
			}
			x = x+1
		until not Query:next()
		Query:free()
		return _i
	else
		return nil
	end
end
	
function PollSystem:create(cid, poll, options)
	return db.executeQuery("INSERT INTO `polls` (`player_id`, `poll`, `options`, `timestamp`) VALUES (" .. getPlayerGUID(cid) .. ", " .. db.escapeString(poll) .. ", " .. db.escapeString(options) .. ", " .. os.time() .. ")") or false
end

function PollSystem:remove(id)
	return db.executeQuery("DELETE FROM `polls` WHERE `id` = " .. id) or false
end

function PollSystem:remvotes(id)
	return db.executeQuery("DELETE FROM `poll_votes` WHERE `poll_id` = " .. id) or false
end

function PollSystem:addVote(cid, id, vote, optmax)
	local Query = db.getResult("SELECT * FROM `poll_votes` WHERE `poll_id` = " .. id)
	local PLAYER_GUID = getPlayerGUID(cid)
	if (Query:getID() ~= -1) then
		local Query = db.getResult("SELECT `account_id` FROM `poll_votes` WHERE `poll_id` = " .. id)
		local PLAYER_GUID_TABLE = string.explode(Query:getDataString("account_id"), ",")
		Query:free()
		if (isInArray(PLAYER_GUID_TABLE, PLAYER_GUID)) then
			return 1
		else
			local _tr = self:getVotes(id)
			_tr[vote] = _tr[vote]+1
			local votes = table.concat(_tr, ",")
			return db.executeQuery("UPDATE `poll_votes` SET `votes` = '" .. votes .. "', `account_id` = CONCAT(`account_id`,'" .. PLAYER_GUID .. ",') WHERE `poll_id` = " .. id) or false
		end
	else
		local votes = ""
		for i = 1, optmax do
			if (i == tonumber(vote)) then x = 1 else x = 0 end
			votes = votes .. x .. ","
		end
		local votes = string.sub(votes, 0, string.len(votes)-1)
		return db.executeQuery("INSERT INTO `poll_votes` (`poll_id`, `votes`, `account_id`) VALUES (" .. id .. ", '" .. votes .."', '" .. PLAYER_GUID .. ",')") or false
	end
end

function PollSystem:showResults(id, sopt, t)
	local sopt = sopt == nil and self.CONST_POLL_SHOWOPTIONS or sopt
	if (sopt ~= 0) then
		local _tr = self:getVotes(id)
		if (_tr ~= -1) then
			local _votes = 0
			for k,v in ipairs(_tr) do
				v = tonumber(v)
				if (isNumber(v)) then _votes = _votes + tonumber(v) end
			end
			local _opt = self:getOptionsTable(id)
			local results = ""
			local adt = ""
			for k,v in ipairs(_opt) do
				if (sopt == 2) then adt = " (" .. _tr[k] .. ")" end
				results = results .. "\"" .. v .. "\"".. adt.." (" .. math.floor((tonumber(_tr[k]) * 100) / _votes) .. "%)"
				if (k ~= #_opt) then results = results .. " - " end
			end
			if (t ~= 1) then return broadcastMessage("Resultados: " .. results, MESSAGE_STATUS_CONSOLE_RED) else return results end
		else
			return nil
		end
	else
		return nil
	end
end

function onSay(cid, words, param)
	local Poll = PollSystem:load()
	
	if (words == "!createpoll") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			local str = string.explode(param, ";")
			local str = str == nil and {} or str
			if (str[1] == nil) or (str[2] == nil) or (string.match(str[2], "|(.+)$") == nil) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Syntax: !createpoll POLL QUESTION?;OPTION 1|OPTION 2|ETC... Minimum 2 options.")
			else
			Poll:create(cid, str[1], str[2])
			local _ID = Poll:getLastByName(str[1])
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Poll created successfully. It's ID is " .. _ID .. ". Save it.")
			end
			return TRUE
		end
	end
	
	if (words == "!activatepoll") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			if (getGlobalStorageValue(76557) ~= 1) then
				local param = tonumber(param)
				if (param == "") or (not isNumber(param)) or (param < 1) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Syntax: !activatepoll ID")
				else
					if (Poll:exists(param)) then
						local _opt = Poll:getOptionsTable(param)
						setGlobalStorageValue(76557, 1)
						setGlobalStorageValue(765572, #_opt)
						setGlobalStorageValue(765573, param)
						broadcastMessage("Uma enquete foi iniciada!", MESSAGE_STATUS_WARNING)
						local EventId = addEvent(function() EventId = addEvent(function() broadcastMessage("As opções são:", MESSAGE_STATUS_CONSOLE_RED) for k,v in ipairs(_opt) do broadcastMessage("\"" .. v .. "\" - Use !votepoll " .. k .. "", MESSAGE_STATUS_CONSOLE_RED) end setGlobalStorageValue(765575, 1) EventId = addEvent(function() setGlobalStorageValue(76557, 0) setGlobalStorageValue(765575, 0) broadcastMessage("A enquete foi finalizada, obrigado por votar.", MESSAGE_STATUS_WARNING) Poll:showResults(param) end, Poll.CONST_POLL_TIME*1000, {Poll.CONST_POLL_TIME, param, _opt}) setGlobalStorageValue(765574, EventId) end, 5000, {_opt, Poll.CONST_POLL_TIME}) setGlobalStorageValue(765574, EventId) broadcastMessage("Poll: " .. Poll:getNamebyID(param), MESSAGE_STATUS_CONSOLE_RED) end, 3000, {Poll:getNamebyID(param)})
						setGlobalStorageValue(765574, EventId)
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A Poll with this ID was not found.")
					end
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A poll is already running.")
			end
			return TRUE
		end
	end
	
	if (words == "!seepoll") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			local _sp = Poll:getAll()
			if (_sp ~= nil) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Showing the lasts 10 polls.")
				_spn = 0
				for k,v in ipairs(_sp) do
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "ID: " .. v.ID .. " - Poll: " .. v.POLL .. " - Options: " .. v.OPT .. " - Made by: " .. getPlayerNameByGUID(v.PLAYER_ID) .. " - At: " .. v.TIME)
					_spn = _spn + 1
				end
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, _spn .. " polls found.")
			else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "0 polls found.")
			end
			return TRUE
		end
	end
	
	if (words == "!seeresults") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			local param = tonumber(param)
			if (param == "") or (not isNumber(param)) or (param < 1) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Syntax: !seeresults Poll ID")
			else
				results = Poll:showResults(param, 2, 1)
				if (results ~= nil) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Results of Poll ID " .. param .. ": " .. results)			
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "No results for the Poll ID " .. param .. ".")
				end
			end
			return TRUE
		end
	end
	
	if (words == "!cancelpoll") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			if (getGlobalStorageValue(76557) == 1) then
				setGlobalStorageValue(76557, 0)
				stopEvent(getGlobalStorageValue(765574))
				broadcastMessage("The poll has been canceled by " .. getPlayerName(cid) .. ".", MESSAGE_STATUS_WARNING)
				Poll:showResults(getGlobalStorageValue(765573))
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A poll is not running.")
			end
			return TRUE
		end
	end
	
	if (words == "!rempoll") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			local param = tonumber(param)
			if (param == "") or (not isNumber(param)) or (param < 1) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Syntax: !rempoll ID")
			else
				if (Poll:exists(param)) then
					if (Poll:remove(param)) then
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The poll with ID " .. param .. " was successfuly removed from the database.")
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "An error ocurred while trying to remove the poll with ID " .. param .. ".")
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A poll with this ID was not found.")
				end
			end
			return TRUE
		end
	end
	
	if (words == "!remvotes") then
		if (getPlayerGroupId(cid) < Poll.CONST_POLL_ADM) then
			return FALSE
		else
			local param = tonumber(param)
			if (param == "") or (not isNumber(param)) or (param < 1) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Syntax: !remvotes Poll ID")
			else
				if (Poll:exists(param)) then
					if (Poll:remvotes(param)) then
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The votes of poll ID " .. param .. " was successfuly reseted.")
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "An error ocurred while trying to reset the votes of poll ID " .. param .. ".")
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Votes for this poll ID was not found.")
				end
			end
			return TRUE
		end
	end
	
	if (words == "!votepoll") then
		if (getGlobalStorageValue(76557) == 1) then
			if (getGlobalStorageValue(765575) == 1) then
				local _optmax = getGlobalStorageValue(765572)
				local param = tonumber(param)
				local _ID = getGlobalStorageValue(765573)
				if (param == "") or (not isNumber(param)) or (param < 1) or (param > _optmax) then
					_opt = Poll:getOptionsTable(_ID)
					_poll = Poll:getNamebyID(_ID)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A enquete é: " .. _poll)
					for k,v in ipairs(_opt) do
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Opção " .. k .. " - \"" .. v .. "\"")
					end
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "use: !votepoll Opção, Ex. !votepoll 1")
				else
					_addvote = Poll:addVote(cid, _ID, param, _optmax)
					if (_addvote == 1) then
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você ou algum outro Character da sua account ja votou nesta enquete.")
					else
						if (_addvote ~= nil) then
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu voto foi computado com sucesso.")
						else
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ocorreu um erro, tente votar novamente.")
						end
					end
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wait the options shows up.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A poll is not running.")
		end
		return TRUE
	end
end