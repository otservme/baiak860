--Cyber's REPutation System Rev5.0 
function onSay(cid, words, param, channel)	
	if param == '' then 
		doPlayerSendCancel(cid, 'Command requires a player\'s name.') 
	return true 
	end
       
	local target, oldTime = getPlayerByName(param), getPlayerStorageValue(cid, rep.lastTime)
	
	if not isPlayer(target) then 
		doPlayerSendCancel(cid, 'That player does not exist or is offline.') 
	return true 
	end
	
	if oldTime == -1 then 
		setPlayerStorageValue(cid, rep.lastTime, os.time()) 
	end
                                  
	if getPlayerLevel(cid) < rep.minLevel then
		doPlayerSendCancel(cid,'You may repute from level ' .. rep.minLevel ..' onwards.')
	return true
	end
      
	if getPlayerGUID(target) == getPlayerStorageValue(cid, rep.lastName) then
		doPlayerSendCancel(cid, 'You may not repute that player two times in a row.')  
	return true
	end
	
	if (os.time() - oldTime) < rep.interval then
		doPlayerSendCancel(cid, 'You may repute in ' .. rep.getTime(oldTime - os.time()) .. ' [' .. os.date("%b.%d %X", oldTime + rep.interval) ..']')
	return true
	end
                    
	if getPlayerIp(cid) == getPlayerIp(target) then
		doPlayerSendCancel(cid, 'You may not repute neither yourself nor someone in your IP.')  
	return true
	end
			
	if words == '!hail' then
		setPlayerStorageValue(cid, rep.lastName, getPlayerGUID(target))
		rep.add(target, rep.getPower(cid), TEXTCOLOR_LIGHTBLUE)
		setPlayerStorageValue(cid, rep.lastTime, os.time())
		doPlayerSendCancel(cid, 'You have just reputed ' .. getCreatureName(target))
	elseif words == '!fuck' then
		setPlayerStorageValue(cid, rep.lastName, getPlayerGUID(target))
		rep.remove(target, rep.getPower(cid), TEXTCOLOR_RED)
		setPlayerStorageValue(cid, rep.lastTime, os.time())
		doPlayerSendCancel(cid, 'You have just reputed ' .. getCreatureName(target))
	end
return true
end