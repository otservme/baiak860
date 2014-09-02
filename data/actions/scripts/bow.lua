--------Boots of Waterwalking system v2.0 by Colex-------------
function onUse(cid, item, frompos, item2, topos)

tempo = 10

tempo2 = tempo + 60
pos = getPlayerPosition(cid)
tilepos = {x=pos.x, y=pos.y, z=pos.z, stackpos=0}
tile = getThingfromPos(tilepos)
storage = 1533
storage2 = 1534
storage3 = 1535
bow = getPlayerStorageValue(cid,storage2)
bow2 = getPlayerStorageValue(cid,storage3)
timer1 = getPlayerStorageValue(cid,storage)
timer2 = os.time()

time = os.difftime(timer2, timer1)

add = timer2 + 1

if item.itemid == 2640 then
 if bow2 == -1 then
   setPlayerStorageValue(cid,storage,add)
   setPlayerStorageValue(cid,storage2,-1)
   setPlayerStorageValue(cid,storage3,1)
   doRemoveItem(item.uid,1)
 else
   doPlayerSendCancel(cid,"You are already using Boots of WaterWalking.")
 end
return 1
end

if item.itemid ~= 2640 then
 if timer1 >= 0 then
   if time <= tempo then
     doTeleportThing(cid,topos)
   else
     doPlayerSendTextMessage(cid,22,"time out! Please use the boots of waterwalking again if you want to continue.")
     if bow > -2 then   
     doPlayerAddItem(cid,2640,1)
     setPlayerStorageValue(cid,storage2,-2)
     setPlayerStorageValue(cid,storage3,-1)
     end
     if time >= tempo2 then
       if tile.itemid >= 4608 and tile.itemid <= 4625 then
         doTeleportThing(cid,getPlayerMasterPos(cid))
         doPlayerSendTextMessage(cid,22,"time out")
         setPlayerStorageValue(cid,storage,-1)
         setPlayerStorageValue(cid,storage2,-1)
       else
         doPlayerSendTextMessage(cid,22,"time out")
         setPlayerStorageValue(cid,storage,-1)
         setPlayerStorageValue(cid,storage2,-1)
       end
     end
   end
 else
   return 0
 end
end
return 1
end 