function onUse(cid, item, frompos, item2, topos)
if item.uid == 8002 then
if item.itemid == 1946 then

player1pos = {x=621, y=611, z=7, stackpos=253}
player1 = getThingfromPos(player1pos)

if player1.itemid > 0 then

player1level = getPlayerLevel(player1.uid)

questlevel = 100

if player1level >= questlevel then

	frostfur1pos = {x=583, y=612, z=7}
	bloodpaw2pos = {x=569, y=612, z=7}
	bovinus3pos = {x=555, y=612, z=7}
	achad4pos = {x=542, y=612, z=7}
	colerian the barbarian5pos = {x=547, y=599, z=7}
	the hairy one6pos = {x=561, y=599, z=7}
	axeitus headbanger7pos = {x=575, y=599, z=7}
	rocky8pos = {x=567, y=586, z=7}
	cursed gladiator9pos = {x=553, y=586, z=7}
	orcus the cruel10pos = {x=599, y=573, z=7}

	doSummonCreature("Frostfur", frostfur1pos)
	doSummonCreature("Bloodpaw", bloodpaw2pos)
	doSummonCreature("Bovinus", bovinus3pos)
	doSummonCreature("Achad", achad4pos)
	doSummonCreature("Colerian The barbarian", colerian the barbarian5pos)
	doSummonCreature("The hairy one", the hairy one6pos)
	doSummonCreature("Axeitus headbanger", axeitus headbanger7pos)
	doSummonCreature("Rocky", rocky8pos)
	doSummonCreature("Cursed gladiator", cursed gladiator9pos)
	doSummonCreature("Orcus the cruel", orcus the cruel10pos)

	nplayer1pos = {x=585, y=612, z=7}

	doSendMagicEffect(player1pos,2)

	doTeleportThing(player1.uid,nplayer1pos)

	doSendMagicEffect(nplayer1pos,10)

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