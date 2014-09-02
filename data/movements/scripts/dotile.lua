local tree = {x = 159, y = 106, z = 7, stackpos=1} ---Posição da árvore morta de ID 2709

function onStepOut(cid, item, pos)

local monsterFlower = "Moonflower"
if getPlayerLevel(cid) < 120 then
doMoveCreature(cid, NORTH)
doCreatureSay(cid, "You must be at least level 120 or higher.", TALKTYPE_ORANGE_1)
elseif getPlayerLevel(cid) >= 120 then
doMoveCreature(cid, SOUTH)
doCreateItem(2717, tree)

end
return TRUE
end