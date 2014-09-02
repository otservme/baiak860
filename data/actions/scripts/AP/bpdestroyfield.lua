        dst_id = 2261 -- Item a ser vendido
        backpackdst_id = 2003 -- Backpack
		custodst_id = 900 -- Valor
		cargasdst_id = 3 -- Cargas

local name = getItemNameById(dst_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custodst_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackdst_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custodst_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, dst_id, cargasdst_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custodst_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end