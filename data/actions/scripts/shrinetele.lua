--
function onUse(cid, item, frompos, item2, topos)
 
tele = {x=98, y=43, z=10}
if item.uid ==2133 then
vocation = getPlayerVocation(cid)
if vocation == 1 and getPlayerLevel(cid) > 30 then
doTeleportThing(cid,tele)
doPlayerSendTextMessage(cid,22,"Bem-vindo ao Shrine, onde voce pode encantar suas armas.")
elseif vocation == 2 and getPlayerLevel(cid) > 30 then
doTeleportThing(cid,tele)
doPlayerSendTextMessage(cid,22,"Bem-vindo ao Shrine, onde voce pode encantar suas armas.")
elseif vocation == 5 and getPlayerLevel(cid) > 30 then
doTeleportThing(cid,tele)
doPlayerSendTextMessage(cid,22,"Bem-vindo ao Shrine,onde voce pode encantar suas armas.")
elseif vocation == 6 and getPlayerLevel(cid) > 30 then
doTeleportThing(cid,tele)
doPlayerSendTextMessage(cid,22,"Bem-vindo ao Shrine, onde voce pode encantar suas armas.")

else
doPlayerSendTextMessage(cid,22,"Somente Druids e Sorcerers de level 30 ou mais podem usar os Shrines.")
end
return 0
end
return 1
end