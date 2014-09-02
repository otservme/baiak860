local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function buyAddons(cid, message, keywords, parameters, node)
	--TODO: buyAddons function in modules.lua
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local addon = parameters.addon
	local cost = parameters.cost
	local premium = (parameters.premium ~= nil and parameters.premium)

	if isPlayerPremiumCallback == nil or (isPlayerPremiumCallback(cid) and premium) then
		if doPlayerRemoveMoney(cid, cost) then
			doPlayerAddAddons(cid, addon)
			npcHandler:say('Gratz, Você Compro um Addon!', cid)
		else
			npcHandler:say('Desculpe Você Não Tem Dinheiro Suficiente.', cid)
		end
	else
		npcHandler:say('Somente Players Premium Pode Comprar Addon.', cid)
	end

	keywordHandler:moveUp(1)
	return true
end

local node1 = keywordHandler:addKeyword({'first addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'First Addon Custa 500k,Você Tem?'})
	node1:addChildKeyword({'yes'}, buyAddons, {addon = 1, cost = 500000, premium = true})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Too expensive, eh?'})

local node2 = keywordHandler:addKeyword({'second addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Second Addon Custa 1kk, Você Tem?'})
	node2:addChildKeyword({'yes'}, buyAddons, {addon = 2, cost = 1000000, premium = true})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Too expensive, eh?'})

keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hello |PLAYERNAME| Eu Vendo {first addon} e {second addon} Deseja comprar Algum ?'})

npcHandler:addModule(FocusModule:new())