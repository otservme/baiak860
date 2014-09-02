-----------------------------------------
--------By Alisson Linneker----------
---------www.alisson.vai.la-----------
-----------------------------------------
--------------XTibia User--------------
------------www.xtibia.com-----------
-----------------------------------------


function onUse(cid, item, frompos, item2, topos)

-------------------- Configurações (Altere)
--- ID GLOBAL (WAR ON/OFF)
global_id = 6550
------- Tente não alterar os IDs do script pois, se alterar aqui, terá de alterar em outros scripts!
alavanca_id1 = 1945 --- ID da alavanca
alavanca_id2 = 1946 --- ID da alavanca
liber_alavanca = 6560 --- UNIQUE ID da alavanca que irá reiniciar os castelos (Opcional adicionar no mapa, pois existe o comando)

access = 5 --- Nível de access para reiniciar os castelos (normal: 5, GOD)

--- UNIQUE ID´s QUE SERÃO ADICIONADAS NAS ALAVANCAS NO CASTELO:
castelos_id = 6564 --- UNIQUE ID representando o primeiro castelo
castelos_id2 = 6565 --- UNIQUE ID representando o segundo castelo
castelos_id3 = 6460 --- UNIQUE ID representando o terceiro castelo
castelos_id4 = 6461 --- UNIQUE ID representando o quarto castelo
castelos_id5 = 6462 --- UNIQUE ID representando o quinto castelo

--- NOMES DOS CASTELOS:
castelo1 = "Normahn" --- Nome do primeiro castelo
castelo2 = "Sleifyr" --- Nome do segundo castelo
castelo3 = "Daraphin" --- Nome do terceiro castelo
castelo4 = "Morgrart" --- Nome do quarto castelo
castelo5 = "Tehlos" --- Nome do quinto castelo

efeito = 11 --- ID da cor da fala do jogador (normal: 11, vermelho)
lv_min = 75 --- Level mínimo para dominar castelos (normal: 20)
efeito_msg = 13 --- ID do efeito das mensagens de erros (normal: 13, vermelho)

------- Configurações Avançadas
--- Códigos Prelinimares
if item.uid == castelos_id then
castelo = castelo1
elseif item.uid == castelos_id2 then
castelo = castelo2
elseif item.uid == castelos_id3 then
castelo = castelo3
elseif item.uid == castelos_id4 then
castelo = castelo4
elseif item.uid == castelos_id5 then
castelo = castelo5
elseif item.uid == liber_alavanca then
castelo = 0
end

nick = getPlayerName(cid)
lv = getPlayerLevel(cid)
guild = getPlayerGuildName(nick)
verif = getPlayerGuildId(nick)
global_search = getGlobalStorageValue(item.uid)
per_search = getPlayerStorageValue(cid, item.uid)
ppos = getPlayerPosition(cid)
error = 0

--- Mensagem. Quando o jogador tem uma guild
msg_guild = "Eu, " .. nick .. ", da Guild " .. guild .. ", dominei o castelo " .. castelo .. "!!"

--- Mensagem. Quando o jogador não tem guild
msg_noguild = "Eu, " .. nick .. ", dominei o castelo " .. castelo .. "!!"

--- Erro. Quando o jogador não tem o level requerido para dominar castelos
no_lv = "Voce precisa ter level " .. lv_min .. " ou superior para dominar castelos."

--- Erro. Quando o castelo já foi dominado por alguém e o jogador não pertence à um castelo
castle_domin = "Este castelo ja foi dominado, tente na proxima vez."

--- Erro. Quando o jogador não tem access para reiniciar castelos
access_error = "Voce nao tem capacidade para reiniciar castelos."

--- Mensagem. Quando o jogador que tem access para reiniciar castelos reinicia
castle_restart = "Os castelos foram reiniciados com sucesso."

--- Erro. Quando a guerra está desativada.
off_msg = "Os castelos nao estao em guerra."

-------------------- Códigos (Não altere)
if getGlobalStorageValue(global_id) == 1 then
if item.uid < liber_alavanca or item.uid > liber_alavanca then

if lv >= lv_min then

if global_search <= 0 or per_search == 1 then

if verif > 0 then
doPlayerSay(cid,msg_guild, efeito)
else
doPlayerSendTextMessage(cid,22,msg_noguild)
pos = getPlayerPosition(cid)
doSendMagicEffect(pos,efeito)
end
setGlobalStorageValue(item.uid, 1)
if item.uid == castelos_id then
setPlayerStorageValue(cid, item.uid, 0)
setPlayerStorageValue(cid, castelos_id2, 1)
setPlayerStorageValue(cid, castelos_id3, 1)
setPlayerStorageValue(cid, castelos_id4, 1)
setPlayerStorageValue(cid, castelos_id5, 1)
elseif item.uid == castelos_id2 then
setPlayerStorageValue(cid, castelos_id, 1)
setPlayerStorageValue(cid, item.uid, 0)
setPlayerStorageValue(cid, castelos_id3, 1)
setPlayerStorageValue(cid, castelos_id4, 1)
setPlayerStorageValue(cid, castelos_id5, 1)
elseif item.uid == castelos_id3 then
setPlayerStorageValue(cid, castelos_id, 1)
setPlayerStorageValue(cid, castelos_id2, 1)
setPlayerStorageValue(cid, item.uid, 0)
setPlayerStorageValue(cid, castelos_id4, 1)
setPlayerStorageValue(cid, castelos_id5, 1)
elseif item.uid == castelos_id4 then
setPlayerStorageValue(cid, castelos_id, 1)
setPlayerStorageValue(cid, castelos_id2, 1)
setPlayerStorageValue(cid, castelos_id3, 1)
setPlayerStorageValue(cid, item.uid, 0)
setPlayerStorageValue(cid, castelos_id5, 1)
elseif item.uid == castelos_id5 then
setPlayerStorageValue(cid, castelos_id, 1)
setPlayerStorageValue(cid, castelos_id2, 1)
setPlayerStorageValue(cid, castelos_id3, 1)
setPlayerStorageValue(cid, castelos_id4, 1)
setPlayerStorageValue(cid, item.uid, 0)
end

else
doPlayerSendTextMessage(cid,efeito_msg,castle_domin)
error = 1

end
else
doPlayerSendTextMessage(cid,efeito_msg,no_lv)
error = 1
end

end



if item.uid == liber_alavanca then
if getPlayerAccess(cid) >= access then
setGlobalStorageValue(castelos_id, 0)
setGlobalStorageValue(castelos_id2, 0)
setGlobalStorageValue(castelos_id3, 0)
setGlobalStorageValue(castelos_id4, 0)
setGlobalStorageValue(castelos_id5, 0)
doPlayerSendTextMessage(cid,efeito_msg,castle_restart )
else
doPlayerSendTextMessage(cid,efeito_msg,access_error)
error = 1
end
end

if error == 0 then
if item.itemid == alavanca_id1 then
doTransformItem(item.uid,alavanca_id2)
elseif item.itemid == alavanca_id2 then
doTransformItem(item.uid,alavanca_id1)
end
end
else
setGlobalStorageValue(global, 0)
doPlayerSendTextMessage(cid,efeito_msg,off_msg)
error = 1
end
end