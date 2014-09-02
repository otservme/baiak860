--action by Thotth for OT 7.5--

-- Variaveis usadas:

-- nplayer?pos = para onde o player sera teletransportado.
--

function onUse(cid, item, frompos, item2, topos)
if item.uid == 3561 then
if item.itemid == 8836 then

nplayer1pos = {x=22, y=112, z=8}

doTeleportThing(cid,nplayer1pos)

doSendMagicEffect(nplayer1pos,10)

doSendMagicEffect(topos,6)

doSendMagicEffect(frompos,6)

end
end
return 1
end