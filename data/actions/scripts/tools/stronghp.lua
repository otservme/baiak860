        shp_id = 7588 -- Item a ser vendido
        backpackshp_id = 3940 -- Backpack
		custoshp_id = 2000 -- Valor
		cargasshp_id = 20 -- Cargas

local name = getItemNameById(shp_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custoshp_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackshp_id, 1)
                        doSendAnimatedText(fromPosition, "", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custoshp_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, shp_id, cargasshp_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custoshp_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end