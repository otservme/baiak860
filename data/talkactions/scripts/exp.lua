local config = {
	rateExperience = {"1", "nopvp", "nonpvp", "no-pvp", "non-pvp", "safe"}
}

function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local world = setExperience()
	param = param:lower()
	if(table.isStrIn(param, config.experience)) then
		setrateExperience(rate_Experience)
	else
		doPlayerSendCancel(cid, "Bad gameworld type.")
		return true
	end

	doBroadcastMessage("Experience type set to: " .. world .. ".", MESSAGE_EVENT_ADVANCE)
	return true
end
