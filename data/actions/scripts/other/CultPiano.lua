local VERSE = {6087, 6088, 6089, 6090}

function onUse(cid, item, frompos, item2, topos)

local queststatus = getPlayerStorageValue(cid,item.itemid)
local versestatus1 = getPlayerStorageValue(cid, 6087)
local versestatus2 = getPlayerStorageValue(cid, 6088)
local versestatus3 = getPlayerStorageValue(cid, 6089)
local versestatus4 = getPlayerStorageValue(cid, 6090)
local npos = {x=topos.x-3, y=topos.y, z=topos.z}

if item.uid == 60034 then
	if versestatus1 == 1 and versestatus2 == 1 and versestatus3 == 1 and versestatus4 == 1 then
		doSendMagicEffect(topos, 18)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have successfully played the song.")
		doTeleportThing(cid, npos, FALSE)
	else
		 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You dont know the complete song.")
	end
elseif isInArray(VERSE,item.itemid) == 1 then
	if queststatus ~= 1 then
		doSendMagicEffect(frompos, 18)
		doRemoveItem(item.uid,1)
		setPlayerStorageValue(cid,item.itemid,1)				
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have successfully learnt verse number "..(item.itemid - 6086)..".")	
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already know this verse.")
	end
end
return TRUE
end