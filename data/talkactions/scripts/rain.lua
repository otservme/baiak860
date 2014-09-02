--Script by Dark (OTNet)--

local PLACES = {
    {name = "city", POSITION_START = {x=92, y=112, z=7}, POSITION_END = {x=100, y=120, z=7}},
}

local CONFIG = {
    {NAME = 'Meteor', NUMBER_TYPE = 10, NUMBER_GROUP = 10, TIME_START = 5000, TIME_GROUP = 500, HIT = {MIN=100, MAX=200}, AGRE = 1, CREATE = {{3670,1},{3668,1}}, RANDOM_ITEM = 20, SUMMON = {}, RANDOM_SUMMON = 1,  STRONG = 1, EFFECT = {DISTANCE = 3, HIT = 15, NORMAL = 5}},
    
    {NAME = 'Water', NUMBER_TYPE = 50, NUMBER_GROUP = 100, TIME_START = 5000, TIME_GROUP = 10, HIT = {MIN=0, MAX=0}, AGRE = 0,  CREATE = {{2017,1}}, RANDOM_ITEM = 1, SUMMON = {}, RANDOM_SUMMON = 1,  STRONG = 0, EFFECT = {DISTANCE = 40, HIT = 53, NORMAL = 1}},
    
    {NAME = 'Energy', NUMBER_TYPE = 5, NUMBER_GROUP = 20, TIME_START = 5000, TIME_GROUP = 300, HIT = {MIN=20, MAX=60}, AGRE = 1,  CREATE = {{1495,1}}, RANDOM_ITEM = 18, SUMMON = {}, RANDOM_SUMMON = 1, STRONG = 0, EFFECT = {DISTANCE = 35, HIT = 37, NORMAL = 40}},
    
    {NAME = 'Acid', NUMBER_TYPE = 1, NUMBER_GROUP = 100, TIME_START = 5000, TIME_GROUP = 100, HIT = {MIN=30, MAX=35}, AGRE = 1,  CREATE = {{1496,1},{2016,4}}, RANDOM_ITEM = 2, SUMMON = {"Slime"}, RANDOM_SUMMON = 30,  STRONG = 0, EFFECT = {DISTANCE = 14, HIT = 8, NORMAL = 20}},

}



function onSay(cid, words, param)
    if getPlayerAccess(cid) >= 0 then
        if getGlobalStorageValue(123045) == -1 then
            if param == 'info' then
                text = 'Places where you can use the system:\n'
                for a = 1, #PLACES do
                    text = text..'\n    - '..PLACES[a].name
                end
                text = text..'\n\nRain\'s Type:\n'
                for d = 1, #CONFIG do
                    text = text..'\n    - '..CONFIG[d].NAME
                end
                doShowTextDialog(cid, 5709, text)
            else
                for b = 1, #CONFIG do
                    if string.lower(CONFIG[b].NAME) == string.lower(string.sub(param,1,string.len(CONFIG[b].NAME))) then
                        TYPE = b
                        break
                    else
                        TYPE = 0
                    end
                end
                if TYPE == 0 then
                    doPlayerSendCancel(cid, 'This rain\'s type not exist')
                    return FALSE
                end
                for c = 1, #PLACES do
                    if string.lower(PLACES[c].name) == string.lower(string.sub(param,string.len(CONFIG[TYPE].NAME)+2)) then
                        PLACE = c
                        break
                    else
                        PLACE = 0
                    end
                end
            if PLACE == 0 then
                doPlayerSendCancel(cid, 'This place not exist')
                return FALSE
            end
            setGlobalStorageValue(123045,1)
            addEvent(Rain, CONFIG[TYPE].TIME_START, {TYPE=TYPE, PLACE=PLACE})
            doPlayerPopupFYI(cid, 'You active rain of '..CONFIG[TYPE].NAME..'\nThis start in '..CONFIG[TYPE].TIME_START/1000 ..' seconds at '..PLACES[PLACE].name..'.')
            end
        end
    else
        doPlayerSendCancel(cid, 'You may not use this command')
    end
end
local NUM = 0
function Rain(r)
    TYPE = r.TYPE
    PLACE = r.PLACE
    for _ = 1, CONFIG[TYPE].NUMBER_TYPE do
        TARGET = {x=math.random(PLACES[PLACE].POSITION_START.x, PLACES[PLACE].POSITION_END.x), y=math.random(PLACES[PLACE].POSITION_START.y, PLACES[PLACE].POSITION_END.y), z=math.random(PLACES[PLACE].POSITION_START.z, PLACES[PLACE].POSITION_END.z), stackpos=1}
        if getTilePzInfo(TARGET) == FALSE and getTileHouseInfo(TARGET) == FALSE then
            if CONFIG[TYPE].AGRE == 1 then
                Item(TARGET, TYPE)
            end
            doSendDistanceShoot({x=TARGET.x-3, y=TARGET.y-3, z=TARGET.z}, TARGET, CONFIG[TYPE].EFFECT.DISTANCE)
            LOCAL = getThingfromPos(TARGET)
            if #CONFIG[TYPE].CREATE ~= 0 then
                if math.random(1, CONFIG[TYPE].RANDOM_ITEM) == 1 then
                    if LOCAL.itemid == 0 or isMoveable(LOCAL.uid) == TRUE then
                        if CONFIG[TYPE].STRONG == 1 then
                            doDecayItem(doCreateItem(6299, 1, TARGET))
                        end
                        ITEM = math.random(1, #CONFIG[TYPE].CREATE)
                        doDecayItem(doCreateItem(CONFIG[TYPE].CREATE[ITEM][1], CONFIG[TYPE].CREATE[ITEM][2], TARGET))
                    end
                end
            end
            if #CONFIG[TYPE].SUMMON ~= 0 then
                if math.random(1, CONFIG[TYPE].RANDOM_SUMMON) == 1 then
                    if LOCAL.itemid == 0 or isMoveable(LOCAL.uid) == TRUE then
                        CREATURE = math.random(1, #CONFIG[TYPE].SUMMON)
                        doSummonCreature(CONFIG[TYPE].SUMMON[CREATURE], TARGET)
                    end
                end
            end
            doSendMagicEffect(TARGET, CONFIG[TYPE].EFFECT.NORMAL)
        end
    end
    NUM = NUM+1
    if NUM < CONFIG[TYPE].NUMBER_GROUP then
        addEvent(Rain, CONFIG[TYPE].TIME_GROUP, {TYPE=TYPE, PLACE=PLACE})
    else
        setGlobalStorageValue(123045,-1)
        NUM = 0
    end
end
function Item(position, t)
    pos = {x=position.x, y=position.y, z=position.z, stackpos=1}
    item = getThingfromPos(pos)
    if item.itemid ~= 0 and isMoveable(item.uid) == TRUE or isCreature(item.uid) == TRUE and getTilePzInfo(pos) == FALSE then
        repeat
            if isCreature(item.uid) == FALSE then
                doRemoveItem(item.uid)
            else
                doCreatureAddHealth(item.uid, -math.random(CONFIG[t].HIT.MIN, CONFIG[t].HIT.MAX))
            end
            trash = getThingfromPos(pos)
        until item.itemid == 0 or isMoveable(item.uid) == FALSE or isCreature(item.uid) == TRUE
    doSendMagicEffect(pos, CONFIG[t].EFFECT.HIT)
    end
    return TRUE
end  