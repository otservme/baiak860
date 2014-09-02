  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
        if msgcontains(msg, 'recycler') then
                npcHandler:say("It's very nice job. I am promoting {natural lifestyle}. Ofcourse you can {help} me, and whole world.", cid)
        elseif msgcontains(msg, 'natural environment') then
                npcHandler:say("Now environment is being {polluted} mainly by cars and factories.", cid)
        elseif msgcontains(msg, 'danger') then
                npcHandler:say("Yes, in danger. We are destroying our world.", cid)
        elseif msgcontains(msg, 'natural lifestyle') then
                npcHandler:say("Right. You can, for example, recycle your old backpacks. Just throw them on basin near me. Just think how many animals you can save!", cid)
        elseif msgcontains(msg, 'pollut') then
                npcHandler:say("Pollution contains all those weird streaks, which are really harmful for natural environment.", cid)
        elseif msgcontains(msg, 'help') then
                npcHandler:say("It's really important to teach young people about {global warming}, about recycling, about that what will be if we won't do anything!", cid)
        elseif msgcontains(msg, 'global warming') then
                npcHandler:say("Global warming is caused by pollution. Temperature over the world is increasing rapidly. It has terrible effect on biosphere.", cid)
        end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 