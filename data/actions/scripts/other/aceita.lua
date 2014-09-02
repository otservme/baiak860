function onUse(cid, item, frompos, item2, topos)

--Nao Mecha--
player1pos = {x=topos.x, y=topos.y, z=topos.z, stackpos=253}
player1 = getThingfromPos(player1pos)
nome = getPlayerName(cid)
nome2 = getPlayerName(player1.uid)
sexo = getPlayerSex(cid)
sexo2 = getPlayerSex(player1.uid)
casado = getPlayerStorageValue(cid,2223)
casado2 = getPlayerStorageValue(player1.uid,2223)

----

if sexo == 1 and sexo ~= sexo2 and casado ~= 1 and casado2 ~= 1 then
runasim = doPlayerAddItem(player1.uid,2264,1)
setPlayerStorageValue(cid,2222,1)
setPlayerStorageValue(player1.uid,2222,1)
doPlayerSendTextMessage(cid,22,"Você pediu ".. nome2 .. " em casamento, tomara que ela aceite!")
doPlayerSendTextMessage(player1.uid,22,"".. nome .. "te pediu em casamento, para aceitar use a runa de casamento nele!")
doSetItemSpecialDescription(runasim, "Use em ".. nome .. ", para aceitar o pedido dele!")
doPlayerRemoveItem(cid,2263,1)
else
doPlayerSendTextMessage(cid,22,"Algo ocorreu, certifique-se de que nenhum dos noivos é casado!")
end
return 1
end