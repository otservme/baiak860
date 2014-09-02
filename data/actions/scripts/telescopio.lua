function onUse(cid, item, frompos, item2, topos)
sorte = math.random(1,7)
pos = getPlayerPosition(cid)

if item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 1 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"As nuvens estão incubrindo o Céu")
	
elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 2 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"Uma chuva de meteoros.")  

elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 3 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"Você viu o Cruzeiro do sul.")
  

elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 4 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"As formação das estrelas favorece o ganho de muitos gps")


elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 5 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"O encontro de Vênus com marte mostram que você irá bem nos negócios.")


elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 6 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"Júpter está bem perto!!")
  

elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 7 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"A lua está toda furada parecendo queijo suíço.")
	
end 
return 1
end