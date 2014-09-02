        sd_id = 2268 -- Item a ser vendido
        backpacksd_id = 2003 -- Backpack
		custosd_id = 6000 -- Valor
		cargassd_id = 3 -- Cargas

local name = getItemNameById(sd_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custosd_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpacksd_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custosd_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, sd_id, cargassd_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custosd_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end