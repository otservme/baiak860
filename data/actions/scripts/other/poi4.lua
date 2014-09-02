---VocDoor-by Sky Hunter---
function onUse(cid, item, frompos, item2, topos)
PlayerVoc = getPlayerVocation(cid)
if PlayerVoc == 8 then
doTeleportThing(cid,{x=49, y=18, z=8})
   else
doPlayerSendCancel(cid,"Only Elite Knights may open this door.")
       return 1
   end
end