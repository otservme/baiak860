function onSay(cid, words, param)
if getPlayerLevel(cid) <= 30 then
cost = 11000
else
cost = (200 * (getPlayerLevel(cid) - 30) + 2000) * 5 * 1.1
end
if getPlayerLevel(cid) >= 120 then
cost = 110000
end
if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) or getPlayerBlessing(cid, 4) or getPlayerBlessing(cid, 5) then
doPlayerSendCancel(cid,'You already have all the blessings.')
else
if doPlayerRemoveMoney(cid, cost) == TRUE then
doPlayerAddBlessing(cid, 1)
doPlayerAddBlessing(cid, 2)
doPlayerAddBlessing(cid, 3)
doPlayerAddBlessing(cid, 4)
doPlayerAddBlessing(cid, 5)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYAREA)
doPlayerSendTextMessage(cid,22,"You have been blessed by the Gods.")
else
doPlayerSendCancel(cid, "You do not have enough money to buy all the blessings.")
end
end
return TRUE
end