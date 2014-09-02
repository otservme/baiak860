-- Mining V2.6
-- Please understand this is more of a bug fix release
-- Coded by Roman, some credits to twiz for giving an example of his V1.0
function onUse(cid, item, frompos, item2, topos)
Level = getPlayerLevel(cid)
AxeSkill = getPlayerSkill(cid,1)
if item2.actionid == 387 and         -- set the action id of rocks
Level >= 10   -- set the level requirement to be able to mine
and
AxeSkill >= 10  -- set the axe skill requirement to be able to mine
then 
rand = math.random(1,2000)
if rand < 20 then
doPlayerSendTextMessage(cid,22,"A stone golem came out of the pile of rocks!")
doSummonCreature("Stone Golem", topos)             
elseif rand == 1300 then
doPlayerSendTextMessage(cid,22,"You have found a golden nugget.")              
doPlayerAddItem(cid,2157,1)                
elseif rand > 1995 then
doPlayerSendTextMessage(cid,22,"You have found a diamond.")
doPlayerAddItem(cid,2145,1)
elseif rand >500 and rand <800 then
doPlayerAddItem(cid,2148,7)
elseif rand >700 and rand <1000 then
doPlayerAddItem(cid,2148,6)
elseif rand >1000 and rand <1300 then
doPlayerAddItem(cid,2148,4)
elseif rand >300 and rand <600 then
doPlayerAddItem(cid,2148,5)
elseif rand >1500 and rand <1800 then
doPlayerAddItem(cid,2148,3)
elseif rand >1100 and rand <1400 then
doPlayerAddItem(cid,2148,8)
elseif rand >800 and rand <1100 then
doPlayerAddHealth(cid,-20)
doPlayerSendTextMessage(cid,22,"You lost hitpoints due to exhaustion of mining.")
elseif rand >500 and rand <800 then
doPlayerSendTextMessage(cid,22,"You have found a ruby.")
doPlayerAddItem(cid,2147,1)
elseif rand >550 and rand <800 then
doPlayerSendTextMessage(cid,22,"A fierce dwarf came out of the pile of rocks!")
doSummonCreature("Dwarf", topos)
elseif rand == 40 then
doPlayerSendTextMessage(cid,22,"A fierce dwarf guard came out of the pile of rocks!")
doSummonCreature("Dwarf Guard", topos)
elseif rand == 20 then
doPlayerSendTextMessage(cid,22,"A weak troll has appeared from the pile of rocks!")
doSummonCreature("Troll", topos)
elseif rand >2000 then
doPlayerSendTextMessage(cid,22,"Earthquake!")
doPlayerAddHealth(cid,-100)
elseif rand == 100 and rand <140 then
doPlayerSendTextMessage(cid,22,"A weak troll has appeared from the pile of rocks!")
doSummonCreature("Troll", topos)
elseif rand == 200 then
doPlayerSendTextMessage(cid,22,"A dwarf soldier came out of the pile of rocks!")
doSummonCreature("Dwarf Soldier", topos)
elseif rand >= 105 and rand <150 then
end
doSendMagicEffect(topos,3)
doPlayerAddSkillTry(cid,1,0)
doPlayerSay(cid,"Mining!",1)
else
 doPlayerSendCancel(cid,"Voce nao esta minando no lugar certo ou nao tem level minimo 10.")
end
return 1
end