local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end
-- OTServ event handling functions end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'water'}, 2006, 100, 1, 'water')
shopModule:addBuyableItem({'blood'}, 2006, 100, 2, 'blood')
shopModule:addBuyableItem({'beer'}, 2006, 100, 3, 'beer')
shopModule:addBuyableItem({'slime'}, 2006, 100, 4, 'slime')
shopModule:addBuyableItem({'lemonade'}, 2006, 100, 5, 'lemonade')
shopModule:addBuyableItem({'milk'}, 2006, 100, 6, 'milk')
shopModule:addBuyableItem({'manafluid'}, 2006, 100, 7, 'manafluid')
shopModule:addBuyableItem({'lifefluid'}, 2006, 100, 10, 'lifefluid')
shopModule:addBuyableItem({'oil'}, 2006, 100, 11, 'oil')
shopModule:addBuyableItem({'urine','pipi'}, 2006, 100, 13, 'urine')
shopModule:addBuyableItem({'coconut milk'}, 2006, 100, 14, 'coconut milk')
shopModule:addBuyableItem({'mud'}, 2006, 100, 19, 'mud')
shopModule:addBuyableItem({'fruit juice'}, 2006, 100, 21, 'fruit juice')
shopModule:addBuyableItem({'lava'}, 2006, 100, 26, 'lava')
shopModule:addBuyableItem({'swamp'}, 2006, 100, 28, 'swamp')

npcHandler:addModule(FocusModule:new())