        ghp_id = 7591 -- Item a ser vendido
        backpackghp_id = 2000 -- Backpack
		custoghp_id = 3800 -- Valor
		cargasghp_id = 20 -- Cargas

local name = getItemNameById(ghp_id)
----- End Config -----
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney(cid, custoghp_id) == TRUE then
                local bag = doPlayerAddItem(cid, backpackghp_id, 1)
                        doSendAnimatedText(fromPosition, "Purchased", TEXTCOLOR_YELLOW)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have purchased a backpack of ".. name .."s for ".. custoghp_id .." gold.")
						for i=1,20 do
                        doAddContainerItem(bag, ghp_id, cargasghp_id)
                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need ".. custoghp_id .." gold coins for a backpack of ".. name .."s.")
                end
        return FALSE
end