local quests =
{
-- Blue Legs --
[50001] = {
storageId = 50001,
rewardId = 7730,
count = 1
},
[50002] = {
storageId = 50002,
rewardId = 7731,
count = 1
},
[50003] = {
storageId = 50003,
rewardId = 7732,
count = 1
},
}

function useQuestChest(cid, quest)
local queststatus = getPlayerStorageValue(cid, quest.storageId)
if queststatus == -1 then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a " .. getItemNameById(quest.rewardId) .. ".")
doPlayerAddItem(cid, quest.rewardId, quest.count)
setPlayerStorageValue(cid, quest.storageId, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
end
end

function onUse(cid, item, frompos, item2, topos)
if quests[item.uid] ~= nil then
useQuestChest(cid, quests[item.uid])
end
return TRUE
end