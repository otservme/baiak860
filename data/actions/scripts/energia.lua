function onUse(cid, item, frompos, item2, topos)

item1pos = {x=998, y=993, z=8, stackpos=255} --posição da arma normal
item3pos = {x=1000, y=993, z=8, stackpos=255} --posição em que arma de energia aparecerá
item1 = getThingfromPos(item1pos)
item3 = getThingfromPos(item3pos)


if item.itemid == 1945 and item1.itemid == 2383 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7869,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7383 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7870,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7384 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7871,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7406 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7872,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7402 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7873,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2429 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7874,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2430 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7875,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7389 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7876,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7380 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7877,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2454 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7878,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2423 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7879,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2445 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7880,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7415 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7881,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7392 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7882,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2391 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7883,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.uid == 9013 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
else
return 0
end

return 1

end