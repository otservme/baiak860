function onDeath(cid, corpse, killer)

	registerCreatureEvent(cid, "inquisitionPortals")

	local creaturename = getCreatureName(cid)

--- positions where the teleports will be created:

	local ushuriel_in_pos = {x=1115, y=1214, z=12, stackpos=2} 
	local annihilon_in_pos = {x=1187, y=1198, z=12, stackpos=2} 
	local hellgorak_in_pos = {x=1192, y=1240, z=12, stackpos=2} 
	local madareth_in_pos = {x=1112, y=1240, z=12, stackpos=2} 
	local zugurosh_in_pos = {x=1149, y=1213, z=12, stackpos=2} 
	local brothers_in_pos = {x=1147, y=1244, z=12, stackpos=1}

--- positions where the teleports will be teleported you:

	local ushuriel_to_pos = {x=1173, y=1138, z=12, stackpos=1}
	local annihilon_to_pos = {x=1245, y=1297, z=12, stackpos=1}  
	local hellgorak_to_pos = {x=1064, y=1308, z=13, stackpos=1} 
	local madareth_to_pos = {x=1045, y=1205, z=13, stackpos=1} 
	local zugurosh_to_pos = {x=1128, y=1151, z=12, stackpos=1} 
	local brothers_to_pos = {x=1152, y=1195, z=13, stackpos=1}

	local time_to_pass = 180 -- in seconds
	local tpID = 1387
	local doEffect = CONST_ME_TELEPORT
	local message = "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room only during this time or the teleporter will disappear."

	if creaturename == 'Ushuriel' then

			teleport = doCreateTeleport(tpID, ushuriel_to_pos, ushuriel_in_pos)

			doSendMagicEffect(ushuriel_in_pos, doEffect)

			doPlayerSendTextMessage(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInUshurielWard, (1000*time_to_pass))

	elseif creaturename == 'Annihilon' then

			teleport = doCreateTeleport(tpID, annihilon_to_pos, annihilon_in_pos)

			doSendMagicEffect(annihilon_in_pos, doEffect)

			doPlayerSendTextMessage(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInAnnihilonWard, (1000*time_to_pass))

	elseif creaturename == 'Madareth' then

			teleport = doCreateTeleport(tpID, madareth_to_pos, madareth_in_pos)

			doSendMagicEffect(madareth_in_pos, doEffect)

			doPlayerSendTextMessage(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInMadarethWard, (1000*time_to_pass)) 

	elseif creaturename == 'Hellgorak' then

			teleport = doCreateTeleport(tpID, hellgorak_to_pos, hellgorak_in_pos)

			doSendMagicEffect(hellgorak_in_pos, doEffect)

			doPlayerSendTextMessage(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInHellgorakWard, (1000*time_to_pass)) 

	elseif creaturename == 'Zugurosh' then

			teleport = doCreateTeleport(tpID, zugurosh_to_pos, zugurosh_in_pos)

			doSendMagicEffect(zugurosh_in_pos, doEffect)

			doPlayerSendTextMessage(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInZuguroshWard, (1000*time_to_pass))

	elseif creaturename == 'Latrivan' then

			teleport = doCreateTeleport(tpID, brothers_to_pos, brothers_in_pos)

			doSendMagicEffect(brothers_in_pos, doEffect)

			doPlayerSendTextMessage(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInBrothersWard, (1000*time_to_pass))

	
		end 
end

function removeTeleportInUshurielWard()
	if getThingfromPos({x=1115, y=1214, z=12, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1115, y=1214, z=12, stackpos=2}).uid,1)
	doSendMagicEffect({x=1115, y=1214, z=12, stackpos=2}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInAnnihilonWard()
	if getThingfromPos({x=1187, y=1198, z=12, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1187, y=1198, z=12, stackpos=2}).uid,1)
	doSendMagicEffect({x=1187, y=1198, z=12, stackpos=2}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInHellgorakWard()
	if getThingfromPos({x=1192, y=1240, z=12, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1192, y=1240, z=12, stackpos=2}).uid,1)
	doSendMagicEffect({x=1192, y=1240, z=12, stackpos=2}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInMadarethWard()
	if getThingfromPos({x=1112, y=1240, z=12, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1112, y=1240, z=12, stackpos=2}).uid,1)
	doSendMagicEffect({x=1112, y=1240, z=12, stackpos=2}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInZuguroshWard()
	if getThingfromPos({x=1149, y=1213, z=12, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1149, y=1213, z=12, stackpos=2}).uid,1)
	doSendMagicEffect({x=1149, y=1213, z=12, stackpos=2}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInBrothersWard()
	if getThingfromPos({x=1147, y=1244, z=12, stackpos=1}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1147, y=1244, z=12, stackpos=1}).uid,1)
	doSendMagicEffect({x=1147, y=1244, z=12, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end 