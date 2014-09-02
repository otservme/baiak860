function onUse(cid, item, frompos, item2, topos)
gatepos = {x=448, y=466, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 3006 and item.itemid == 1945 then
doCreateItem(1386,1,gatepos)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 3006 and item.itemid == 1946 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end
