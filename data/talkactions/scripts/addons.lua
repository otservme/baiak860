local outfits = 
{
["citizen"] = 1, ["hunter"] = 2, ["mage"] = 3, ["knight"] = 4, ["nobleman"] = 5, ["summoner"] = 6, ["warrior"] = 7, ["barbarian"] = 8, ["druid"] = 9, ["wizard"] = 10,
["oriental"] = 11, ["pirate"] = 12, ["assassin"] = 13, ["beggar"] = 14, ["shaman"] = 15, ["norseman"] = 16, ["nightmare"] = 17, ["jester"] = 18, ["brotherhood"] = 19, 
["demonhuter"] = 20, ["yalaharian"] = 21, ["warmaster"] = 22, ["wedding"] = 23, ["none"] = 24
}
local lookTypes = {maleOutfits, femaleOutfits}
local functions = {['remove'] = doPlayerRemoveOutfit, ['add'] = doPlayerAddOutfit}
function onSay(cid, words, param)
	local param = string.explode(param, ',')
	local player, outfit, outfitNumber, actuallFunction = 0, 0, 0, functions[param[1]]
	if(not actuallFunction) then
		doPlayerSendTextMessage(cid, 22, 'Commands param required.')
		return true
	end
	player = getPlayerByNameWildcard(param[2])
	if(not player) then
		doPlayerSendTextMessage(cid, 22, 'Player not found.')
		return true
	end
	outfit = outfits[string.lower(param[3])]
	if(not outfit) then
		doPlayerSendTextMessage(cid, 22, 'Outfit not found')
		return true
	end
	outfitNumber = tonumber(param[4])
	if(isNumber(outfitNumber) == false or (outfitNumber > 3 and outfitNumber < 1)) then
		doPlayerSendTextMessage(cid, 22, 'Wrong fourth param. It must be number {1, 3}.')
		return true
	end
	for i = 1, 2 do
		actuallFunction(player, lookTypes[i][outfit], outfitNumber)
	end
	doPlayerSendTextMessage(player, 22, 'Unnormal strenght '..param[1]..' you '..param[4]..' addons to '..param[3]..' outfit.')
return true
end