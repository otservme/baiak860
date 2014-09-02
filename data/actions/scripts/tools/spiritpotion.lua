        spr_id = 8472 -- Item a ser vendido
        backpackspr_id = 7342 -- Backpack
		custospr_id = 2000 -- Valor
		cargasspr_id = 20 -- Cargas

local name = getItemNameById(spr_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custospr_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackspr_id, 1)
                        doSendAnimatedText(fromPosition, "", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custospr_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, spr_id, cargasspr_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custospr_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end