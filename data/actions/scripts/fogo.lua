function onUse(cid, item, frompos, item2, topos)

item1pos = {x=470, y=347, z=7, stackpos=255} --posição da arma normal
item3pos = {x=470, y=350, z=7, stackpos=255} --posição em que arma de fogo aparecerá
item1 = getThingfromPos(item1pos)
item3 = getThingfromPos(item3pos)


if item.itemid == 1945 and item1.itemid == 2383 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7744,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7383 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7745,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7384 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7746,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7406 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7747,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7402 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7748,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2429 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7749,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2430 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7750,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7389 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7751,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7380 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7752,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2454 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7753,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2423 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7754,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2445 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7755,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7415 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7756,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7392 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7757,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2391 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7758,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.uid == 9010 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
else
return 0
end

return 1

end