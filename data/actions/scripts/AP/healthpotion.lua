        hp_id = 7618 -- Item a ser vendido
        backpackhp_id = 2000 -- Backpack
		custohp_id = 900 -- Valor
		cargashp_id = 20 -- Cargas

local name = getItemNameById(hp_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custohp_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackhp_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custohp_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, hp_id, cargashp_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custohp_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end