  ----- Config -----
local config = {
        cost = 10000, -- Price
        item_id = 2273, -- Rune/Potion
        backpack_id = 2002 -- Backpack
}

local name = getItemNameById(2273) -- Same as item_id above
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, config.cost) == TRUE then
                local bp = doPlayerAddItem(cid, config.backpack_id, 1)
                        doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
                        doSendAnimatedText(fromPosition, "Comprado", TEXTCOLOR_RED)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você comprou uma backpack de ".. name .."s por ".. config.cost .." gold.")
        for i=1,20 do
                        doAddContainerItem(bp, config.item_id, 10) -- You can edit this number, it will give shots per rune.
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa de ".. config.cost .." gold para comprar uma backpack de ".. name .."s.")
                end
        return TRUE
end 