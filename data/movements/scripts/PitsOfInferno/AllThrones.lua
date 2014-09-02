function onStepIn(cid, item, pos)
    if item.uid == 10274 then
        if getPlayerStorageValue(cid,10274) == -1 then
            setPlayerStorageValue(cid,10274,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Verminor큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Veminor큦 spirit.')
        end
    elseif item.uid == 10275 then
        if getPlayerStorageValue(cid,10275) == -1 then
            setPlayerStorageValue(cid,10275,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Infernatil큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Infernatil큦 spirit.')
        end
    elseif item.uid == 10276 then
        if getPlayerStorageValue(cid,10276) == -1 then
            setPlayerStorageValue(cid,10276,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Tafariel큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Tafariel큦 spirit.')
        end
    elseif item.uid == 10277 then
        if getPlayerStorageValue(cid,10277) == -1 then
            setPlayerStorageValue(cid,10277,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Apocalypse큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Apocalypse큦 spirit.')
        end
    elseif item.uid == 10278 then
        if getPlayerStorageValue(cid,10278) == -1 then
            setPlayerStorageValue(cid,10278,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Pumin큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Pumin큦 spirit.')
        end
    elseif item.uid == 10279 then
        if getPlayerStorageValue(cid,10279) == -1 then
            setPlayerStorageValue(cid,10279,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Bazir큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Bazir큦 spirit.')
        end
    elseif item.uid == 10280 then
        if getPlayerStorageValue(cid,10280) == -1 then
            setPlayerStorageValue(cid,10280,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Ashfalor큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Ashfalor큦 spirit.')
        end
    elseif item.uid == 10281 and item.itemid == 1210 and pos == {x=345, y=1419, z=12} then
        if getPlayerStorageValue(cid,10274) == -1 or getPlayerStorageValue(cid,10275) == -1 or getPlayerStorageValue(cid,10276) == -1 or getPlayerStorageValue(cid,10277) == -1 or getPlayerStorageValue(cid,10278) == -1 then
            doTransformItem(item.uid,item.itemid+1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You absorbed enough energy! You may pass.')
        end
    end
    return 1
end