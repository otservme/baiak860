--Function by Ta4e 28/09/2008--
--90% Arena quest in tibia rl--
--Version 4.0--

function onUse(cid, item, fromPosition, itemEx, toPosition)


--Storages of Arena NPC--
greenhorn = 5000 
scrapper = 5001
warlord = 5002 

starting={x=90, y=45, z=7, stackpos=253}
ending={x=143, y=109, z=7, stackpos=253}
trash= {x=100, y=70, z=9}


---------------------------------------------------------------------------------------------------------------------
greenhornstatus = getPlayerStorageValue(cid,greenhorn)
scrapperstatus = getPlayerStorageValue(cid,scrapper)
warlordstatus = getPlayerStorageValue(cid,warlord)
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}

if item.itemid == 5132 and item.actionid == 60000 then
if warlordstatus == 1 or scrapperstatus == 1 or greenhornstatus == 1 then
players=0
totalmonsters=0
monster = {}
repeat
creature= getThingfromPos(checking)
if creature.itemid > 0 then
if getPlayerAccess(creature.uid) == 0 then
players=players+1
end
  if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
totalmonsters=totalmonsters+1
  monster[totalmonsters]=creature.uid
   end
end
checking.x=checking.x+1
  if checking.x>ending.x then
  checking.x=starting.x
  checking.y=checking.y+1
end
until checking.y>ending.y
if players==0 then
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters

doTransformItem(item.uid, 5133)
doTeleportThing(cid, toPosition, TRUE)

end
else
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need permission of Halvar to enter in Arena.")
    end

end
end