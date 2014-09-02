mystic = {x=1447, y=1504, z=7}
enigma = {x=942, y=980, z=6}
liberty = {x=495, y=1669, z=7}
folda = {x=267, y=349, z=6}
premmy = {x=1150, y=1478, z=7}
tiquanda = {x=1081, y=1291, z=7}


local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos, cid, item, frompos, item2, topos)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
  	if focus == cid then
          selfSay('Good bye then.')
          focus = 0
          talk_start = 0
  	end
end


function onCreatureTurn(creature)

end


function msgcontains(txt, str)
  	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
  	msg = string.lower(msg)
	if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
  		selfSay('Hiho ' .. getCreatureName(cid) .. '! 	Can I take you to, enigma city, mystic island, liberty bay, premmy city, folda, tiquanda. To go where they want?. Pointing out that travel costs 50 gps.')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk to you in a minute.')

  	elseif focus == cid then
		talk_start = os.clock()

			if msgcontains(msg, 'mystic island') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,mystic)
    					doSendMagicEffect(mystic,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'enigma') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,enigma)
    					doSendMagicEffect(enigma,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'liberty bay') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,liberty)
    					doSendMagicEffect(liberty,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'folda') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,folda)
    					doSendMagicEffect(folda,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'premmy city') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,premmy)
    					doSendMagicEffect(premmy,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'tiquanda') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,tiquanda)
    					doSendMagicEffect(tiquanda,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end
		

        elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
            selfSay('Bye ' .. creatureGetName(cid) .. ', go back.')
            focus = 0
            talk_start = 0

        elseif msg ~= "" then
            selfSay('how? I do not understand!')
            talk_state = 0
        end
    end
end

function onCreatureChangeOutfit(creature)
end

function onThink()
    doNpcSetCreatureFocus(focus)
    if (os.clock() - talk_start) > 30 then
        if focus > 0 then
            selfSay('Next please!!...')
        end
        focus = 0
        talk_start = 0
    end
    if focus ~= 0 then
        if getDistanceToCreature(focus) > 5 then
            selfSay('Good Bye')
            focus = 0
            talk_start = 0
        end
    end
end
