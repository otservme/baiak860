function onSay(cid, words, param)

        local players = getWorldCreatures(0)
        local creatures = getWorldCreatures(1)
        local npcs = getWorldCreatures(2) 
        local all = getWorldCreatures(3)
        
        if players > 1 then
  playersmsg = "There is currently ".. players .." players online."
        else
  playersmsg = "You are the only player online."        
        end
        if creatures > 1 then
  creaturesmsg = "There is currently ".. creatures .." creatures spawned."
        elseif creatures == 1 then
  creaturesmsg = "There is currently 1 creature spawned."
        else
  creaturesmsg = "There are no creatures spawned."
        end
        if npcs > 1 then
  npcsmsg = "There is currently ".. npcs .." NPCs online."
        elseif npcs == 1 then
  npcsmsg = "There is currently only 1 NPC online."
        else
  npcsmsg = "There is no NPCs online."
        end
        if all > 1 then
  allmsg = "Overall, There is only ".. all .." creatures, npcs, and players online."
        else
  allmsg = "Overall, You are the only player online. No creatures, NPCs or any other players."
        end
        
        doPlayerSendTextMessage(cid, 24, playersmsg)
        doPlayerSendTextMessage(cid, 24, creaturesmsg)
        doPlayerSendTextMessage(cid, 24, npcsmsg)
        doPlayerSendTextMessage(cid, 24, allmsg)
        doPlayerSendTextMessage(cid, 25, words)
        return 0        
end