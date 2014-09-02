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

	if msgcontains(msg, 'casar') or msgcontains(msg, 'marriage') then
		if getPlayerStorageValue(cid,3066) == -1 then
			selfSay('Voce gostaria de se casar?', cid)
			talkState[talkUser] = 1
		elseif getPlayerStorageValue(cid,3066) == 1 then
			local fid = getPlayerGUID(cid)
			local marrystatus = getOwnMarryStatus(fid)
			if marrystatus ~= 0 then
				local newpartner = getPlayerNameByGUID(marrystatus)
				selfSay('Voce ja definiu a data do casamento com {' .. newpartner .. '}, agora eu preciso conversar com seu parceiro. Voce quer {cancelar}?', cid)
				talkState[talkUser] = 5
			else
				setPlayerStorageValue(cid,3066,-1)
				selfSay('Voce gostaria de se casar?', cid)
				talkState[talkUser] = 1
			end
		elseif getPlayerStorageValue(cid,3066) == 2 then
			selfSay('Voce ja esta casado. Se voce quer {divorcio}, basta dizer.', cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, 'divorcio') then
		if getPlayerStorageValue(cid,3066) == 2 then
			selfSay('Voce tem certeza que quer se divorciar do seu parceiro?', cid)
			talkState[talkUser] = 6
		else
			selfSay('Voce nao esta casado. Gostaria de se {casar}?', cid)
			talkState[talkUser] = 0
		end
	end

	if talkState[talkUser] == 1 then
		if msgcontains(msg, 'yes') then
			local fid = getPlayerGUID(cid)
			local marrystatus = getMarryStatus(fid)
			if marrystatus == FALSE then
				selfSay('E qual o nome do seu futuro parceiro?', cid)
				talkState[talkUser] = 2
			else
				local marryname = getPlayerNameByGUID(marrystatus)
				selfSay('{' .. marryname .. '} marcou a data do casamento com voce. Voce quer {continuar} ou {cancelar} o casamento?', cid)
				talkState[talkUser] = 4
			end
		end

	elseif talkState[talkUser] == 2 then
		local p = msg
		local player = getPlayerName(cid)
		local fid = getPlayerGUID(cid)
		local sid = getPlayerGUIDByName(p)
		if sid == 0 then
			selfSay('Nao existe nenhum jogador com este nome.', cid)
			talkState[talkUser] = 0
		elseif sid == fid then
			selfSay('Nao se preocupe, voce sempre estara casado com voce mesmo, garoto.', cid)
			talkState[talkUser] = 0
		else
			local marrystatus = getMarryStatus(fid)
			local pmarriage = getPlayerMarriage(sid)
			local ownstatus = getOwnMarryStatus(cid)
			if pmarriage == FALSE then
				if marrystatus == FALSE then
					if ownstatus == FALSE then
						setPlayerStorageValue(cid,3066,1)
						addMarryStatus(fid,sid)
						selfSay('Voce acabou de marcar um casamento com {' .. p .. '}.', cid)
						talkState[talkUser] = 0
					else
						local partnername = getPlayerNameByGUID(ownstatus)
						selfSay('{' .. p .. '} ja marcou a data do casamento com {' .. partnername .. '}.', cid)
						talkState[talkUser] = 0
					end
				else
					local marryname = getPlayerNameByGUID(marrystatus)
					selfSay('{' .. marryname .. '} marcou a data do casamento com voce. Voce deseja {continuar} ou {cancelar} o casamento?', cid)
					talkState[talkUser] = 4
				end
			else
				local pname = getPlayerNameByGUID(pmarriage)
				selfSay('Desculpe, mas {' .. p .. '} esta casado com {' .. pname .. '}.', cid)
				talkState[talkUser] = 0
			end
		end

	elseif talkState[talkUser] == 4 then
		if msgcontains(msg, 'continuar') then
			local fid = getPlayerGUID(cid)
			local sid = getMarryStatus(fid)
			local marryname = getPlayerNameByGUID(sid)
			local pid = getPlayerByNameWildcard(marryname)
				local tmf = getCreaturePosition(cid)
				local	tms = getCreaturePosition(pid)
				local text = {'Eu te amo!','Meu amor!','Minha paixao!'}
				local chance1 = math.random(1,table.getn(text))
				local chance2 = math.random(1,table.getn(text))
				local dateFormat = "%A %d"..getMonthDayEnding(os.date("%d")).." %B %Y"
                                local ring = doPlayerAddItem(cid,10502,1)
                                local ring2 = doPlayerAddItem(pid,10502,1)

			if isOnline(fid) == TRUE and isOnline(sid) == TRUE then
			if getDistanceBetween(tmf, tms) <= 3 then
					setPlayerStorageValue(cid,3066,2)
					setPlayerStorageValue(pid,3066,2)
					doCancelMarryStatus(fid)
					doCancelMarryStatus(sid)
					setPlayerPartner(cid,sid)
					setPlayerPartner(pid,fid)
                                        doPlayerAddOutfitId(cid,23,0)
                                        doPlayerAddOutfitId(pid,23,0)
                                        doItemSetAttribute(ring, "description", "" .. getCreatureName(cid) .. " & " .. getCreatureName(pid) .. " forever - married on " ..os.date(dateFormat).. ".")
                                        doItemSetAttribute(ring2, "description", "" .. getCreatureName(cid) .. " & " .. getCreatureName(pid) .. " forever - married on " ..os.date(dateFormat).. ".")
					doCreatureSay(cid, text[chance1], TALKTYPE_ORANGE_1)
					doCreatureSay(pid, text[chance2], TALKTYPE_ORANGE_1)
					doSendMagicEffect(tmf, 35)
					doSendMagicEffect(tms, 35)
					selfSay('Parabens! Agora ja podem se beijar! Sempre que quiser este efeito, basta dizer {love}. Voce precisa estar perto do seu parceiro.', cid)
					talkState[talkUser] = 0

				else
					selfSay('Seu parceiro deve estar perto de voce para que voces possam se casar!', cid)
					talkState[talkUser] = 0
				end
			else
				selfSay('Voce e seu novo parceiro devem estar online ao mesmo tempo.', cid)
				talkState[talkUser] = 0
			end
			


		elseif msgcontains(msg, 'cancelar') then
			local fid = getPlayerGUID(cid)
			local sid = getMarryStatus(fid)
			local marryname = getPlayerNameByGUID(sid)
			local pid = getPlayerByNameWildcard(marryname)
			if isOnline(sid) == TRUE then
				setPlayerStorageValue(pid,3066,-1)
			end
			doCancelMarryStatus(sid)
			selfSay('Voce cancelou sua data de casamento com {' .. marryname .. '}.', cid)
			talkState[talkUser] = 0
		end

	elseif talkState[talkUser] == 5 then
		if msgcontains(msg, 'cancelar') or msgcontains(msg, 'yes') then
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
                                doPlayerAddOutfitId(cid,23,-1)
                                doPlayerAddOutfitId(pid,23,-1)
				selfSay('Voce acabou de se divorciar do seu antigo parceiro.', cid)
				talkState[talkUser] = 0
			else
				selfSay('Voce e seu parceiro deve estar online ao mesmo tempo.', cid)
				talkState[talkUser] = 0
			end
		end

	end


	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())