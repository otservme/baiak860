function onStepIn(cid, item, position, fromPosition)
timenow = os.time()
quantity = math.floor((getPlayerStorageValue(cid,29000) - timenow)/(3600*24))
if isPlayer(cid) then
if quantity > 0 then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você ainda tem ".. quantity .." dia(s) restante(s) de VIP.")
else
dir = getPlayerLookDir(cid)
pos = getCreaturePosition(cid)


if dir == 0 then
newpos = {x=pos.x, y=pos.y+1, z=pos.z}
elseif dir == 2 then
newpos = {x=pos.x, y=pos.y-1, z=pos.z}
elseif dir == 1 then
newpos = {x=pos.x-1, y=pos.y, z=pos.z}
elseif dir == 3 then
newpos = {x=pos.x+1, y=pos.y, z=pos.z}
end

doTeleportThing(cid, newpos, dir)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Somente jogadores VIPs podem entrar nesta área.")
end
end
end