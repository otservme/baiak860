function onUse(cid, item, frompos, item2, topos)
	mag = getPlayerMagLevel(cid)
	if mag >= 1 then
		doSendAnimatedText(getPlayerPosition(cid), "Aaaah...", TEXTCOLOR_ORANGE)
		doPlayerAddMana(cid, math.random(250, 500))
		doSendMagicEffect(topos, 1)

		if item.type > 1 then
			doChangeTypeItem(item.uid,item.type-1)
		else
			doRemoveItem(item.uid,1)
		end
	else
		doSendMagicEffect(frompos,2)
		doPlayerSendCancel(cid,"You don't have the required magic level to use that rune.")
	end
	
	return 1
end