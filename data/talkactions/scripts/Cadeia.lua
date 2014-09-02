-- Default jail time in seconds --
default_jail = 60*60*12
-- The permission you need to jail someone --
grouprequired = 3
-- StorageValue that the player gets --
jailedstoragevalue_time = 1338
jailedstoragevalue_bool = 1339
-- POSIcaO DA CADEIA: --
jailpos = { x = 565, y = 57, z =7 }
-- POSICAO DO TEMPLO: --
unjailpos = { x = 160, y = 52, z =7 }
-- auto kicker, dont edit
jail_list = {}
jail_list_work = 0

function checkJailList(param)
addEvent(checkJailList, 1000, {})
for targetID,player in ipairs(jail_list) do
if isPlayer(player) == TRUE then
if getPlayerStorageValue(player, jailedstoragevalue_time) < os.time() then
doTeleportThing(player, unjailpos, TRUE)
setPlayerStorageValue(player, jailedstoragevalue_time, 0)
setPlayerStorageValue(player, jailedstoragevalue_bool, 0)
table.remove(jail_list,targetID)
doPlayerSendTextMessage(player,MESSAGE_STATUS_CONSOLE_ORANGE,'You were kicked from jail! See you later ')
end
else
table.remove(jail_list,targetID)
end
end
end

function onSay(cid, words, param)
if jail_list_work == 0 then
jail_list_work = addEvent(checkJailList, 1000, {})
end
if param == '' and (words == '!unjail' or words == '/unjail') then
if getPlayerStorageValue(cid, jailedstoragevalue_time) > os.time() then
doPlayerSendTextMessage ( cid, MESSAGE_INFO_DESCR, 'You are jailed until ' .. os.date("%H:%M:%S", getPlayerStorageValue(cid, jailedstoragevalue_time)) .. ' (now is: ' .. os.date("%H:%M:%S", os.time()) .. ').')
else
if getPlayerStorageValue(cid, jailedstoragevalue_bool) == 1 then
table.insert(jail_list,cid)
doPlayerSendTextMessage ( cid, MESSAGE_INFO_DESCR, 'You will be kicked from jail in one second.')
else
doPlayerSendTextMessage ( cid, MESSAGE_INFO_DESCR, 'You are not jailed.')
end
end
return TRUE
end
local jail_time = -1
for word in string.gmatch(tostring(param), "(%w+)") do
if tostring(tonumber(word)) == word then
jail_time = tonumber(word)
end
end
local isplayer = getPlayerByName(param)
if isPlayer(isplayer) ~= TRUE then
isplayer = getPlayerByName(string.sub(param, string.len(jail_time)+1))
if isPlayer(isplayer) ~= TRUE then
isplayer = getPlayerByName(string.sub(param, string.len(jail_time)+2))
if isPlayer(isplayer) ~= TRUE then
isplayer = getPlayerByName(string.sub(param, string.len(jail_time)+3))
end
end
end
if jail_time ~= -1 then
jail_time = jail_time * 60
else
jail_time = default_jail
end
if words == '!jail' or words == '/jail' then
if getPlayerGroupId ( cid ) >= grouprequired then
if isPlayer(isplayer) == TRUE then
doTeleportThing(isplayer, jailpos, TRUE)
setPlayerStorageValue(isplayer, jailedstoragevalue_time, os.time()+jail_time)
setPlayerStorageValue(isplayer, jailedstoragevalue_bool, 1)
table.insert(jail_list,isplayer)
doPlayerSendTextMessage ( cid, MESSAGE_INFO_DESCR, 'You jailed '.. getCreatureName(isplayer) ..' until ' .. os.date("%H:%M:%S", getPlayerStorageValue(isplayer, jailedstoragevalue_time)) .. ' (now is: ' .. os.date("%H:%M:%S", os.time()) .. ').')
doPlayerSendTextMessage ( isplayer, MESSAGE_INFO_DESCR, 'You have been jailed by '.. getCreatureName(cid) ..' until ' .. os.date("%H:%M:%S", getPlayerStorageValue(isplayer, jailedstoragevalue_time)) .. ' (now is: ' .. os.date("%H:%M:%S", os.time()) .. ').')
return TRUE
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Player with this name doesn\'t exist or is offline.")
return FALSE
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have access to unjail other players.")
return FALSE
end
elseif words == '!unjail' or words == '/unjail' then
if getPlayerGroupId ( cid ) >= grouprequired then
if isPlayer(isplayer) == TRUE then
doTeleportThing(isplayer, unjailpos, TRUE)
setPlayerStorageValue(isplayer, jailedstoragevalue_time, 0)
setPlayerStorageValue(isplayer, jailedstoragevalue_bool, 0)
table.remove(jail_list,targetID)
doPlayerSendTextMessage(isplayer,MESSAGE_STATUS_CONSOLE_ORANGE,getCreatureName(cid) .. ' let you go out from jail! See you later')
doPlayerSendTextMessage ( cid, MESSAGE_INFO_DESCR, 'You unjailed '.. getCreatureName(isplayer) ..'.')
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Player with this name doesn\'t exist or is offline.")
return FALSE
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have access to unjail other players.")
return FALSE
end
end
return FALSE
end 