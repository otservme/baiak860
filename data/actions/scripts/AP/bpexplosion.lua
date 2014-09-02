        explo_id = 2313 -- Item a ser vendido
        backpackexplo_id = 2001 -- Backpack
		custoexplo_id = 5000 -- Valor
		cargasexplo_id = 6 -- Cargas

local name = getItemNameById(explo_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custoexplo_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackexplo_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custoexplo_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, explo_id, cargasexplo_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custoexplo_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end