        hmm_id = 2311 -- Item a ser vendido
        backpackhmm_id = 2001 -- Backpack
		custohmm_id = 2400 -- Valor
		cargashmm_id = 10 -- Cargas

local name = getItemNameById(hmm_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custohmm_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackhmm_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custohmm_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, hmm_id, cargashmm_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custohmm_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end