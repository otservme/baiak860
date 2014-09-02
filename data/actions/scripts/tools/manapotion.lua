        mp_id = 7620 -- Item a ser vendido
        backpackmp_id = 2001 -- Backpack
		customp_id = 1000 -- Valor
		cargasmp_id = 20 -- Cargas

local name = getItemNameById(mp_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, customp_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackmp_id, 1)
                        doSendAnimatedText(fromPosition, "", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. customp_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, mp_id, cargasmp_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. customp_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end