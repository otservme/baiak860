-- Script SYtem vip 1.0 --

function onSay(cid, words, param)
if(words == "!buyvip") then
local price = 3000000
if doPlayerRemoveMoney(cid, 3000000) == TRUE then
local days = 30
local daysvalue = days * 24 * 60 * 60
local storageplayer = getPlayerStorageValue(cid, 13540)
local timenow = os.time()

if getPlayerStorageValue(cid, 13540) - os.time() <= 0 then
time = timenow + daysvalue
else
time = storageplayer + daysvalue
end

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foram adicionados ".. days .." dias de VIP no seu character.")
setPlayerStorageValue(cid, 13540, time)

local quantity = math.floor((getPlayerStorageValue(cid, 13540) - timenow)/(24 * 60 * 60))
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. quantity .." dias de VIP restantes.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa de "..price.." gp's para colocar vip.")
end

elseif(words == "!vipdays") then
local timenow = os.time()
local quantity = math.floor((getPlayerStorageValue(cid, 13540) - timenow)/(24 * 60 * 60))
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. (quantity < 0 and 0 or quantity) .." dias de VIP no seu character.")

elseif(words == "/checkvip") then
if getPlayerAccess(cid) == 5 then
if not param then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
end

local player = getPlayerByName(param)
local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")
return TRUE
end

local timenow = os.time()

local quantity = math.floor((getPlayerStorageValue(player, 13540) - timenow)/(24 * 60 * 60))
doPlayerPopupFYI(cid, "O jogador tem ".. (quantity < 0 and 0 or quantity) .." dias de VIP no character.") 
return TRUE
end

elseif(words == "/addvip") then
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",")
if not t[2] then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
end

local player = getPlayerByName(t[1])
local days = t[2]
local pid = getPlayerByNameWildcard(t[1])
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")
return TRUE
end

local daysvalue = days*3600*24
local storageplayer = getPlayerStorageValue(player, 13540)
local timenow = os.time()

local time = storageplayer <= 0 and (timenow + daysvalue) or (storageplayer + daysvalue)

doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram adicionados "..days.." dias de VIP no seu character.")
setPlayerStorageValue(player, 13540, time)
local quantity = math.floor((getPlayerStorageValue(player,13540) - timenow)/(3600*24))
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você tem "..quantity.." dias de VIP restantes.")
end

elseif(words == "/delvip") then
if getPlayerAccess(cid) == 5 then 
local dec = MESSAGE_INFO_DESCR
if(param == "") then return TRUE,doPlayerSendTextMessage(cid,18,"Command param required.")end
local C,t = {},string.explode(param, ",")
C.pos = getPlayerPosition(cid)
C.uid = getCreatureByName(t[1])
C.time = ((tonumber(t[2]) == nil) and 1 or tonumber(t[2]))*3600*24 --Tempo da vip por dia.
C.days = (tonumber(t[2]) == nil) and 1 or tonumber(t[2]) --Dias de vip.
local pid = getPlayerByNameWildcard(t[1])
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")
return TRUE
end

if(getPlayerStorageValue(C.uid,13540) < C.time)then
doPlayerSendTextMessage(cid,dec,'O jogador '..t[1]..' não possui '..C.days..' dias de vip.')
else
doPlayerSendTextMessage(cid,dec,'Você removeu '..C.days..' dias de vip do player '..t[1]..'.')
setPlayerStorageValue(C.uid,13540,getPlayerStorageValue(C.uid,13540)-C.time)
end
doSendMagicEffect(C.pos, math.random(28,30)) 
end
end

return TRUE
end