function onStepIn(cid, item, pos)
	BOOK_ID = 1970
	ACTION_ID = 10201 -- Actionid of the tile that teleport you if you have the Holy Tible
	if (item.actionid == 10201) then
		if (getPlayerItemCount(cid, 1970) ~= 1) then
			doTeleportThing(cid, {x=412, y=1414, z=9})
		else
			doTeleportThing(cid, {x=398, y=1380, z=9})
		end
	end
end