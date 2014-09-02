        uhp_id = 8473 -- Item a ser vendido
        backpackuhp_id = 9774 -- Backpack
		custouhp_id = 6200 -- Valor
		cargasuhp_id = 20 -- Cargas

local name = getItemNameById(uhp_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custouhp_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackuhp_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custouhp_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, uhp_id, cargasuhp_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custouhp_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end