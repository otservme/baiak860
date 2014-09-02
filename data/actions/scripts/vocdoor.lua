function onUse(cid, item, frompos, item2, topos)

doorpos = {x=frompos.x, y=frompos.y, z=frompos.z}
playerpos = getPlayerPosition(cid)
playervoc = getPlayerVocationl(cid)

if item.uid == (id da porta) and doorpos.x == POSX and doorpos.y == POSY and doorpos.z == POSZ then
if playervoc == (voc necessaria) then
doTeleportThing(cid,doorpos)
elseif playervoc == VOCA플O playervoc == VOCA플O playervoc == VOCA플O then <---vocs erradas
doPlayerSendTextMessage(cid,22,"Apenas VOCA플O podem passar.")
end
end
return 1
end 