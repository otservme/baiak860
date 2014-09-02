function onUse(cid, item, frompos, item2, topos)
if item.uid == 7964 then
if item.itemid == 1369 then

 nplayer1pos = {x=107, y=67, z=8}

 doTeleportThing(cid,nplayer1pos)

end
end
return 1
end