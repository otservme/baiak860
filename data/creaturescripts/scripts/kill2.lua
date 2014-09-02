function onKill(cid, target)
	if(isPlayer(target) == FALSE) then
		for k, v in pairs(wow_like_quests_storages) do
			local storage = getPlayerStorageValue(k)
			if(storage >= 0) then
				if(storage < v.amount) then
					setPlayerStorageValue(cid, k, storage+1)
					if(v.on_kill) then
						v.on_kill(cid, parameters)
					end
				end
				if((storage+1) == v.amount) then
					if(v.on_finish) then
						v.on_finish(cid, parameters)
					end
				end
			end
		end
	end
	return TRUE
end
