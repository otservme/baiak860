local config = {
	storage = 9432,
	version = 1, -- Increase this value after adding new marks, so player can step again and receive new map marks
	marks = {
		{mark = 5, pos = {x = 100, y = 45, z = 7}, desc = "Dorion Temple"},
		{mark = 11, pos = {x = 103, y = 64, z = 7}, desc = "Tools Shop!"},
		{mark = 7, pos = {x = 92, y = 64, z = 7}, desc = "Paladin Shop!"},
		{mark = 8, pos = {x = 93, y = 75, z = 7}, desc = "Weapon Shop!"},
		{mark = 8, pos = {x = 102, y = 76, z = 7}, desc = "Armor Shop!"},
		{mark = 4, pos = {x = 81, y = 69, z = 7}, desc = "Dorion Depot!"},
		{mark = 9, pos = {x = 45, y = 79, z = 7}, desc = "Boat!"},
		{mark = 2, pos = {x = 26, y = 51, z = 7}, desc = "Football!"},
		{mark = 5, pos = {x = 119, y = 98, z = 7}, desc = "Sanctuary!"},
		{mark = 12, pos = {x = 48, y = 103, z = 7}, desc = "Arena PVP!"},
		{mark = 1, pos = {x = 666, y = 666, z = 6}}
	}
}

local f_addMark = doPlayerAddMapMark
if(not f_addMark) then f_addMark = doAddMapMark end

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid) ~= TRUE or getPlayerStorageValue(cid, config.storage) == config.version) then
		return
	end

	for _, m  in pairs(config.marks) do
		f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
	end
	setPlayerStorageValue(cid, config.storage, config.version)
	return TRUE
end
