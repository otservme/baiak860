--[[ Mercenary System v1.0 por Magus
      Script VIP: www.otserv.com.br
Configurações básicas abaixo, edite conforme os padrões da linguagem
]]

local MS_kills = 100 -- Mortes limite para completar uma missão (ex: 100 = matar 100 rats para passar da newbie)
local MS_reset = 1000 -- Preço (em gold) para resetar uma missão
local monsters = {}
local prize = {}

function MS_createMission(tu, mission)
	monsters[tu] = {}
	if(mission == 1) then --Level 1 ao 5
		monsters[tu] =
		{
			"rat",
			"cave rat",
			"spider"
		}
	elseif(mission == 2) then --Level 6 ao 15
		monsters[tu] =
		{
			"rotworm",
			"minotaur",
			"poison spider",
			"orc"
		}
	elseif(mission == 3) then -- Level 16 ao 25
		monsters[tu] =
		{
			"carrion worm",
			"ghoul",
			"amazon",
			"valkyrie",
			"tortoise"
		}
	elseif(mission == 4) then -- Level 26 ao 50
		monsters[tu] =
		{
			"slime",
			"witch",
			"orc berserker",
			"fire elemental",
			"cyclops",
			"fire devil",
			"monk",
			"vampire",
			"thornback tortoise",
			"necromancer",
			"dragon"
		}
	elseif(mission == 5) then -- Level 51 ao 80
		monsters[tu] =
		{
			"giant spider",
			"crystal spider",
			"dragon lord",
			"hydra",
			"banshee",
			"orc warlord"
			
		}		
	elseif(mission == 6) then -- Level 81 ao 120
		monsters[tu] =
		{
			"warlock",
			"behemoth",
			"demon",
			"frost dragon"
			
		}
	elseif(mission == 7) then -- Level 121 ao 200
		monsters[tu] =
		{
			"juggernaut",
			"fury",
			"massive fire elemental",
			"massive energy elemental",
			"massive water elemental",
			"hand of cursed fate",
			"hellhound"			
		}
	elseif(mission == 8) then -- Level 201 adiante
		monsters[tu] =
		{
			"ungreez",
			"lord of the elements"
		}
	end
	return monsters[tu][math.random(1,#monsters[tu])]
end
function MS_prize(cid, mission, tu)
	prize[tu] = {}
	if(mission == 1) then --Prêmio da newbie mission
		prize[tu] = 
		{
			{
				id = 2152,
				count = 10
			}
		}
	elseif(mission == 2) then --Prêmio da basic mission
		prize[tu] = 
		{
			{
				id = 2160,
				count = 1
			}
		}
	elseif(mission == 3) then --Prêmio da basiest mission
		prize[tu] = 
		{
			{
				id = 2160,
				count = 2
			}
		}
	elseif(mission == 4) then --Prêmio da average mission
		prize[tu] = 
		{
			{
				id = 2160,
				count = 5
			}
		}
	elseif(mission == 5) then --Prêmio da averagest mission
		prize[tu] = 
		{
			{
				id = 2160,
				count = 10
			}
		}
	elseif(mission == 6) then --Prêmio da hard mission
		prize[tu] = 
		{
			{
				id = 2160,
				count = 50
			}
		}
	elseif(mission == 7) then --Prêmio da hardest mission
		prize[tu] = 
		{
			{
				id = 2160,
				count = 90
			}
		}
	elseif(mission == 8) then --Prêmio da insane mission
		prize[tu] = 
		{
			{
				id = 2400,
				count = 1
			}
		}	
	end
	local r = math.random(1,#prize[tu])
	return doPlayerAddItem(cid, prize[tu][r].id, prize[tu][r].count)
end


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local level = {}
local missionStg = {}
local monster = {}
local db = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function MS_getMission(level)
	if(level >= 1 and level <= 5) then return '{newbie mission}'
	elseif(level >= 6 and level <= 15) then return '{newbie mission}, {basic mission}'
	elseif(level >= 16 and level <= 25) then return '{newbie mission}, {basic mission}, {basiest mission}'
	elseif(level >= 26 and level<= 50) then return '{newbie mission}, {basic mission}, {basiest mission}, {average mission}'
	elseif(level >= 51 and level <= 80) then return '{newbie mission}, {basic mission}, {basiest mission}, {average mission}, {averagest mission}'
	elseif(level >= 81 and level <= 120) then return '{newbie mission}, {basic mission}, {basiest mission}, {average mission}, {averagest mission}, {hard mission}'
	elseif(level >= 121 and level <= 200) then return '{newbie mission}, {basic mission}, {basiest mission}, {average mission}, {averagest mission}, {hard mission}, {hardest mission}'
	elseif(level >= 201) then return '{newbie mission}, {basic mission}, {basiest mission}, {average mission}, {averagest mission}, {hard mission}, {hardest mission}, {insane mission}' end
end
		

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	level[talkUser] = getPlayerLevel(cid)

	if(msgcontains(msg, 'job')) then
		selfSay('I\'m a mercenary, but actually I don\'t like my job. If you make my dirty job to me, I can thank you so much *hehehe* Let\'s start with the {missions}.', cid)
	end
	if(msgcontains(msg, 'missions') or msgcontains(msg, 'stuff')) then
		if(level[talkUser] == 1) then
			selfSay('Become more stronger and come back to me.', cid)
		else
			selfSay('I see... So, you are a level '..level[talkUser]..', eh? In your level, you can do the following missions: '..MS_getMission(level[talkUser])..'.', cid)
		end
	end
	
	if(msgcontains(msg, 'newbie mission')) then
		if(level[talkUser] == 1) then
			selfSay('You have to be at last level 2 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677971)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 1)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back when you cut their head off.', cid)
				setPlayerStorageValue(cid, 677971, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 1
					else
						selfSay('Congratulations, you have finished the newbie mission! Here are your prize.', cid)
						MS_prize(cid, 1, talkUser)
						setPlayerStorageValue(cid, 677971, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say newbie mission again to restart.', cid)
			setPlayerStorageValue(cid, 677971, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	if(msgcontains(msg, 'basic mission')) then
		if(level[talkUser] < 6) then
			selfSay('You have to be at last level 6 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677972)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 2)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back when you put them in their line.', cid)
				setPlayerStorageValue(cid, 677972, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 2
					else
						selfSay('Congratulations, you have finished the basic mission! Here are your prize.', cid)
						MS_prize(cid, 2, talkUser)
						setPlayerStorageValue(cid, 677972, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say basic mission again to restart.', cid)
			setPlayerStorageValue(cid, 677972, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 2) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end

	if(msgcontains(msg, 'basiest mission')) then
		if(level[talkUser] < 16) then
			selfSay('You have to be at last level 16 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677973)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 3)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back when you finish them.', cid)
				setPlayerStorageValue(cid, 677973, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 3
					else
						selfSay('Congratulations, you have finished the basiest mission! Here are your prize.', cid)
						MS_prize(cid, 3, talkUser)
						setPlayerStorageValue(cid, 677973, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say basiest mission again to restart.', cid)
			setPlayerStorageValue(cid, 677973, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 3) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	if(msgcontains(msg, 'average mission')) then
		if(level[talkUser] < 26) then
			selfSay('You have to be at last level 26 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677974)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 4)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back when you\'ve fought all them.', cid)
				setPlayerStorageValue(cid, 677974, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 4
					else
						selfSay('Congratulations, you have finished the average mission! Here are your prize.', cid)
						MS_prize(cid, 4, talkUser)
						setPlayerStorageValue(cid, 677974, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say average mission again to restart.', cid)
			setPlayerStorageValue(cid, 677974, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 4) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	if(msgcontains(msg, 'averagest mission')) then
		if(level[talkUser] < 51) then
			selfSay('You have to be at last level 51 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677975)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 5)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back when you send them back to hell.', cid)
				setPlayerStorageValue(cid, 677975, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 5
					else
						selfSay('Congratulations, you have finished the averagest mission! Here are your prize.', cid)
						MS_prize(cid, 5, talkUser)
						setPlayerStorageValue(cid, 677975, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say averagest mission again to restart.', cid)
			setPlayerStorageValue(cid, 677975, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 5) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	if(msgcontains(msg, 'hard mission')) then
		if(level[talkUser] < 81) then
			selfSay('You have to be at last level 81 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677976)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 6)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back when you vanish they all.', cid)
				setPlayerStorageValue(cid, 677976, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 6
					else
						selfSay('Congratulations, you have finished the hard mission! Here are your prize.', cid)
						MS_prize(cid, 6, talkUser)
						setPlayerStorageValue(cid, 677976, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say hard mission again to restart.', cid)
			setPlayerStorageValue(cid, 677976, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 6) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	if(msgcontains(msg, 'hardest mission')) then
		if(level[talkUser] < 121) then
			selfSay('You have to be at last level 121 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677977)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 7)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back with their dust, man!', cid)
				setPlayerStorageValue(cid, 677977, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 7
					else
						selfSay('Congratulations, you have finished the hardest mission! Here are your prize.', cid)
						MS_prize(cid, 7, talkUser)
						setPlayerStorageValue(cid, 677977, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say hardest mission again to restart.', cid)
			setPlayerStorageValue(cid, 677977, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 7) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	if(msgcontains(msg, 'insane mission')) then
		if(level[talkUser] < 201) then
			selfSay('You have to be at last level 201 to make this mission.', cid)
		else
			missionStg[talkUser] = getPlayerStorageValue(cid, 677978)
			if(missionStg[talkUser] == -1) then
				monster[talkUser] = MS_createMission(talkUser, 8)
				selfSay('Your mission is defeat '..MS_kills..' monsters called '..monster[talkUser]..'. Come back with victory to become a hero.', cid)
				setPlayerStorageValue(cid, 677978, monster[talkUser]..","..MS_kills)
			else
				if(missionStg[talkUser] == "ok") then
					selfSay('You have already completed this mission.', cid)
				else
					db[talkUser] = string.explode(missionStg[talkUser], ",")
					if(tonumber(db[talkUser][2]) > 0) then
						selfSay('You killed '..MS_kills-tonumber(db[talkUser][2])..'/'..MS_kills..' '..db[talkUser][1]..'. Do you want to abort this mission and start a new one? It\'ll cost '..MS_reset..' gp.', cid)
						talkState[talkUser] = 8
					else
						selfSay('CONGRATULATIONS, you have finished the insane mission!! Here are your prize.', cid)
						MS_prize(cid, 8, talkUser)
						setPlayerStorageValue(cid, 677978, "ok")
					end
				end
			end
		end		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then
		talkState[talkUser] = 0
		if(doPlayerRemoveMoney(cid, MS_reset) == TRUE) then
			selfSay('Ok, mission aborted. Say insane mission again to restart.', cid)
			setPlayerStorageValue(cid, 677978, -1)
		else
			selfSay('Sorry, you don\'t have enough gold.', cid)
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 8) then
		talkState[talkUser] = 0
		selfSay('Ok, then back to work.', cid)
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
