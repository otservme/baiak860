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

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'baiak sorcerer') or msgcontains(msg, 'baiak sorc')) then
selfSay('Deseja virar {baiak sorcerer} por 200 crystal coins?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 2160) >= 200) then
doPlayerRemoveItem(cid, 2160, 200)
doPlayerSetVocation(cid,1)
selfSay('Vocação trocada com sucesso , Agora você é um Baiak Sorcerer.', cid)
else
selfSay('Você não tem {crystal coins} Suficientes.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'baiak druid') or msgcontains(msg, 'baiak druida')) then
selfSay('Deseja virar {baiak druid} por 200 crystal coins?', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 2160) >= 200) then
doPlayerRemoveItem(cid, 2160, 200)
doPlayerSetVocation(cid,2)
selfSay('Vocação trocada com sucesso , Agora você é um Baiak Druid.', cid)
else
selfSay('Você não tem {crystal coins} Suficientes.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'baiak knight') or msgcontains(msg, 'baiak kina')) then
selfSay('Deseja virar {Baiak knight} por 200 crystal coins?', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 2160) >= 200) then
doPlayerRemoveItem(cid, 2160, 200)
doPlayerSetVocation(cid,4)
selfSay('Vocação trocada com sucesso , Agora você é um Baiak Knight.', cid)
else
selfSay('Você não tem {crystal coins} Suficientes.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'baiak paladin') or msgcontains(msg, 'biaak pala')) then
selfSay('Deseja virar {baiak paladin} por 200 crystal coins?', cid)
talkState[talkUser] = 4
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
if(getPlayerItemCount(cid, 2160) >= 200) then
doPlayerRemoveItem(cid, 2160, 200)
doPlayerSetVocation(cid,3)
selfSay('Vocação trocada com sucesso , Agora você é um baiak Paladin.', cid)
else
selfSay('Você não tem {crystal coins} Suficientes.', cid)
end
talkState[talkUser] = 0
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())