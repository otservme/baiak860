  function onAddItem(moveitem, tileitem, pos, cid)
local backpacks = {1988, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 3940, 5926, 5949, 7342, 9774}
-- 2365 backpack of holding
local backpackpos = {x=88, y=49, z=7, stackpos=255}
local getbackpack = getThingfromPos(backpackpos)
        if(isInArray(backpacks, moveitem.itemid) == TRUE) then
                doRemoveItem(getbackpack.uid, 1)
                doPlayerAddItem(cid, 2148, 100)
                doSendMagicEffect(pos, 6)
        end
return TRUE
end 