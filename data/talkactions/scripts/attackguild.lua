--script by Notorious
function onSay(cid, words, param)

 local storageId = 101
 
 if isPlayerPzLocked(cid) then
    doPlayerSendCancel(cid, "You cannot use this command during battle.")
    return true
 end
 
 if getPlayerGuildId(cid) <= 0  then
    doPlayerSendCancel(cid, "You are not a guild member.")
    return true
 end

 if param == '' then
 local status = {
 [1] = {"OFF"},
 [-1] = {"ON"}
 }
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Currently Status: "..status[getPlayerStorageValue(cid, storageId)][1].."")
    return true
 end
 
 if param == 'on' and getPlayerStorageValue(cid, storageId) == 1 then
    doPlayerSetStorageValue(cid, storageId, -1)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Now you can attack guild members.")
    return true
 end
 
  if param == 'off' and getPlayerStorageValue(cid, storageId) == -1 then
    doPlayerSetStorageValue(cid, storageId, 1)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Now you can't attack guild members.")
    return true
 end

return true
end