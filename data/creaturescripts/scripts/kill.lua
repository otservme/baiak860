function onKill(cid, target)
	local monster = getCreatureName(target)
	local room = getArenaMonsterIdByName(monster)
	if room > 0 then
		setPlayerStorageValue(cid, room, 1)
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_DEFAULT,'Voce pode ir para a proxima sala!')
	end
	return TRUE
end