function onUse(cid, item, frompos, item2, topos)
gatepos = {x=125, y=99, z=4, stackpos=1}
getgate = getThingfromPos(gatepos)
if item.uid == 3002 <unicID q vai na alavanca and item.itemid == 1945 <-- alavanca and getgate.itemid == 1355 <--gate then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 3002 and item.itemid == 1946 <-- alavanca and getgate.itemid == 0 then
doCreateItem(1355,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return 1
end