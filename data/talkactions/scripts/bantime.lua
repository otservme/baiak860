local default_comment = "Banido Temporariamente."
local default_lenght = 1 -- ban time in hours

function onSay(cid, words, param)
local parametres = string.explode(param, ",")
if(parametres[1] ~= nil) then
local accId = getAccountIdByName(parametres[1])
if(accId > 0) then
local lenght = default_lenght
local comment = default_comment
if(parametres[2] ~= nil and tonumber(parametres[2]) > 0) then
lenght = tonumber(parametres[2])
end
if(parametres[3] ~= nil) then
comment = parametres[3]
end
doAddBanishment(accId, lenght * 3600, 23, ACTION_BANISHMENT, comment, getPlayerGUID(cid), comment)
local player = getPlayerByNameWildcard(parametres[1])
if(isPlayer(player) == TRUE) then
doRemoveCreature(player)
end
else
doPlayerSendCancel(cid, "Player with name " .. parametres[1] .. " doesn't exist.")
end
else
doPlayerSendCancel(cid, "You must enter name.")
end
return true
end 