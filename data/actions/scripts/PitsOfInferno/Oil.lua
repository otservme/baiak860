function onUse(cid, item, frompos, item2, topos)
wall1 = {x=409, y=1389, z=10, stackpos=1}
getwall1 = getThingfromPos(wall1) 
splash = {x=402, y=1390, z=10, stackpos=1}
oil = getThingfromPos(splash)

if item.uid == 10203 and item.itemid == 1945 and oil.itemid == 2025 and oil.type == 11 and getwall1.uid > 0 then
   doRemoveItem(oil.uid,1)
   doRemoveItem(getwall1.uid,1)
   doSendMagicEffect(splash,13)
   doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 10203 and item.itemid == 1946 then
   doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid, 22, 'The lever is creaking and rusty.')
end
end