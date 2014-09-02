function onUse(cid, item, frompos, item2, topos)
gateposu = {x=232, y=55, z=11, stackpos=1}
gateposd = {x=232, y=56, z=11, stackpos=1}
gatepost = {x=233, y=55, z=11, stackpos=1}
gateposq = {x=233, y=56, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)
if item.uid == 3021 and item.itemid == 1945 and getgate.itemid == 0 then
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 3021 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(407,1,gateposu)
doCreateItem(407,1,gateposd)
doCreateItem(407,1,gatepost)
doCreateItem(407,1,gateposq)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return 1
end