function onUse(cid, item, frompos, item2, topos)

    if getPlayerStorageValue(cid,5955) == 1 then
       pos = getPlayerPosition(cid)
            doTransformItem(item.uid,item.itemid+1)
				playerpos = getPlayerPosition(cid)
				doorpos = {x = frompos.x, y = frompos.y, z = frompos.z, stackpos = 253}
				if playerpos.y == doorpos.y + 1 and playerpos.x == doorpos.x then
					doMoveCreature(cid, 0)
				elseif playerpos.x == doorpos.x - 1 and playerpos.y == doorpos.y then
					doMoveCreature(cid, 1)
				elseif playerpos.y == doorpos.y - 1 and playerpos.x == doorpos.x then
					doMoveCreature(cid, 2)
				elseif playerpos.y == doorpos.y and playerpos.x == doorpos.x + 1 then
					doMoveCreature(cid, 3)
				elseif playerpos.x == doorpos.x + 1 and playerpos.y == doorpos.y - 1 then
					doMoveCreature(cid, 4)
				elseif playerpos.x == doorpos.x - 1 and playerpos.y == doorpos.y - 1 then
					doMoveCreature(cid, 5)
				elseif playerpos.x == doorpos.x + 1 and playerpos.y == doorpos.y + 1 then
					doMoveCreature(cid, 6)
				elseif playerpos.x == doorpos.x - 1 and playerpos.y == doorpos.y + 1 then
					doMoveCreature(cid, 7)
				end
        else
            doPlayerSendTextMessage(cid,22,"The door seems to be sealed against unwanted intruders.")
        end
        return 1
end