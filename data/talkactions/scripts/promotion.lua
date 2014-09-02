function onSay(cid, words, param)
 
	if getPlayerVocation(cid) <= 4 then
		if doPlayerRemoveMoney(cid,20000) == TRUE then
 
		doPlayerSetVocation(cid,getPlayerVocation(cid)+4)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have been promoted!")
		doSendMagicEffect(getPlayerPosition(cid), 30)
 
			else
 
		doPlayerSendCancel(cid, "Sorry, you don't have enought money")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
 
			end
		else
 
		doPlayerSendCancel(cid, "Sorry, you are already promoted")
	end
end