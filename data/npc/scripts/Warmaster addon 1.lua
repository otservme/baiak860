local focus = 0
local talk_start = 0

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
selfSay('Hiho ' .. getCreatureName(cid) .. ' Eu posso lhe conceder o Warmaster addon 1, para mais infos. diga help...')
focus = cid
talk_start = os.clock()

elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk to you in a minute.')

elseif focus == cid then
talk_start = os.clock()

if msgcontains(msg, 'help') then
selfSay('Para saber o que eh preciso para obter o Warmaster addon 1 diga: addon 1')


elseif msgcontains(msg, 'addon 1') then
if getPlayerStorageValue(cid,999999) >= 2 then
selfSay('Voce ja tem esse addon.')

else if getPlayerStorageValue(cid,999999) == 1 then
selfSay('Preciso de Uma Zaoan Sword e de 100k,Você Trouxe Para Mim?')
addon_state = 2
else
setPlayerStorageValue(cid,999999,1)
selfSay('Preciso de Uma Zaoan Sword e de 100k,Você Trouxe Para Mim?')
end
end
elseif msgcontains(msg, 'yes') and addon_state == 2 then
if doPlayerRemoveItem(cid,2160, 10) == 0 or doPlayerRemoveItem(cid,11301, 1) == 0 then
selfSay('Desculpe mas voce naum os tem...')
else
selfSay('Obrigado, agora voce tem o novo addon da terra dos Warmasters!.')
if getPlayerSex(cid) == 0 then
doPlayerAddOutfit(cid, 335, 1)
setPlayerStorageValue(cid,999999,2)
else
doPlayerAddOutfit(cid, 336, 1)
setPlayerStorageValue(cid,999999,2)
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