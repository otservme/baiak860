-- fluids by atolon --

  function onUse(cid, item, frompos, item2, topos)
  	-- itemid means that is a creature
  	if item2.itemid == 1 then
  		if item.type == 0 then
  			doPlayerSendCancel(cid,"It is empty.")
  		else
  			if item2.uid == cid then
  				doChangeTypeItem(item.uid,0)
  				if item.type == 2 then
  					doPlayerSay(cid,"it was blood....",16)
  				elseif item.type == 4 then
  					doPlayerSay(cid,"it was slime!!",16)
                                          doSendMagicEffect(topos,8)
  				elseif item.type == 3 then
doPlayerSay(cid,"hit! hit! fresh beer!!",16)
doPlayerSetDrunk(cid,60*1000)
  				elseif item.type == 5 then
  					doPlayerSay(cid,"it was fresh lemonade!!",16)
  				elseif item.type == 11 then
  					doPlayerSay(cid,"arrg is oil!!",16)
  				elseif item.type == 15 then
doPlayerSay(cid,"hit! hit! is wine",16)
doPlayerSetDrunk(cid,60*1000)
  				elseif item.type == 6 then
  					doPlayerSay(cid,"ohh is milk!",16)
  				elseif item.type == 10 then
  					doPlayerAddHealth(cid,100)
                                          doSendMagicEffect(topos,12)
  				elseif item.type == 13 then
  					doPlayerSay(cid,"arrg is urine!",16)
  	elseif item.type == 7 then
	                                random_number = math.random(30,100)
					doPlayerAddMana(cid,random_number)
                                        doSendMagicEffect(topos,12)
					doPlayerSay(cid,"Aaaaah...",1)
  				elseif item.type == 19 then
  					doPlayerSay(cid,"arrg is mud!",16)
  				elseif item.type == 26 then
  					doPlayerSay(cid,"arrg hot on my mouth!",16)
                                          doSendMagicEffect(topos,6)
  				elseif item.type == 28 then
  					doPlayerSay(cid,"arrg swamp water!",16)
                                          doSendMagicEffect(topos,8)
  				else
  					doPlayerSay(cid,"Gulp.",1)
  				end
  			else
  				splash = doCreateItem(2833,item.type,topos)
  				doChangeTypeItem(item.uid,0)
  				doDecayItem(splash)
  			end
  		end
  --water--
  	elseif (item2.itemid >= 601 and item2.itemid <= 604) or
  		(item2.itemid >= 729 and item2.itemid <= 740) then
  		doChangeTypeItem(item.uid,1)

  --mud--
  	elseif item2.itemid == 103 then
  		doChangeTypeItem(item.uid,19)
  --lava--
  	elseif (item2.itemid >= 709 and item2.itemid < 712) or item2.itemid == 2119 then
  		doChangeTypeItem(item.uid,26)
  --mud--
  	elseif (item2.itemid >= 351 and item2.itemid <= 355) then
  		doChangeTypeItem(item.uid,19)

  --swamp--
  	elseif (item2.itemid >= 713 and item2.itemid <= 716) then
  		doChangeTypeItem(item.uid,28)
  --cask--
  	elseif item2.itemid == 2488 then
  		doChangeTypeItem(item.uid,1)  --water--
  	elseif item2.itemid == 2489 then
  		doChangeTypeItem(item.uid,3)  --beer--
  	elseif item2.itemid == 2490 then
  		doChangeTypeItem(item.uid,15) --wine--

  --end cask--

  -- Blood/swamp in decayto corpse --NO FINISH--

  	elseif item2.itemid > 3922 and item2.itemid < 4327 then
  		doChangeTypeItem(item.uid,2)

  -- End Blood/swamp in decayto corpse --NO FINISH--

  	else
  		if item.type == 0 then
  			doPlayerSendCancel(cid,"It is empty.")
  		else
  			splash = doCreateItem(2833,item.type,topos)
  			doChangeTypeItem(item.uid,0)
  			doDecayItem(splash)
  		end
  	end

  	return 1
  end
