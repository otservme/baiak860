local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end


local node1 = keywordHandler:addKeyword({'primeira bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Deseja comprar a primeira bless por 10000 gold?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, bless = 1, premium = true, cost = 10000})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

local node2 = keywordHandler:addKeyword({'segunda bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'deseja comprar a segunda blessing por 10000 gold?'})
	node2:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, bless = 2, premium = true, cost = 10000})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

local node3 = keywordHandler:addKeyword({'terceira bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'deseja comprar a terceira bless por 10000 gold?'})
	node3:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, bless = 3, premium = true, cost = 10000})
	node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

local node4 = keywordHandler:addKeyword({'quarta bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Deseja comprar a quarta bless por 10000 gold?'})
	node4:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, bless = 4, premium = true, cost = 10000})
	node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

local node5 = keywordHandler:addKeyword({'quinta bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Deseja comprar a quinta bless por 10000 gold?'})
	node5:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, bless = 5, premium = true, cost = 10000})
	node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

npcHandler:addModule(FocusModule:new())