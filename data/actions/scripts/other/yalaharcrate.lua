local items = {7620, 7618, 2148, 2148, 9808, 9811, 2671, 2666, 2789, 2213, 2145, 2145, 5710}
local count = {1, 1, 50, 80, 1, 1, 5, 8, 5, 1, 1, 2, 1}

local countable = {2148, 2789, 2145}
local uncountable = {2666, 2671}

function onUse(cid, item, fromPosition, itemEx, toPosition)

local compareTime = 3600
local currentValue = getPlayerStorageValue(cid, 65000)

if currentValue == -1 then
	setPlayerStorageValue(cid, 65000, os.time())
end

    if (os.time() - currentValue) >= compareTime then
        setPlayerStorageValue(cid, 65000, os.time())
        local myItem = math.random(1, #items)
        doPlayerAddItem(cid, items[myItem], count[myItem])
		if isInArray(countable, item[myItem]) and count[myItem] > 1 then
			doCreatureSay(cid, "You have found " .. count[myItem]  .. " " .. getItemName(items[myItem]) .. "s.", TALKTYPE_ORANGE_1)
		elseif count[myItem] == 1 then
			doCreatureSay(cid, "You have found a " .. getItemName(items[myItem]) .. ".", TALKTYPE_ORANGE_1)
		end
	else
		doCreatureSay(cid, "You found nothing useful.", TALKTYPE_ORANGE_1)
    end
    return TRUE
end