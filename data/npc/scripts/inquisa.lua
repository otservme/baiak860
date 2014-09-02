local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


    if msgcontains(msg, 'permision') then
            selfSay('You want to Acquire Permissions for The Inquisition Quest? If you want to say {inquisition}?', cid)
        talkState[talkUser] = 2

    elseif msgcontains(msg, 'rules') then
            selfSay('What do you want to know? Something about the three different {GENERAL} rules or the {PRICES}? Maybe you also want to know what happens when you die?', cid)
        talkState[talkUser] =  1

    elseif talkState[talkUser] == 1 then
        if msgcontains(msg, 'çopopo') then
                selfSay('We have three difficulty. The hardest are warlord.', cid)
                talkState[talkUser] = 0
    
                    
            elseif msgcontains(msg, 'general') then
                selfSay('Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack.If you enter in inquisition or you win or you go to temple.', cid)
                talkState[talkUser] = 0
                
    
            elseif msgcontains(msg, 'prices') then
                selfSay('A great Inquisition cost 400000 golds.', cid)
                talkState[talkUser] = 0
            end




    elseif talkState[talkUser] == 2 then
        if msgcontains(msg, 'kiukiukiu') then
                selfSay('The fee is 1000 gold for one try. Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse andyour backpack. Do you really want to participate in the arena in the easiest difficulty?', cid)
                talkState[talkUser] = 3
    
                    
            elseif msgcontains(msg, 'koikoikoi') then
                selfSay('The fee is 5000 gold for one try. Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack. Do you really want to participate in the arena in the medium difficulty?', cid)
                talkState[talkUser] = 4
                
    
            elseif msgcontains(msg, 'inquisition') then
                selfSay('You really want to pay 600k in the Permissions Inquisition Quest, Knowing You Back there dead?', cid)
                talkState[talkUser] = 5
            end


    elseif talkState[talkUser] == 3 then
            if msgcontains(msg, 'yes') then
                if getPlayerStorageValue(cid,50066) == -1 then
                    if(doPlayerRemoveMoney(cid, 1000) == TRUE) then
                        setPlayerStorageValue(cid,5066,1)
                        selfSay('As you wish! You can pass the door now and enter the teleporter to the pits.', cid)
                    end
                else
                    selfSay('You already win this arena!', cid)
                end
            else
                selfSay('Then not. Get away and don\'t waste my time!', cid)
            end

        elseif talkState[talkUser] == 4 then
            if msgcontains(msg, 'yes') then
                if getPlayerStorageValue(cid,500677) == -1 then
                    if(doPlayerRemoveMoney(cid, 5000) == TRUE) then
                        setPlayerStorageValue(cid,500677,1)
                        selfSay('As you wish! You can pass the door now and enter the teleporter to the pits.', cid)
                    end
                else
                    selfSay('You already win this arena!', cid)
                end
            else
                selfSay('Then not. Get away and don\'t waste my time!', cid)
            end

        elseif talkState[talkUser] == 5 then
            if msgcontains(msg, 'yes') then
                if getPlayerStorageValue(cid,5076) == -1 then
                    if(doPlayerRemoveMoney(cid, 600000) == TRUE) then
                        setPlayerStorageValue(cid,5074,1)
                        selfSay('As you wish! You can pass the door now and enter the door to the pits.', cid)
                    end
                else
                    selfSay('As you wish! You can pass the door now and enter the door to the pits.', cid)
                end
            else
                selfSay('Then not. Get away and don\'t waste my time!', cid)
            end


        talkState[talkUser] = 0
    elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
        talkState[talkUser] = 0
        selfSay('Ok then.', cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())