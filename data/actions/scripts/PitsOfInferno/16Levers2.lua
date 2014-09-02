function onUse(cid, item, frompos, item2, topos)
 
if item.actionid == 10284 then

leverpos1 = {x=450, y=1412, z=11, stackpos=1}
lever1 = getThingfromPos(leverpos1)
leverpos2 = {x=454, y=1385, z=12, stackpos=1}
lever2 = getThingfromPos(leverpos2)
leverpos3 = {x=493, y=1390, z=12, stackpos=1}
lever3 = getThingfromPos(leverpos3)
leverpos4 = {x=491, y=1418, z=12, stackpos=1}
lever4 = getThingfromPos(leverpos4)
leverpos5 = {x=457, y=1419, z=12, stackpos=1}
lever5 = getThingfromPos(leverpos5)
leverpos6 = {x=467, y=1417, z=12, stackpos=1}
lever6 = getThingfromPos(leverpos6)
leverpos7 = {x=481, y=1407, z=13, stackpos=1}
lever7 = getThingfromPos(leverpos7)

wallpos = {x=459, y=1386, z=11, stackpos=1}
wall = getThingfromPos(wallpos)

--[right][right][left][left][right]--

if item.itemid == 1945 then
    doTransformItem(item.uid,1946)
  elseif item.itemid == 1946 then
    doTransformItem(item.uid,1945)
end

if (item.actionid == 10284 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and wall.itemid == 0) then
doCreateItem(1304,1,wallpos)
elseif (item.actionid == 10284 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and wall.itemid == 1304) then
doRemoveItem(wall.uid,1)
else 
doPlayerSendCancel(cid,"Sorry, not possible.") 
end 
end
end



