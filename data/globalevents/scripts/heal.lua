  --[[
        Idea by Pitufo
        Script by Shawak
]]--

local config = {

        healHP = 150,
        healPlayers = "yes",
        healMonsters = "yes",
}

local healthArea = {

        fromX = 99,
        fromY = 44,
        fromZ = 7,
        toX = 101,
        toY = 46,
        toZ = 7,

}

function onThink(cid, interval, lastExecution)
        for x = healthArea.fromX, healthArea.toX do
                for y = healthArea.fromY, healthArea.toY do
                        for z = healthArea.fromZ, healthArea.toZ do
                                local pos = {x=x, y=y, z=z, stackpos = 253}
                                local thing = getThingfromPos(pos)
                                doSendMagicEffect(pos, 12)
                                if thing.itemid > 0 then
                                        if(isPlayer(thing.uid) == TRUE and string.lower(config.healPlayers) == "yes") then
                                                doCreatureAddHealth(thing.uid, config.healHP)
                                                if string.lower(getConfigValue("showHealingDamage")) == "yes" then
                                                        doSendAnimatedText(pos, "+"..config.healHP.."", 18)
                                                end
                                        elseif(isMonster(thing.uid) == TRUE and string.lower(config.healMonsters) == "yes") then
                                                doCreatureAddHealth(thing.uid, config.healHP)
                                                if string.lower(getConfigValue("showHealingDamageForMonsters")) == "yes" then
                                                        doSendAnimatedText(pos, "+"..config.healHP.."", 18)
                                                end
                                        end
                                end
                        end
                end
        end
        return TRUE
end 