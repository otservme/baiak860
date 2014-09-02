        gmp_id = 7590 -- Item a ser vendido
        backpackgmp_id = 9774 -- Backpack
		custogmp_id = 2400 -- Valor
		cargasgmp_id = 20 -- Cargas

local name = getItemNameById(gmp_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custogmp_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackgmp_id, 1)
                        doSendAnimatedText(fromPosition, "", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custogmp_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, gmp_id, cargasgmp_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custogmp_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end