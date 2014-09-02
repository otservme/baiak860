local pos = {x=160, y=51, z=7}

pos = {x=160, y=51, z=7}

function onLogin(cid)
	if vip.hasVip(cid) == true then
		if getPlayerStorageValue(cid,55555) ~= 1 then
			setPlayerStorageValue(cid,55555,1)
		end
    elseif vip.hasVip(cid) ~= true and vip.getVip(cid) ~= 0 then
		if getPlayerStorageValue(cid,55555) == 1 then
			doTeleportThing(cid, pos, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua Vip ACABOU!")
			doPlayerSendTextMessage(cid,22,"Sua Vip ACABOU!")
			setPlayerPromotionLevel(cid, 1)
			setPlayerStorageValue(cid,55555,2)
		elseif getPlayerStorageValue(cid,55555) == -1 then
			setPlayerStorageValue(cid,55555,2)
		end

	end

    return true
end

