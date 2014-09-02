function onUse(cid, item, frompos, item2, topos)

item1pos = {x=1004, y=997, z=8, stackpos=255} --posição da arma normal
item3pos = {x=1004, y=999, z=8, stackpos=255} --posição em que arma de terra aparecerá
item1 = getThingfromPos(item1pos)
item3 = getThingfromPos(item3pos)


if item.itemid == 1945 and item1.itemid == 2383 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7854,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7383 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7855,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7384 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7856,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7406 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7857,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7402 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7858,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2429 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7859,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2430 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7860,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7389 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7861,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7380 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7862,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2454 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7863,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2423 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7864,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2445 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7865,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7415 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7866,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 7392 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7867,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.itemid == 1945 and item1.itemid == 2391 then
doRemoveItem(item1.uid,1)
doSendMagicEffect(item1pos,13)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(7868,1, item3pos)
doSendMagicEffect(item3pos,13)

elseif item.uid == 9012 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
else
return 0
end

return 1

end