 function onSay(cid, words, param)
-- Exhausted Settings --
local exhausted_seconds = 1 -- How many seconds player will be exhausted --
local exhausted_storagevalue = 9847 -- Storage Value to store exhaust. It MUST be unused! --
-- Exhausted Settings END --


	local text = {'I love you!','My love!','Baby dear!'}
	local chance1 = math.random(1,table.getn(text))
	local chance2 = math.random(1,table.getn(text))
	local sid = getPlayerPartner(cid)
	if sid > 0 then
		if isOnline(sid) == TRUE then
			local sname = getPlayerNameByGUID(sid)
			local pid = getPlayerByNameWildcard(sname)
			local tmf = getCreaturePosition(cid)
			local	tms = getCreaturePosition(pid)
			if getDistanceBetween(tmf, tms) <= 3 then
                        if(os.time() > getPlayerStorageValue(cid, exhausted_storagevalue)) then
                                setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
				doCreatureSay(cid, text[chance1], TALKTYPE_ORANGE_1)
				doCreatureSay(pid, text[chance2], TALKTYPE_ORANGE_1)
				doSendMagicEffect(tmf, 35)
				doSendMagicEffect(tms, 35)
                                      else
                                doPlayerSendCancel(cid, "You are exhausted.")
				return TRUE
			end
		end
	end
end
end