function onUse(cid, item, frompos, item2, topos)
   	-- annihilator
   	if item.uid == 8004 then
   		if item.itemid == 1945 then
 
   			player1pos = {x=194, y=118, z=9, stackpos=253}
   			player1 = getThingfromPos(player1pos)
 
 
   			if player1.itemid > 0 then
 
   				player1level = getPlayerLevel(player1.uid)
 
   				questlevel = 10
 
   				if player1level then
 
   					queststatus1 = getPlayerStorageValue(player1.uid,8003)
   					 
   					if queststatus1 == -1 then
 
   						nplayer1pos = {x=193, y=118, z=10}

   						doSendMagicEffect(player1pos,2)
 
   						doTeleportThing(player1.uid,nplayer1pos)
 
   						doSendMagicEffect(nplayer1pos,10)
 
   						doTransformItem(item.uid,item.itemid+1)
 
   					else
   						doPlayerSendCancel(cid,"Somebody in your team has already done this quest.")
   					end
   				else
   					doPlayerSendCancel(cid,"All players must have level 10 to enter.")
   				end
   			else
   				doPlayerSendCancel(cid,"You need 4 players in your team.")
   			end
   		elseif item.itemid == 1946 then
   			if getPlayerAccess(cid) > 0 then
   				doTransformItem(item.uid,item.itemid-1)
   			else
   				doPlayerSendCancel(cid,"Sorry, not possible.")
   			end
   		end
 
   	end
   return 1
   end