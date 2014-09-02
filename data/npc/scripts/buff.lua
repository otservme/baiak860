-- configs
pricetobuff = 30000
hasteseconds = 500
invisibleseconds = 500
magicshieldseconds = 500
skillsseconds = 600
skillsupgrade = {}
skillsupgrade['fist'] = 20
skillsupgrade['club'] = 20
skillsupgrade['sword'] = 20
skillsupgrade['axe'] = 20
skillsupgrade['distance'] = 17
skillsupgrade['shield'] = 25
skillsupgrade['ml'] = 10
-- end configs


-- heal combat
local combatHeal = createCombatObject()
setCombatParam(combatHeal, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combatHeal, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combatHeal, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combatHeal, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setCombatFormula(combatHeal, COMBAT_FORMULA_LEVELMAGIC, 999, 999, 999, 999)

-- haste combat
local combatHaste = createCombatObject()
setCombatParam(combatHaste, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combatHaste, COMBAT_PARAM_AGGRESSIVE, 0)
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, hasteseconds*1000)
setConditionFormula(condition, 99, 99, 99, 99)
setCombatCondition(combatHaste, condition)

-- invisible combat
local combatInvisible = createCombatObject()
setCombatParam(combatInvisible, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combatInvisible, COMBAT_PARAM_AGGRESSIVE, 0)
local condition = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition, CONDITION_PARAM_TICKS, invisibleseconds*1000)
setCombatCondition(combatInvisible, condition)

-- utamo combat
local combatUtamo = createCombatObject()
setCombatParam(combatUtamo, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combatUtamo, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_MANASHIELD)
setConditionParam(condition, CONDITION_PARAM_TICKS, magicshieldseconds*1000)
setCombatCondition(combatUtamo, condition)

-- melee condition
local conditionMelee = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionMelee, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_FIST, skillsupgrade['fist'])
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_CLUB, skillsupgrade['club'])
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_SWORD, skillsupgrade['sword'])
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_AXE, skillsupgrade['axe'])

-- distance condition
local conditionDistance = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionDistance, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionDistance, CONDITION_PARAM_SKILL_DISTANCE, skillsupgrade['distance'])

-- shield condition
local conditionShield = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionShield, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionShield, CONDITION_PARAM_SKILL_SHIELD, skillsupgrade['shield'])

-- ml condition
local conditionMagic = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionMagic, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionMagic, CONDITION_PARAM_STAT_MAGICPOINTS, skillsupgrade['ml'])


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function buff(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
if doPlayerRemoveMoney(cid, pricetobuff) == TRUE then
buff = parameters.buff
message = parameters.message

doCombat(cid, buff, numberToVariant(cid))
npcHandler:say(message, cid)
keywordHandler:moveUp(1)
return true
else
npcHandler:say("You need ".. pricetobuff .." gold coins to buff yourself.", cid)
end
end

function buffMelee(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
if doPlayerRemoveMoney(cid, pricetobuff) == TRUE then
buff = parameters.buff
errors = 0
message = parameters.message
voc = getPlayerVocation(cid)

if buff == conditionMagic and (isKnight(cid) or isPaladin(cid)) then
npcHandler:say("Only Master Sorcerers and Elder Druids and can upgrade their magic skills.", cid)
errors = 1
end

if buff == conditionMelee and (isSorcerer(cid) or isDruid(cid)) then
npcHandler:say("Only Knight and Paladin can upgrade their melee Skills.", cid)
errors = 1
end

if buff == conditionShield and (isSorcerer(cid) or isDruid(cid)) then
npcHandler:say("Only Knight and Paladin can upgrade their shield skills.", cid)
errors = 1
end

if buff == conditionDistance and (isSorcerer(cid) or isDruid(cid)) then
npcHandler:say("Only Paladin can upgrade their distance skills.", cid)
errors = 1
end

if errors == 0 then
doTargetCombatCondition(0, cid, buff, CONST_ME_MAGIC_RED)
npcHandler:say(message, cid)
keywordHandler:moveUp(1)
return true
end
else
npcHandler:say("You need ".. pricetobuff .." gold coins to buff yourself.", cid)
end
end




local node1 = keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to be healed?'})
node1:addChildKeyword({'yes'}, buff, {buff = combatHeal, message = 'Now you are fully restored!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'haste'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to be hasted?'})
node1:addChildKeyword({'yes'}, buff, {buff = combatHaste, message = 'Now you are fully hasted!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'invisible'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to be invisible?'})
node1:addChildKeyword({'yes'}, buff, {buff = combatInvisible, message = 'Now you are invisible!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'magic shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to get magic shield effect?'})
node1:addChildKeyword({'yes'}, buff, {buff = combatUtamo, message = 'Your magic shield is on!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'melee'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to upgrade your melee skills for some time?'})
node1:addChildKeyword({'yes'}, buffMelee, {buff = conditionMelee, message = 'Your skills had been upgraded!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to upgrade your shield skills for some time?'})
node1:addChildKeyword({'yes'}, buffMelee, {buff = conditionShield, message = 'Your skills had been upgraded!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'distance'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to upgrade your distance skills for some time?'})
node1:addChildKeyword({'yes'}, buffMelee, {buff = conditionDistance, message = 'Your skills had been upgraded!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

local node1 = keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to upgrade your magic skills for some time?'})
node1:addChildKeyword({'yes'}, buffMelee, {buff = conditionMagic, message = 'Your skills had been upgraded!'})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then not.'})

keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uhm?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ya?"})

npcHandler:addModule(FocusModule:new())