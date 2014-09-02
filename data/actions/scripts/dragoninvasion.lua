--Invasion script
-- By Tworn
--Variables that need to be set according to your map/desire:
--topleft=the top left cordinate of the invasion area
--bottonright= the botton right cordinate of the invasion area
--maxmonsters= the maximum number of monsters that will appear. Set it "nil" for no monster limit.
--spawnrate= the chance of a monster appearing in a square of the invasion area
--species= the odds that determine what kind of monster will be summoned
-- DO NOT CHANGE THE FOLLOWING VARIABLES: checking, summonedtotal, checkforsummon.

function onUse(cid, item, frompos, item2, topos)
	if getPlayerAccess(cid) ~=0 then
		topleft={x=132, y=116, z=7}
		bottonright={x=154, y=130, z=7}
		maxmonsters= 10

		checking={x=topleft.x, y=topleft.y, z=topleft.z} --Do Not Change
		summonedtotal=0 --Do Not Change

		repeat
			checkforsummon=0 --Do Not Change
			spawnrate=math.random(0,13)
			if spawnrate==0 and summonedtotal ~= maxmonsters then
				species=math.random(1,6)

				if species == 1 then
					checkforsummon = doSummonCreature("Dragon Lord",checking)
				elseif species == 2 then
					checkforsummon = doSummonCreature("Dragon",checking)
				end


				if checkforsummon~= 0 then
					summonedtotal=summonedtotal+1
				end
			end

			checking.x=checking.x+1
			if checking.x>bottonright.x then
				checking.x=topleft.x
				checking.y=checking.y+1
			end
		until checking.y > bottonright.y

		doPlayerSay(cid,"/B Dragons has invaded the southern part of the lands!",23)
		print("Number of creatures summoned:",summonedtotal)
	end
	return 1
end
