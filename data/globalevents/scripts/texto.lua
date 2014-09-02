local config = {
    positions = {
        ["Quests"] = { x = 153, y = 47, z = 7 },
        ["Bem"] = { x = 159, y = 54, z = 7 },
		["Vindo"] = { x = 161, y = 54, z = 7 },
        ["Hunts"] = { x = 154, y = 47, z = 7 },
		["Area VIP"] = { x = 164, y = 51, z = 7 },
		["Cidades"] = { x = 155, y = 47, z = 7 },
	    ["Trainers"] = { x = 147, y = 52, z = 7 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 500))
    end
    
    return TRUE
end  