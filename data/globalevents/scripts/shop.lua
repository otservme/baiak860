  -- ### CONFIG ###
-- message send to player by script "type" (types you can check in "global.lua")
SHOP_MSG_TYPE = 19
-- time (in seconds) between connections to SQL database by shop script
SQL_interval = 30
-- ### END OF CONFIG ###
function onThink(interval, lastExecution)
    local result_plr = db.getResult("SELECT * FROM z_ots_comunication WHERE `type` = 'login';")
    if(result_plr:getID() ~= -1) then
        while(true) do
            id = tonumber(result_plr:getDataInt("id"))
            action = tostring(result_plr:getDataString("action"))
            delete = tonumber(result_plr:getDataInt("delete_it"))
            cid = getCreatureByName(tostring(result_plr:getDataString("name")))
            if isPlayer(cid) == TRUE then
                local itemtogive_id = tonumber(result_plr:getDataInt("param1"))
                local itemtogive_count = tonumber(result_plr:getDataInt("param2"))
                local container_id = tonumber(result_plr:getDataInt("param3"))
                local container_count = tonumber(result_plr:getDataInt("param4"))
                local add_item_type = tostring(result_plr:getDataString("param5"))
                local add_item_name = tostring(result_plr:getDataString("param6"))
                local received_item = 0
                local full_weight = 0
                if add_item_type == 'container' then
                    container_weight = getItemWeightById(container_id, 1)
                    if isItemRune(itemtogive_id) == TRUE then
                        items_weight = container_count * getItemWeightById(itemtogive_id, 1)
                    else
                        items_weight = container_count * getItemWeightById(itemtogive_id, itemtogive_count)
                    end
                    full_weight = items_weight + container_weight
                else
                    full_weight = getItemWeightById(itemtogive_id, itemtogive_count)
                    if isItemRune(itemtogive_id) == TRUE then
                        full_weight = getItemWeightById(itemtogive_id, 1)
                    else
                        full_weight = getItemWeightById(itemtogive_id, itemtogive_count)
                    end
                end
                local free_cap = getPlayerFreeCap(cid)
                if full_weight <= free_cap then
                    if add_item_type == 'container' then
                        local new_container = doCreateItemEx(container_id, 1)
                        local iter = 0
                        while iter ~= container_count do
                            doAddContainerItem(new_container, itemtogive_id, itemtogive_count)
                            iter = iter + 1
                        end
                        received_item = doPlayerAddItemEx(cid, new_container)
                    else
                        local new_item = doCreateItemEx(itemtogive_id, itemtogive_count)
                        received_item = doPlayerAddItemEx(cid, new_item)
                    end
                    if received_item == RETURNVALUE_NOERROR then
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'You received >> '.. add_item_name ..' << from OTS shop.')
                        db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
                        db.query("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
                    else
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '>> '.. add_item_name ..' << from OTS shop is waiting for you. Please make place for this item in your backpack/hands and wait about '.. SQL_interval ..' seconds to get it.')
                    end
                else
                    doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '>> '.. add_item_name ..' << from OTS shop is waiting for you. It weight is '.. full_weight ..' oz., you have only '.. free_cap ..' oz. free capacity. Put some items in depot and wait about '.. SQL_interval ..' seconds to get it.')
                end
            end
            if not(result_plr:next()) then
                break
            end
        end
        result_plr:free()
    end
    return TRUE
end