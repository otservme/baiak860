--Script made by Pitufo/Haifurer, edited by figaro!
local config = {
    [0] = { "Fist skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [1] = { "Club skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [2] = { "Sword skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [3] = { "Axe skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [4] = { "Distance skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [5] = { "Shield skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [6] = { "Fishing skill UP", 30}, -- 30 = variable[2]  -- Animation effect
    [7] = { "Magic level UP", 30}, -- 30 = variable[2]  -- Animation effect
    [8] = { "Level UP", 30} -- 30 = variable[2]  -- Animation effect
}


function onAdvance(cid, skill, oldlevel, newlevel)

local pos = getPlayerPosition(cid)
local effectPositions = {
{x = pos.x, y = pos.y - 3, z = pos.z},
{x = pos.x, y = pos.y + 3, z = pos.z},
{x = pos.x - 3, y = pos.y, z = pos.z},
{x = pos.x + 3, y = pos.y, z = pos.z},
{x = pos.x - 2, y = pos.y - 2, z = pos.z},
{x = pos.x + 2, y = pos.y - 2, z = pos.z},
{x = pos.x + 2, y = pos.y + 2, z = pos.z},
{x = pos.x - 2, y = pos.y + 2, z = pos.z}
}

        
    for type, variable in pairs(config) do
        if skill == type then
            doCreatureSay(cid, ""..variable[1].." ["..newlevel.."]", TALKTYPE_ORANGE_1)
	for _, ePos in ipairs(effectPositions) do
		doSendDistanceShoot(pos, ePos, CONST_ANI_SMALLHOLY)
		doSendMagicEffect(ePos, CONST_ME_HOLYAREA)
            end

            
        end
    end    
return TRUE
end