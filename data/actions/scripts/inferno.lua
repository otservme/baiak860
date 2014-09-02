function onUse(cid, item, frompos, item2, topos)
if item.uid == 7965 then
if item.itemid == 1445 then

 nplayer1pos = {x=282, y=220, z=7}

 doTeleportThing(cid,nplayer1pos)
doSendMagicEffect(nplayer1pos,10) 

end
end
return 1
end