        av_id = 2274 -- Item a ser vendido
        backpackav_id = 2002 -- Backpack
		custoav_id = 4000 -- Valor
		cargasav_id = 4 -- Cargas

local name = getItemNameById(av_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custoav_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackav_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custoav_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, av_id, cargasav_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custoav_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end