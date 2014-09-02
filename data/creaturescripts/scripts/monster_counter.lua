local monsters = {
	--name = storage
	["rat"] = 35001,
	["troll"] = 35002,
	["rotworm"] = 35003,
	["carrion worm"] = 35004,
	["dragon"] = 35005,
	["dragon lord"] = 35006,
	["hydra"] = 35007,
	["demon"] = 35008,
	["giant spider"] = 35009,
	["hydra"] = 35010,
	["behemoth"] = 35011,
	["warlock"] = 35012,
	["cyclops"] = 35013,
}

function onKill(cid, target)
	if(isMonster(target) == TRUE) then
		local name = getCreatureName(target)
		local monster = monsters[string.lower(name)]
		if(monster) then
			local killedMonsters = getPlayerStorageValue(cid, monster)
			if(killedMonsters == -1) then
				killedMonsters = 1
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você matou " .. killedMonsters .. " " .. name .. "'s.")
			setPlayerStorageValue(cid, monster, killedMonsters + 1)
		end
	end
	return TRUE
end
