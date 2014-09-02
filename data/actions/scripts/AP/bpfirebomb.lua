        bpff_id = 2305 -- Item a ser vendido
        backpackbpff_id = 2000 -- Backpack
		custobpff_id = 4700 -- Valor
		cargasbpff_id = 2 -- Cargas

local name = getItemNameById(bpff_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custobpff_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackbpff_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custobpff_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, bpff_id, cargasbpff_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custobpff_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end