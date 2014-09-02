local arena = {
frompos = {x=121, y=33, z=9},
topos = {x=128, y=37, z=9},
exit = {x=121, y=37, z=9} 
}

function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
if isPlayer(cid) == TRUE then
if isInArea(getPlayerPosition(cid), arena.frompos, arena.topos) then
if doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid), TRUE) == TRUE then
if doTeleportThing(cid, arena.exit) == TRUE then
doSendMagicEffect(arena.exit, 10)
doPlayerSendTextMessage(mostDamageKiller,MESSAGE_STATUS_CONSOLE_BLUE,'[ARENA] You have defeated '..getPlayerName(cid)..'!')
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'[ARENA] You where defeated by '..getPlayerName(mostDamageKiller)..'!')
return FALSE
end
end
end
end
return TRUE
end