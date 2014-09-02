-- Credits to LeozeraRox
function onDeath(cid, corpse, lastHitKiller, mostDamageKiller)
local cidpos = getPlayerPosition(lastHitKiller)
loot = 5943
item = doPlayerAddItem(lastHitKiller,loot,1)
if(isPlayer(lastHitKiller) == TRUE) then
hitKillerName = getPlayerName(lastHitKiller)
doSetItemSpecialDescription(item,"This is the heart of "..getPlayerName(cid).." killed at Level "..getPlayerLevel(cid).." by "..hitKillerName..".")
doPlayerSendTextMessage(lastHitKiller, MESSAGE_STATUS_CONSOLE_ORANGE, "You Killed " .. getCreatureName(cid) .. ".")
doSendMagicEffect(cidpos,12)
else
hitKillerName = getCreatureName(lastHitKiller)
doSetItemSpecialDescription(item,"This is the heart of "..getPlayerName(cid).." killed at Level "..getPlayerLevel(cid).." by a "..hitKillerName..".")
end
setItemName(item, ""..getPlayerName(cid).."\'s Heart")
return TRUE
end