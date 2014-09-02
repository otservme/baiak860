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
selfSay('Hello ' .. getCreatureName(cid) .. '! I can fix your Worn Soft Boots for 10000 pieces of gold).')
focus = cid
talk_start = os.clock()

elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Wait you time, ' .. getCreatureName(cid) .. '!')

elseif focus == cid then
talk_start = os.clock()

if msgcontains(msg, 'worn soft boots') or msgcontains(msg, 'soft boots')then
if getPlayerItemCount(cid,6530) >= 1 and getPlayerItemCount(cid,2152) >= 100 or  getPlayerItemCount(cid,6530) >= 1 and getPlayerItemCount(cid,2160) >= 1 then
if doPlayerTakeItem(cid,6530,1) and doPlayerTakeItem(cid,2152,100) == 0 or doPlayerTakeItem(cid,6530,1) and doPlayerTakeItem(cid,2160,1) == 0 then
selfSay('Here you are.')
doPlayerAddItem(cid,2640,1)
end
else
selfSay('Sorry, you don\'t have the item.')
end


elseif msgcontains(msg, 'bye') and getDistanceTo(cid) < 4 then
selfSay('Good bye, ' .. getCreatureName(cid) .. '!')
focus = 0
talk_start = 0
end
end
end


function onCreatureChangeOutfit(creature)

end


function onThink()
if (os.clock() - talk_start) > 30 then
if focus > 0 then
selfSay('Next Please...')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 5 then
selfSay('Good bye then.')
focus = 0
end
end
end