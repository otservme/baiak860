karmia = {x=453, y=481, z=6}
venore = {x=430, y=420, z=6}
desert = {x=400, y=482, z=6}
inferna = {x=518, y=439, z=6}
tiquanda = {x=568, y=465, z=7}
premia = {x=434, y=618, z=7}
liberty = {x=573, y=694, z=7}
folda = {x=266, y=317, z=6}
tortoise = {x=620, y=630, z=7}

frost_vip = {x=237, y=928, z=7}
behe_vip = {x=600, y=1052, z=7}
demon_vip = {x=423, y=1010, z=7}
hydra_vip = {x=518, y=976, z=7}
warlock_vip = {x=599, y=1263, z=7}

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
  		selfSay('Hiho ' .. getCreatureName(cid) .. '! 	Can I take you to karmia, venore, desert, inferna, tiquanda, folda, premia, liberty bay and hunts for VIP Accounts: frost dragon, behemoth, hydra, demon and warlock. Pointing out that travel costs 50 gps.')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk to you in a minute.')

  	elseif focus == cid then
		talk_start = os.clock()

			if msgcontains(msg, 'karmia') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,karmia)
    					doSendMagicEffect(karmia,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'venore') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,venore)
    					doSendMagicEffect(venore,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'desert') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,desert)
    					doSendMagicEffect(desert,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'inferna') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,inferna)
    					doSendMagicEffect(inferna,10)
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

			elseif msgcontains(msg, 'premia') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,premia)
    					doSendMagicEffect(premia,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'liberty') then
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


------------------------------------------ VIP Travel -----------------------------------

			elseif msgcontains(msg, 'frost dragon') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,frost_vip)
    					doSendMagicEffect(frost_vip,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'behemoth') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,behe_vip)
    					doSendMagicEffect(behe_vip,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'hydra') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,hydra_vip)
    					doSendMagicEffect(hydra_vip,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end

			elseif msgcontains(msg, 'demon') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,demon_vip)
    					doSendMagicEffect(demon_vip,10)
					selfSay("Let's GO")
					focus = 0
					talk_start = 0
				else
					selfSay("Sorry, you don\'t have enough money.")
				end	

			elseif msgcontains(msg, 'warlock') then
				if(doPlayerRemoveMoney(cid, 50) == TRUE) then
					doTeleportThing(cid,warlock_vip)
    					doSendMagicEffect(warlock_vip,10)
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
