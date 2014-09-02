--------------------------------------------------------------
----------Recharger Firewalker boots by Ricktcs---------------
--------------------------------------------------------------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function rechargeFirewalker(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end

local playermoney = getPlayerMoney(cid)
if playermoney >= 20000 then
if doPlayerRemoveItem(cid,9934,1) == 1 then
doPlayerAddItem(cid, 9933, 1)
doPlayerRemoveMoney(cid, 20000)
npcHandler:say("Here are your new firewalker boots!", cid)
else
npcHandler:say("You don't have worn firewalker boots.", cid)
end
else
npcHandler:say("You don't have enough money.", cid)
end
keywordHandler:moveUp(1)
return true
end

local node1 = keywordHandler:addKeyword({'firewalker boots'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to repair your firewalker boots for 20000 gold coins?'})
node1:addChildKeyword({'yes'}, rechargeFirewalker, {blessing = 1})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can repair a pair of worn {firewalker boots} for 20000 gold coins."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can repair a pair of worn {firewalker boots} for 20000 gold coins."})

npcHandler:addModule(FocusModule:new())