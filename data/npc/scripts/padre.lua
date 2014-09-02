local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if msgcontains(msg, 'marry') or msgcontains(msg, 'marriage') then
		if getPlayerStorageValue(cid,3066) == -1 then
			selfSay('Would you like to get married?', cid)
			talkState[talkUser] = 1
		elseif getPlayerStorageValue(cid,3066) == 1 then
			local fid = getPlayerGUID(cid)
			local marrystatus = getOwnMarryStatus(fid)
			if marrystatus ~= 0 then
				local newpartner = getPlayerNameByGUID(marrystatus)
				selfSay('You already set a wedding date with {' .. newpartner .. '}, now I must talk to your partner. Do you want to {cancel} it?', cid)
				talkState[talkUser] = 5
			else
				setPlayerStorageValue(cid,3066,-1)
				selfSay('Would you like to get married?', cid)
				talkState[talkUser] = 1
			end
		elseif getPlayerStorageValue(cid,3066) == 2 then
			selfSay('You are already married. If you want to {divorce}, just say it.', cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, 'divorce') then
		if getPlayerStorageValue(cid,3066) == 2 then
			selfSay('Would you like to divorce of your partner?', cid)
			talkState[talkUser] = 6
		else
			selfSay('You are not married. If you want to get married, just say {marry}.', cid)
			talkState[talkUser] = 0
		end
	end

	if talkState[talkUser] == 1 then
		if msgcontains(msg, 'yes') then
			local fid = getPlayerGUID(cid)
			local marrystatus = getMarryStatus(fid)
			if marrystatus == FALSE then
				selfSay('And what\'s the name of your future partner?', cid)
				talkState[talkUser] = 2
			else
				local marryname = getPlayerNameByGUID(marrystatus)
				selfSay('{' .. marryname .. '} has set a wedding date with you. Do you want to {proceed} or {cancel} the wedding?', cid)
				talkState[talkUser] = 4
			end
		end

	elseif talkState[talkUser] == 2 then
		local p = msg
		local player = getPlayerName(cid)
		local fid = getPlayerGUID(cid)
		local sid = getPlayerGUIDByName(p)
		if sid == 0 then
			selfSay('A player with that name does not exists.', cid)
			talkState[talkUser] = 0
		elseif sid == fid then
			selfSay('Don\'t worry, you will always be married with yourself, kid.', cid)
			talkState[talkUser] = 0
		else
			local marrystatus = getMarryStatus(fid)
			local pmarriage = getPlayerMarriage(sid)
			local ownstatus = getOwnMarryStatus(sid)
			if pmarriage == FALSE then
				if marrystatus == FALSE then
					if ownstatus == FALSE then
						setPlayerStorageValue(cid,3066,1)
						addMarryStatus(fid,sid)
						selfSay('You\'ve just set a wedding date with {' .. p .. '}.', cid)
						talkState[talkUser] = 0
					else
						local partnername = getPlayerNameByGUID(ownstatus)
						selfSay('{' .. p .. '} has already set a wedding date with {' .. partnername .. '}.', cid)
						talkState[talkUser] = 0
					end
				else
					local marryname = getPlayerNameByGUID(marrystatus)
					selfSay('{' .. marryname .. '} has set a wedding date with you. Do you want to {proceed} or {cancel} the wedding?', cid)
					talkState[talkUser] = 4
				end
			else
				local pname = getPlayerNameByGUID(pmarriage)
				selfSay('Sorry, but {' .. p .. '} is already married to {' .. pname .. '}.', cid)
				talkState[talkUser] = 0
			end
		end

	elseif talkState[talkUser] == 4 then
		if msgcontains(msg, 'proceed') then
			local fid = getPlayerGUID(cid)
			local sid = getMarryStatus(fid)
			local marryname = getPlayerNameByGUID(sid)
			local pid = getPlayerByNameWildcard(marryname)
			if isOnline(fid) == TRUE and isOnline(sid) == TRUE then
				local tmf = getCreaturePosition(cid)
				local	tms = getCreaturePosition(pid)
				local text = {'I love you!','My love!','Baby dear!'}
				local chance1 = math.random(1,table.getn(text))
				local chance2 = math.random(1,table.getn(text))
				if getDistanceBetween(tmf, tms) <= 3 then
					setPlayerStorageValue(cid,3066,2)
					setPlayerStorageValue(pid,3066,2)
					doCancelMarryStatus(fid)
					doCancelMarryStatus(sid)
					setPlayerPartner(cid,sid)
					setPlayerPartner(pid,fid)
					doCreatureSay(cid, text[chance1], TALKTYPE_ORANGE_1)
					doCreatureSay(pid, text[chance2], TALKTYPE_ORANGE_1)
					doSendMagicEffect(tmf, 35)
					doSendMagicEffect(tms, 35)
					selfSay('Congratulations! Now you may kiss your partner! Everytime you wanna make this effect, just say {love}. You must be close to your partner.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Your partner must be close to you so you can marry!', cid)
					talkState[talkUser] = 0
				end
			else
				selfSay('You and your new partner must be online at the same time.', cid)
				talkState[talkUser] = 0
			end

		elseif msgcontains(msg, 'cancel') then
			local fid = getPlayerGUID(cid)
			local sid = getMarryStatus(fid)
			local marryname = getPlayerNameByGUID(sid)
			local pid = getPlayerByNameWildcard(marryname)
			if isOnline(sid) == TRUE then
				setPlayerStorageValue(pid,3066,-1)
			end
			doCancelMarryStatus(sid)
			selfSay('You just canceled your wedding date with {' .. marryname .. '}.', cid)
			talkState[talkUser] = 0
		end

	elseif talkState[talkUser] == 5 then
		if msgcontains(msg, 'cancel') or msgcontains(msg, 'yes') then
			local fid = getPlayerGUID(cid)
			setPlayerStorageValue(cid,3066,-1)
			doCancelMarryStatus(fid)
			talkState[talkUser] = 0
		end

	elseif talkState[talkUser] == 6 then
		if msgcontains(msg, 'yes') then
			local fid = getPlayerGUID(cid)
			local sid = getPlayerPartner(cid)
			local marryname = getPlayerNameByGUID(sid)
			local pid = getPlayerByNameWildcard(marryname)
			if (isOnline(fid) == TRUE and isOnline(sid) == TRUE) then
				setPlayerStorageValue(cid,3066,-1)
				setPlayerStorageValue(pid,3066,-1)
				setPlayerPartner(cid,0)
				setPlayerPartner(pid,0)
				selfSay('You\'ve just divorced of your old partner.', cid)
				talkState[talkUser] = 0
			else
				selfSay('You and your new partner must be online at the same time.', cid)
				talkState[talkUser] = 0
			end
		end
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
