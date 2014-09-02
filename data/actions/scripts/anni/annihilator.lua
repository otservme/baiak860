function onUse(cid, item, frompos, item2, topos)
if item.uid == 5000 then
 if item.itemid == 1946 then

 player1pos = {x=33222, y=31671, z=13, stackpos=253}
 player1 = getThingfromPos(player1pos)

 player2pos = {x=33223, y=31671, z=13, stackpos=253}
 player2 = getThingfromPos(player2pos)

 player3pos = {x=33224, y=31671, z=13, stackpos=253}
 player3 = getThingfromPos(player3pos)

 player4pos = {x=33225, y=31671, z=13, stackpos=253}
 player4 = getThingfromPos(player4pos)


	 if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

  player1level = getPlayerLevel(player1.uid)
  player2level = getPlayerLevel(player2.uid)
  player3level = getPlayerLevel(player3.uid)
  player4level = getPlayerLevel(player4.uid)

  questlevel = 100

  if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

	  queststatus1 = getPlayerStorageValue(player1.uid,5000)
	  queststatus2 = getPlayerStorageValue(player2.uid,5000)
	  queststatus3 = getPlayerStorageValue(player3.uid,5000)
	  queststatus4 = getPlayerStorageValue(player4.uid,5000)

	  if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then

	--if 1==1 then
	demon1pos = {x=32224, y=31659, z=13}
	demon2pos = {x=32223, y=31659, z=13}
	demon3pos = {x=32221, y=31657, z=13}
	demon4pos = {x=33219, y=31657, z=13}
	demon5pos = {x=32222, y=31661, z=13}
	demon6pos = {x=32320, y=31661, z=13}
	
 
   doSummonCreature("Demon", demon1pos)
   doSummonCreature("Demon", demon2pos)
   doSummonCreature("Demon", demon3pos)
   doSummonCreature("Demon", demon4pos)
   doSummonCreature("Demon", demon5pos)
   doSummonCreature("Demon", demon6pos)
  

	nplayer1pos = {x=33219, y=31659, z=13}
	nplayer2pos = {x=33220, y=31659, z=13}
	nplayer3pos = {x=33221, y=31659, z=13}
	nplayer4pos = {x=33222, y=31659, z=13}

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
	 doPlayerSendCancel(cid,"Sorry, not possible.")
	end
   else
	doPlayerSendCancel(cid,"Sorry, not possible.")
   end
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
  end
  end
 if item.itemid == 1945 then
-- Here is the code start:
starting={x=33217, y=31655, z=13, stackpos=253}
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
ending={x=33224, y=31663, z=13, stackpos=253}
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
trash= {x=33193, y=31689, z=15}
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters
doTransformItem(item.uid,1946)
end
-- Here is the end of it

end
end
 return 1
end
