function onUse(cid, item, frompos, item2, topos)

--Nao Mecha--
player1pos = {x=topos.x, y=topos.y, z=topos.z, stackpos=253}
player1 = getThingfromPos(player1pos)
nome = getPlayerName(cid)
nome2 = getPlayerName(player1.uid)
sexo = getPlayerSex(cid)
sexo2 = getPlayerSex(player1.uid)

----

if sexo == 0 and sexo ~= sexo2 and getPlayerStorageValue(player1.uid,2222) == 1 and getPlayerStorageValue(cid,2223) ~= 1 then
ring1 = doPlayerAddItem(player1.uid,2121,1)
ring2 = doPlayerAddItem(cid,2121,1)
doPlayerSendTextMessage(cid,22,"Você aceitou o pedido de ".. nome2 .. " em casamento!")
doPlayerSendTextMessage(player1.uid,22,"".. nome .. " aceitou seu pedido! Sejam felizes para sempre!")
doSetItemSpecialDescription(ring1,"Com amor, ".. nome .. ".")
doSetItemSpecialDescription(ring2,"Com amor, ".. nome2 .. ".")
setPlayerStorageValue(player1.uid,2223,1)
setPlayerStorageValue(cid,2223,1)
setPlayerStorageValue(player1.uid,2222,-1)
setPlayerStorageValue(cid,2222,-1)
doPlayerRemoveItem(cid,2264,1)
else
doPlayerSendTextMessage(cid,22,"Algo ocorreu, certifique-se de que nenhum dos noivos é casado!")
end
return 1
end