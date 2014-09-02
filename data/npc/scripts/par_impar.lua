------ NPC Par/Impar -------------
-- Data de criação: 
--06/06/07 -> 10:58 - 11:01
--Autor do script: Nostradamus
--Projeto Cassino -> BlackOnix
--Projeto descartado pela equipe
---------------------------------------

-- Config
local price_to_play = 1
local price = 200
---
local focus = 0
local talk_start = 0

function onCreatureAppear(creature) end
function onCreatureTurn(creature) end
function onCreatureChangeOutfit(creature) end

function onCreatureDisappear(cid, pos)
          if focus == cid then
                  selfSay('Good bye then.')
                  focus = 0
                  talk_start = 0
          end
end





function msgcontains(txt, str)
          return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
          msg = string.lower(msg)

          if (msgcontains(msg, 'hi') and focus == 0) and getDistanceToCreature(cid) < 4 then
                  selfSay('Olá ' .. getCreatureName(cid) .. '! O que acha de apostarmos ' .. price .. ' numa disputa de par ou ímpar? Se quiser, escolha "par" ou "impar".')
                  focus = cid
                talk_state = 0
                  talk_start = os.clock()

          elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
                  selfSay(getCreatureName(cid) .. ', por favor aguarde sua vez.')

          elseif focus == cid then
                talk_start = os.clock()

                if msgcontains(msg, 'par') and talk_state == 0 then
                talk_start = os.clock()
                talk_state = 0
                                if doPlayerRemoveMoney(cid, price_to_play) == 1 then
                                                player_random = math.random(1, 10)
                                                npc_random = math.random(1, 10)

                                                if  player_random == 2 or player_random == 4 or player_random == 6 or player_random == 8 or     player_random == 10 then
                                                        selfSay('Parabéns! Você acaba de ganhar ' .. price .. '!')
                                                        doPlayerAddMoney(cid, price)
                                                else
                                                        selfSay('Que pena, você perdeu  ' .. price .. '. Mais sorte da próxima vez.')
                                                        doPlayerRemoveMoney(cid, price)
                                                end
                                                        
                                talk_state = 1
                                else
                                selfSay('Você não tem dinheiro o suficiente para jogar.')
                                end                             
        
                        talk_state = 0
                end
                
                if msgcontains(msg, 'impar') and talk_state == 0 then
                talk_start = os.clock()
                talk_state = 0
                                if doPlayerRemoveMoney(cid, price_to_play) == 1 then
                                                player_random = math.random(1, 10)
                                                npc_random = math.random(1, 10)

                                                if  player_random == 1 or player_random == 3 or player_random == 5 or player_random == 7 or     player_random == 9 then
                                                        selfSay('Parabéns! Você acaba de ganhar ' .. price .. '!')
                                                        doPlayerAddMoney(cid, price)
                                                else
                                                        selfSay('Que pena, você perdeu  ' .. price .. '. Mais sorte da próxima vez.')
                                                        doPlayerRemoveMoney(cid, price)
                                                end
                                                        
                                talk_state = 1
                                else
                                selfSay('Você não tem dinheiro o suficiente para jogar.')
                                end     
                                talk_state = 0
                end

                if msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
                        selfSay('Até mais, ' .. getCreatureName(cid) .. '!')
                        focus = 0
                        talk_start = 0
                end
          end
end





function onThink()
        doNpcSetCreatureFocus(focus)
          if (os.clock() - talk_start) > 45 then
                  if focus > 0 then
                          selfSay('Próximo por favor...')
                  end
                          focus = 0
          end
        if focus ~= 0 then
                if getDistanceToCreature(focus) > 3 then
                        selfSay('Tchau.')
                        focus = 0
                end
        end
end



