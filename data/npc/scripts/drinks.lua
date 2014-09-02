local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)	 npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
-- OTServ event handling functions end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'lemonade', 'lemondrink'}, 2006, 10, 5, 'lemonade')
shopModule:addBuyableItem({'fruit juice', 'fruitjuice'}, 2006, 10, 21,	'fruit juice')
shopModule:addBuyableItem({'beer', 'b_e_e_r'}, 2006, 10, 3,	'beer')
shopModule:addBuyableItem({'milk', 'm_i_l_k'}, 2006, 10, 6,	'milk')
shopModule:addBuyableItem({'coconut', 'c_o_c_o_n_u_t'}, 2006, 10, 14,	'coconut milk')
shopModule:addBuyableItem({'wine', 'w_i_n_e'}, 2006, 10, 15,	'wine')
shopModule:addBuyableItem({'rum', 'r_u_m'}, 2006, 10, 27,	'rum')

npcHandler:addModule(FocusModule:new())