--Cyber's Reputation System Rev5.0 
function onSay(cid, words, param, channel)
	local points, lastName, action = rep.getPoints(cid), getPlayerStorageValue(cid, rep.lastName), false
	doPlayerSendTextMessage(cid, 19, 'You have ' .. rep.formatNum(points, ",")  .. ' reputation points. You are ' .. rep.getRank(points) .. '\nYour Rep Power is ' .. rep.getPower(points) ..'. ' .. (getPlayerStorageValue(cid, rep.lastName) ~= -1 and 'You last reputed ' .. getPlayerNameByGUID(lastName) .. '.' or ''))
 
	if points > 4999 then --female rep+++ queen outfit
		disguise, text, action = (getPlayerSex(cid) == 0 and {lookType = 331} or {lookType = 332}), (getPlayerSex(cid) == 0 and 'Queen!!' or 'King!!'), true
	elseif points > 1999 then --rep++ cm outfit
		disguise, text, action = {lookType = 73}, 'Hero!!', true
	elseif points > 1499 then --rep+ hero outfit
		disguise, text, action = {lookType = 63}, 'Acclaimed!!', true
	elseif points < -4999 then --rep*** devil outfit
		disguise, text, action = {lookType = 334}, 'P.O.!', true
	elseif points < -1999  then --rep** pig outfit 
		disguise, text, action = {lookType = 306}, 'Evil!!', true
	elseif points < -1499 then --rep* orc outfit 
		disguise, text, action = {lookType = 5}, "Slayer!!", true   
	end
	
	if action and getCreatureOutfit(cid).lookType ~= disguise.lookType then
		doSetCreatureOutfit(cid, disguise, -1)
		doSendAnimatedText(getCreaturePosition(cid), text, math.random(1,255))
	return true
	end	
return true
end