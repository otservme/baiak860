        mw_id = 2293 -- Item a ser vendido
        backpackmw_id = 1999 -- Backpack
		customw_id = 7000 -- Valor
		cargasmw_id = 3 -- Cargas

local name = getItemNameById(mw_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, customw_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackmw_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. customw_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, mw_id, cargasmw_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. customw_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end