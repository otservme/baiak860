function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local tmp = getAccountIdByName(param)
	if(tmp == 0) then
		tmp = getAccountIdByAccount(param)
		if(tmp == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player or account '" .. param .. "' does not exists.")
			return true
		end
	end

	if(isAccountBanished(tmp)) then
	 db.executeQuery("DELETE FROM bans WHERE value= " .. tmp .. " LIMIT 1;")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, tmp .. " has been unbanned.")
	end


	return true
end
