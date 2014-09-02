local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)

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
  		selfSay('Hiho ' .. getCreatureName(cid) .. ' Eu posso liberar o yalahar Addon 1, diga help para mais infos.')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk to you in a minute.')

	elseif focus == cid then
		talk_start = os.clock()

	if msgcontains(msg, 'help') then
			selfSay('Eu posso liberar o yalahar Addon 1, se estiver interessado diga: yalahar outfit')


	elseif msgcontains(msg, 'yalahar outfit') then
                 if getPlayerStorageValue(cid,9996) >= 2 then
					selfSay('Voce ja tem esse addon.')

                 else if getPlayerStorageValue(cid,9996) == 1 then
                    selfSay('Precisarei de 50 small amethyst fangs para liberar este Addon, voce os trouxe?')
					addon_state = 2
		 else
		            setPlayerStorageValue(cid,9996,1)
                    selfSay('Precisarei de 50 small amethyst para liberar este Addon, voce os trouxe?')
        end
	end
	elseif msgcontains(msg, 'yes') and addon_state == 2 then
                 if doPlayerRemoveItem(cid,2150,50) == 0 then
		  			selfSay('Sorry, you not have them.')
                 else  
			selfSay('Thanks, addon is your now.')
			if getPlayerSex(cid) == 0 then
		    doPlayerAddOutfit(cid, 324, 1)
		    setPlayerStorageValue(cid,9996,2)
			else
			doPlayerAddOutfit(cid, 325, 1)
			setPlayerStorageValue(cid,9996,2)
		    talk_state = 1
			end
        end	
  	

        elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
            selfSay('Adeus ' .. creatureGetName(cid) .. ', Volte Sempre.')
            focus = 0
            talk_start = 0

        elseif msg ~= "" then
            selfSay('Como? Eu não entendi!')
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
            selfSay('Proximo!!...')
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

