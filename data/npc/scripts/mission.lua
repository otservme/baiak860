local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'trabalho')) then
selfSay('Muito bom! Ja quer comecar a {primeira} missao?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'primeira')) then
selfSay('Oh, traga para mim 4 {Golden Armor}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'golden armor') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) > 0) then
selfSay('Parabens, voce completou a missao!', cid)
else
if(doPlayerRemoveItem(cid, 2466, 4) == TRUE) then
setPlayerStorageValue(cid,100,1)
doPlayerAddExperience(cid,10000)
doPlayeraddItem(cid, 2470, 1)
selfSay('Muito bem! Voce iniciou a {segunda} missao.. (voce recebeu 10000 pontos de experiencia e uma Golden Legs)', cid)
else
selfSay('Voce precisa ter mais items.', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'segunda')) then
selfSay('Traga-me 20 {Demonrage Sword}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'Demonrage Sword') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('Voce completou a missao, vejo que nao devo mais te subestimar.', cid)
else
if(doPlayerRemoveItem(cid, 7382, 20) == TRUE) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExperience(cid,20000)
doPlayeraddItem(cid, 8926, 1)
selfSay('Voce iniciou a {terceira} missao... (Voce recebeu 20000 pontos de experiencia e um Demonwing Axe)', cid)
else
selfSay('Voce precisa de mais items.', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'terceira')) then
selfSay('Traga-me dois {orshabaal brain}."', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'orshabaal brain') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,102) > 0) then
selfSay('Voce completou!', cid)
else
if(doPlayerRemoveItem(cid, 5808, 2) == TRUE) then
setPlayerStorageValue(cid,102,1)
doPlayerAddExperience(cid,40000)
doPlayeraddItem(cid, 7422, 1)
selfSay('Parabens! Voce completou todas as missoes, agora volte para sua pokebola. (hehe) (Voce recebeu 40000 pontos de experiencia e uma Jade Hammer.)', cid)
else
selfSay('Voce precisa de mais items.', cid)
end
end
return true
end


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  