--Picking--
 
  function onUse(cid, item, frompos, item2, topos)
  pedrapos = {x=topos.x, y=topos.y, z=topos.z, stackpos=1}
  pedra = getThingfromPos(pedrapos)

if pedra.itemid == 1285 then

sorte = math.random(1,50)

if sorte == 10 then
doSendMagicEffect(topos,3)
doPlayerAddItem(cid,2150,1)
doPlayerSendTextMessage(cid,22,"Wow, an amethyst!")

elseif sorte == 13 then
doSendMagicEffect(topos,3)
doPlayerAddItem(cid,2149,1)
doPlayerSendTextMessage(cid,22,"Wow, an emerald!")

elseif sorte == 16 then
doSendMagicEffect(topos,3)
doPlayerAddItem(cid,2147,1)
doPlayerSendTextMessage(cid,22,"Wow, a ruby!")

elseif sorte == 20 then
doSendMagicEffect(topos,3)
doPlayerAddItem(cid,2146,1)
doPlayerSendTextMessage(cid,22,"Wow, a sapphire!")

elseif sorte == 25 then
doSendMagicEffect(topos,3)
doPlayerAddItem(cid,2145,1)
doPlayerSendTextMessage(cid,22,"Wow, an diamond!")

elseif sorte == 3 then
doSummonCreature('Stone Golem',topos)

elseif sorte == 5 then
doSummonCreature('Gargoyle',topos)

elseif sorte == 3 or 5 or 10 or 13 or 16 or 20 or 25 then

doSendMagicEffect(topos,3)

end
else
return 0
end
 return 1
 end