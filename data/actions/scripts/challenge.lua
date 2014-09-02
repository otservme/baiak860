function onAddItem(moveitem, tileitem, pos)
beforepos = {x=160,y=52,z=8,stackpos=253}
before = getThingfromPos(beforepos)
telepos = {x=330,y=634,z=6}
apos = {x=160,y=51,z=8}
if moveitem.itemid == 8976 then
if pos.x == apos.x and pos.y == apos.y and pos.z == apos.z then
if before.itemid > 0 then
doTeleportThing(before.uid,telepos)
doSendMagicEffect(beforepos,12)
doSendMagicEffect(telepos,10)
doSendMagicEffect(pos,15)
doRemoveItem(moveitem.uid,moveitem.type)
else
doSendMagicEffect(pos,15)
doRemoveItem(moveitem.uid,moveitem.type)
end
end
end
return 1
end