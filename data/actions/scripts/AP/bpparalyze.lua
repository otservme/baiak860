        para_id = 2278 -- Item a ser vendido
        backpackpara_id = 5949 -- Backpack
		custopara_id = 14000 -- Valor
		cargaspara_id = 1 -- Cargas

local name = getItemNameById(para_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custopara_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackpara_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custopara_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, para_id, cargaspara_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custopara_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end