local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('Compro todas as parafernálias inutéis encontradas em suas hunts. Aproveite pago bem.')
end
return true
end

function greetCallback(cid)

return true

end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'demon legs', 'demon legs'},                  2495, 200000,    'demon legs')
shopModule:addSellableItem({'demon armor', 'demon armor'},            2494, 150000,    'demon armor')
shopModule:addSellableItem({'talon', 'talon'},            2151, 196,    'talon')
shopModule:addSellableItem({'violet gem', 'violet gem'},            2153, 5000,    'violet gem')
shopModule:addSellableItem({'red gem', 'red gem'},            2156, 5000,    'red gem')
shopModule:addSellableItem({'yellow gem', 'yellow gem'},            2154, 5000,    'yellow gem')
shopModule:addSellableItem({'green gem', 'green gem'},            2155, 5000,    'green gem')
shopModule:addSellableItem({'blue gem', 'blue gem'},            2158, 7000,    'blue gem')
shopModule:addSellableItem({'purple tome', 'purple tome'},          1982, 7350,     'purple tome')
shopModule:addSellableItem({'small emerald', 'small emerald'},          2149, 150,     'small emerald')
shopModule:addSellableItem({'small amethyst', 'small amethyst'},          2150, 150,     'small amethyst')
shopModule:addSellableItem({'small ruby', 'small ruby'},          2147, 150,     'small ruby')
shopModule:addSellableItem({'small sapphire', 'small sapphire'},          2146, 150,     'small sapphire')
shopModule:addSellableItem({'black pearl', 'black pearl'},          2144, 250,     'black pearl')
shopModule:addSellableItem({'white pearl', 'white pearl'},          2143, 450,     'white pearl')
shopModule:addSellableItem({'horned helmet', 'horned helmet'},          2496, 90000,     'horned helmet')

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())  