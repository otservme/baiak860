function onLogin(cid)
	if getPlayerGroupId(cid) == 1 and getPlayerStorageValue(cid, 50000) == -1 then
		if isSorcerer(cid) then
			local bag = doPlayerAddItem(cid, 9774, 1)
	
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2152, 20)
		
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2190, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)

		setPlayerStorageValue(cid, 50000, 1)

		elseif isDruid(cid) then
			local bag = doPlayerAddItem(cid, 9774, 1)
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2152, 20)
		
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2182, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)

			setPlayerStorageValue(cid, 50000, 1)

		elseif isPaladin(cid) then
			local bag = doPlayerAddItem(cid, 9774, 1)
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2152, 20)
		
			doPlayerAddItem(cid, 2389, 3)
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2647, 1)
                  doPlayerAddItem(cid, 2463, 1)
			setPlayerStorageValue(cid, 50000, 1)

		elseif isKnight(cid) then
			local bag = doPlayerAddItem(cid, 9774, 1)
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 2554, 1)
			doAddContainerItem(bag, 2152, 20)
			doAddContainerItem(bag, 8601, 1)
			doAddContainerItem(bag, 2383, 1)
			doAddContainerItem(bag, 2417, 1)				
			
		
	            doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)

			setPlayerStorageValue(cid, 50000, 1)
		end
	end
 	return TRUE
end