-- Include external classes.
dofile('data/npc/scripts/lib/npcsystem/npcsystem.lua')

-- get the distance to a creature
function getDistanceToCreature(id)
	if id == 0 or id == nil then
		selfGotoIdle()
	end
	
	cx, cy, cz = creatureGetPosition(id)
	sx, sy, sz = selfGetPosition()
	
	if cx == nil then
		return nil
	end
	
	return math.max(math.abs(sx-cx), math.abs(sy-cy))
end

-- do one step to reach position
function moveToPosition(x,y,z)
	selfMoveTo(x, y, z)
end

-- do one step to reach creature
function moveToCreature(id)
	if id == 0 or id == nil then
		selfGotoIdle()
	end
	tx,ty,tz=creatureGetPosition(id)
	if tx == nil then
		selfGotoIdle()
	else
	   moveToPosition(tx, ty, tz)
   end
end

-- stop talking
function selfGotoIdle()
	following = false
	attacking = false
	selfAttackCreature(0)
	target = 0
end

-- getCount function by Jiddo
function getCount(msg)
	b, e = string.find(msg, "%d+")
	
	if b == nil or e == nil then
		count = 1
	else
		count = tonumber(string.sub(msg, b, e))
	end
	
	if count > 2000 then
		count = 2000
	elseif count == 0 then
		count = 1
	end
	
	return count
end

-- buy an item
function buy(cid, itemid, count, cost)
	cost = count*cost
	amount = count
	if doPlayerRemoveMoney(cid, cost) == 1 then
		if getItemStackable(itemid) then
			while count > 100 do
				doPlayerAddItem(cid, itemid, 100)
				count = count - 100
			end
			
			doPlayerAddItem(cid, itemid, count) -- add the last items, if there is left
		else
			while count > 0 do
				doPlayerAddItem(cid, itemid, 1)
				count = count - 1
			end
		end
		
		if amount <= 1 then
			selfSay('Here is your '.. getItemName(itemid) .. '!')
		else
			selfSay('Here are your '.. amount ..' '.. getItemName(itemid) .. 's!')		
		end
	else
		selfSay('Sorry, you do not have enough money.')
	end
end

function buyFluidContainer(cid, itemid, count, cost, fluidtype)
	cost = count*cost
	amount = count
	if doPlayerRemoveMoney(cid, cost) == 1 then
		while count > 0 do
			doPlayerAddItem(cid, itemid, fluidtype)
			count = count - 1
		end
		
		if amount <= 1 then
			selfSay('Here is your '.. getItemName(itemid) .. '!')
		else
			selfSay('Here are your '.. amount ..' '.. getItemName(itemid) .. 's!')		
		end
	else
		selfSay('Sorry, you do not have enough money.')
	end
end

function buyContainer(cid, container, itemid, count, money)
	if doPlayerRemoveMoney(cid, money) == 1 then
		bp = doPlayerAddItem(cid, container, 1)
		x = 0
		
		while x < 20 do
			doAddContainerItem(bp, itemid, count)
			x = x + 1
		end
		
		selfSay('Here you are.')
	else
		selfSay('Sorry, you don\'t have enough money.')
	end
end 

-- sell an item
function sell(cid, itemid, count, cost)
	cost = count*cost
	if doPlayerRemoveItem(cid, itemid, count) == 1 then
		doPlayerAddMoney(cid, cost)
		
		if cost > 0 then
			selfSay('You couldn\'t retrieve '.. cost ..' gold pieces, please contact the admin.')
		end
		
		if count <= 1 then
			selfSay('Thanks for this '.. getItemName(itemid) .. '!')
		else
			selfSay('Thanks for these '.. count..' '.. getItemName(itemid) .. 's!')		
		end
	else
		selfSay('Sorry, you do not have this item.')
	end
end

-- pay for anything?
function pay(cid, cost)
	if doPlayerRemoveMoney(cid, cost) == 1 then
		return true
	else
		return false
	end
end

-- learn spell
function learnSpell(cid, spell, cost)
	x,y,z = creatureGetPosition(cid)
	if doPlayerLearnSpell(cid, spell) == 1 then
		if doPlayerRemoveMoney(cid, cost) == 1 then
			doSendMagicEffect({x=x, y=y, z=z}, 14)
			selfSay('To use it say: '.. spell ..'.')
		else
			selfSay('Sorry, you do not have this item.')
		end
	else
		selfSay('You already know this spell.')
	end
end

-- Travel player
function travel(cid, x, y, z)
	destpos = {x = x, y = y, z = z}
	doTeleportThing(cid, destpos)
	doSendMagicEffect(destpos, 10)
end

-- add all addons
function addon(cid, addon)
	if getPlayerSex(cid) == 1 then
		for x = 128, 134 do
			doPlayerAddAddon(cid, x, addon)
		end

		for y = 143, 146 do
			doPlayerAddAddon(cid, y, addon)
		end
		
		for z = 151, 154 do
			doPlayerAddAddon(cid, z, addon)
		end
	else	
		for x = 136, 142 do
			doPlayerAddAddon(cid, x, addon)
		end

		for y = 147, 150 do
			doPlayerAddAddon(cid, y, addon)
		end
		
		for z = 155, 158 do
			doPlayerAddAddon(cid, z, addon)
		end
	end
end

function msgcontains(txt, str)
	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
