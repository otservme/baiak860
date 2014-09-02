local bossroom = {x=114, y=92, z=7} ---coordenadas da sala onde o jogador será teleportado ao clicar na porta
local spawn = {x=112, y=97, z=7} ---coordenadas de onde irá nascer o boss

function onUse(cid, item, pos, frompos, item2, topos)
local randommonsters = {"Fire Overlord", "The Many", "Stonecracker", "The Old Widow"}
local randomboss = math.random(1,4)

if getPlayerStorageValue(cid,696969) == 1 then
doTeleportThing(cid, bossroom)
doSendMagicEffect(bossroom,10)
doSummonCreature(randommonsters[randomboss], spawn)
setPlayerStorageValue(cid, 696969, 2)
else

if item.uid == 8735 and item.itemid == 8553 then
if getPlayerStorageValue(cid,696969) == 0 or getPlayerStorageValue(cid,696969) == 2 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,'The door seems to be sealed against unwanted intruders.')
end
end
end
end