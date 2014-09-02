        gfb_id = 2304 -- Item a ser vendido
        backpackgfb_id = 2000 -- Backpack
		custogfb_id = 3600 -- Valor
		cargasgfb_id = 4 -- Cargas

local name = getItemNameById(gfb_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custogfb_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackgfb_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custogfb_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, gfb_id, cargasgfb_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custogfb_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end