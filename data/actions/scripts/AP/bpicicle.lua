        ici_id = 2271 -- Item a ser vendido
        backpackici_id = 5949 -- Backpack
		custoici_id = 4000 -- Valor
		cargasici_id = 5 -- Cargas

local name = getItemNameById(ici_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custoici_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackici_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custoici_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, ici_id, cargasici_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custoici_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end