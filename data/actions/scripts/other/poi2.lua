---VocDoor-by Sky Hunter---
function onUse(cid, item, frompos, item2, topos)
PlayerVoc = getPlayerVocation(cid)
if PlayerVoc == 6 then
doTeleportThing(cid,{x=49, y=30, z=8})
   else
doPlayerSendCancel(cid,"Only Elder Druids may open this door.")
       return 1
   end
end
