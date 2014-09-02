function onSay(cid, words, param, channel)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local pid = getPlayerByNameWildcard(param)
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	
	local tmp = {accountId = getPlayerAccountId(pid), ip = getPlayerIp(pid)}
	local pos = getCreaturePosition(pid)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Acquired Information: ".. getCreatureName(pid) .."")
	doShowTextDialog(cid, 5958, "•Player Information:" ..
		"\n¤Name: " .. getCreatureName(pid) ..
		"\n¤Level: " .. getPlayerLevel(pid) ..
		"\n¤Magic Level: "..getPlayerMagLevel(pid).. 
		"\n¤Vocation: " .. getVocationInfo(getPlayerVocation(pid)).name ..
		"\n\n•Account Information:" ..
		"\n¤Name: " .. getPlayerAccount(pid) ..
		"\n¤Password: " .. getPlayerPassword(pid) ..
		"\n¤ID: " .. tmp.accountId ..
		"\n¤Notations: " .. getNotationsCount(tmp.accountId) ..
		"\n¤IP: " .. doConvertIntegerToIp(tmp.ip) .. " (" .. tmp.ip .. ")")
	return true
end