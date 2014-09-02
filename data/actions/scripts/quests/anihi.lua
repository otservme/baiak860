function onUse(cid, item, frompos, item2, topos)
if item.uid == 7000 then
if item.itemid == 1946 then

player1pos = {x=194, y=118, z=9, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=193, y=118, z=9, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=192, y=118, z=9, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=191, y=118, z=9, stackpos=253}
player4 = getThingfromPos(player4pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)
player3level = getPlayerLevel(player3.uid)
player4level = getPlayerLevel(player4.uid)

questlevel = 100

if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

	demon1pos = {x=190, y=116, z=10}
	demon2pos = {x=192, y=116, z=10}
	demon3pos = {x=191, y=120, z=10}
	demon4pos = {x=193, y=120, z=10}
	demon5pos = {x=194, y=118, z=10}
	demon6pos = {x=195, y=118, z=10}

	doSummonCreature("Demon", demon1pos)
	doSummonCreature("Demon", demon2pos)
	doSummonCreature("Demon", demon3pos)
	doSummonCreature("Demon", demon4pos)
	doSummonCreature("Demon", demon5pos)
	doSummonCreature("Demon", demon6pos)

	nplayer1pos = {x=193, y=118, z=10}
	nplayer2pos = {x=192, y=118, z=10}
	nplayer3pos = {x=191, y=118, z=10}
	nplayer4pos = {x=190, y=118, z=10}

	doSendMagicEffect(player1pos,2)
	doSendMagicEffect(player2pos,2)
	doSendMagicEffect(player3pos,2)
	doSendMagicEffect(player4pos,2)

	doTeleportThing(player1.uid,nplayer1pos)
	doTeleportThing(player2.uid,nplayer2pos)
	doTeleportThing(player3.uid,nplayer3pos)
	doTeleportThing(player4.uid,nplayer4pos)

	doSendMagicEffect(nplayer1pos,10)
	doSendMagicEffect(nplayer2pos,10)
	doSendMagicEffect(nplayer3pos,10)
	doSendMagicEffect(nplayer4pos,10)

	doTransformItem(item.uid,1945)

	else
	doPlayerSendCancel(cid,"All players must have level 100 to enter.")
	end
	else
	doPlayerSendCancel(cid,"You need 4 players in your team.")
end
end
if item.itemid == 1945 then

starting={x=188, y=111, z=10, stackpos=253}
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
ending={x=210, y=122, z=10, stackpos=253}
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
trash= {x=233, y=125, z=10}
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters
doTransformItem(item.uid,1946)
end


end
end
if item.uid == 5006 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
doPlayerAddItem(cid,2494,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5007 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
doPlayerAddItem(cid,2400,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5008 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
doPlayerAddItem(cid,2431,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5009 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a Thunder Hammer.")
doPlayerAddItem(cid,2421,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end