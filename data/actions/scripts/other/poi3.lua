---VocDoor-by Sky Hunter---
function onUse(cid, item, frompos, item2, topos)
PlayerVoc = getPlayerVocation(cid)
if PlayerVoc == 7 then
doTeleportThing(cid,{x=51, y=20, z=8})
   else
doPlayerSendCancel(cid,"Only Royal Paladins may open this door.")
       return 1
   end
end