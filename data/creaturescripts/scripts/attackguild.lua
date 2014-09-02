function onAttack(cid, target)

  if isPlayer(target) and getPlayerGuildId(cid) == getPlayerGuildId(target) then
     local storageId = 101
     
   if getPlayerStorageValue(cid, storageId) == 1 then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You choose not to attack and not to be attacked by guild members.")
     doCreatureSetSkullType(cid, 0) 
	 return false
   elseif getPlayerStorageValue(target, storageId) == 1 then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your target choose to not to attack and not to be attacked by guild members.")
      doCreatureSetSkullType(cid, 0) 
	  return false
   end
  end
  
return true
end
   