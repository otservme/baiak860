-- SCRIPT FEITO POR YUNIE
-- config
minlevel = 400 -- level para resetar
price = 0
newlevel = 10 -- level após reset
newexp = 9300 -- nova experiencia após reset
-- end config

function addReset(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,36874,resets+1)
return true
end

function getResets(cid)
resets = getPlayerStorageValue(cid,36874)
if resets < 0 then
resets = 0
end
return resets
end


local keywordHandler = KeywordHandler:new()
local npcHandler = npcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	 npcHandler:onCreatureAppear(cid)	 end
function onCreatureDisappear(cid)	 npcHandler:onCreatureDisappear(cid)	 end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg)	 end
function onThink()	 npcHandler:onThink()	 end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = npcHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if msgcontains(msg, 'reset') then
selfSay('Do you want to reset your character level? Your character will be logged off if you confirm. You must pay '..price..' gold coins to reset.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if getPlayerMoney(cid) < price then
selfSay('You must pay '..price..' gold coins to reset.', cid)
elseif getPlayerLevel(cid) < minlevel then
selfSay('You must be at least level '.. minlevel ..' to reset.', cid)
else
doPlayerRemoveMoney(cid,price)
addReset(cid)
playerid = getPlayerGUID(cid)
doRemoveCreature(cid)
db.executeQuery("UPDATE `players` SET `level`="..newlevel..",`experience`="..newexp.." WHERE `players`.`id`= ".. playerid .."")
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Ok.', cid)
elseif msgcontains(msg, 'quant') then
selfSay('You have '..getResets(cid)..' reset(s).', cid)
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())