function onUse(cid, item, pos, frompos, item2, topos)

pos = {x=585, y=612, z=7}
if item.itemid == 1945 and doPlayerRemoveMoney(cid,0) == 1 then
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 and doPlayerRemoveMoney(cid,2) == 1 then
doTransformItem(item.uid,item.itemid-1)

else
doPlayerSendCancel(cid,"Sorry, you don't have enough money!")
return 1



end

aceso = getPlayerAccess(cid)
msg = "Fight!"
msgN = ""
posplayer = getPlayerPosition(cid)

if item.uid == 8888 then
if aceso >= 0 then

doPlayerSendTextMessage(cid, 22, msg)
getThingfromPos(posplayer)
doSendMagicEffect(posplayer,2)
doTeleportThing(cid,pos)
doSendMagicEffect(pos,10)

else
doPlayerSendTextMessage(cid, 22, msgN)

end
end
end