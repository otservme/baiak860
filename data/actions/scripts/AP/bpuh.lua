        uh_id = 2273 -- Item a ser vendido
        backpackuh_id = 2002 -- Backpack
		custouh_id = 3000 -- Valor
		cargasuh_id = 1 -- Cargas

local name = getItemNameById(uh_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custouh_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackuh_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custouh_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, uh_id, cargasuh_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custouh_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end