local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function pick_quest(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	local level = getPlayerLevel(cid)
	for k, v in pairs(wow_like_quests) do
		local required = tonumber(k)
		if(level >= required) then
			for i, v in ipairs(v) do	
				local storage = getPlayerStorageValue(cid, v.storage)
				if(storage == -1) then
					npcHandler:say("I could use you in slaying ".. v.amount .. " ".. string.lower(v.monster) .. ". Would you like to accept the quest?", cid)
					parameters.quest = v
					return true
				elseif(storage == v.amount) then
					setPlayerStorageValue(cid, v.storage, -2)
					npcHandler:say("Woah! I didn't except you to be done so fast. Maybe I have more quests for you.", cid)
					if(v.on_turn_in) then
						v.on_turn_in(cid, v)
					end
					npcHandler:resetNpc()
					return true
				end
			end
		end
	end
	npcHandler:say("I have no quests to offer you at the moment. Come back when your stronger", cid)
	npcHandler:resetNpc()
	return true
end
	
function accept_quest(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	local quest = node:getParent():getParameters().quest
	local storage = quest.storage
	setPlayerStorageValue(cid, storage, 0)
	npcHandler:say("I'm expecting to hear from you again. Don't dissapoint me.", cid)
	if(quest.on_accept) then quest.on_accept(cid, quest) end
	npcHandler:resetNpc()
	return true
end

-- Keyword "Quest" will pick lowest undone quest for you. 
local questNode = keywordHandler:addKeyword({'quest'}, pick_quest, {})
	questNode:addChildKeyword({'yes'}, accept_quest, {})
	questNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too hard for you, eh?'})

	
npcHandler:addModule(FocusModule:new())
