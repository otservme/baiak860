  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end

        if msgcontains(msg, 'beggar') then
            npcHandler:say('Voce quer escutar essa historia agora. Loooonga e triste.', cid)
                        talk_state = 1
                        elseif msgcontains(msg, 'yes') and talk_state == 1 then
                                if getPlayerItemCount(cid,2160) >= 1 then
                                        doPlayerTakeItem(cid,2160,2)
                                        npcHandler:say('Ah, droga! Odeio mosquitos... O que voce disse?', cid)
                                        talk_state = 0
                                        else
                                                npcHandler:say('Oh, me desculpe. Me lembrei que preciso fazer algo. Obrigado pelas suas... por seu... pela sua gentileza.', cid)
                                                talk_state = 0
                                        end
                                elseif msgcontains(msg, 'no') and talk_state == 1 then
                                        npcHandler:say('Ok Adeus!', cid)
                                        talk_state = 0
                                end
                                return true
                        end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 