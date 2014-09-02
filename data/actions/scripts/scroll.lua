---------Criado por Baiak Lula---------
--------Criado por Baiak Lula---------
---Base
local itemID = 1967 -- O ID do item que quando usado ira dar a quantidade de EXP desejada
local exp = 3000000 -- A quantidade de EXP desejada
local mensagem = "Owned,Exp Gratis." -- A mensagem q ira aparecer quando for usado o item
--- Configs Principais:
local vocs = 1,5,2,6,3,7,4,8 --
local voca = "Sorcerer, Master Sorcerer,Druid,Elder Druid,Knight,Elite Knight,Paladin,Royal Paladin" -- Nome das vocações 1 e 5
local level = 8 -- O level necessario para poder usar o item

----Estrutura
function onUse(cid, item, frompos, item2, topos)
playerpos = getPlayerPosition(cid)
if item.itemid == itemID and getPlayerVocation(cid) == vocs and getPlayerLevel(cid) >= level then
doPlayerAddExp(cid, exp)
doSendMagicEffect(playerpos,30)
doCreatureSay(cid, mensagem, 3)
doRemoveItem(cid, item.uid, 1)
doPlayerSendTextMessage(cid,20, "Você ganhou " ..exp.. " de experiência.")
else
doPlayerSendCancel(cid, "Desculpe, mais apenas " ..voca.. " com level " ..level.."+ pode usar este item.")
end
return 1
end
--------Criado por Baiak Lula---------


