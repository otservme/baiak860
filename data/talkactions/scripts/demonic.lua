function onSay(cid, words, param)
if doPlayerRemoveItem(cid,6500,200) then
doPlayerAddItem(cid,6433,1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MORTAREA)
doCreatureSay(cid, "!necromancer", TALKTYPE_ORANGE_1)
else
doPlayerSendCancel(cid, 'You do not have 200 demonic essence.')
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FLAMEAREA)
end
end  