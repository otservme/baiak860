----Made by Jo3Bingham
----Thanks to MokerHamer & Gesior.pl for their scripts



----Do Not Edit
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg) end
function onThink()				npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)


if(npcHandler.focus ~= cid) then
	return false
end
----End Do Not Edit



----Stuff
PlayerGold = getPlayerItemCount(cid,2148)
PlayerPlatinum = getPlayerItemCount(cid,2152)*100
PlayerCrystal = getPlayerItemCount(cid,2160)*10000
PlayerTotalMoney = PlayerGold + PlayerPlatinum + PlayerCrystal


local BalanceAmount = getPlayerStorageValue(cid, 300)
if BalanceAmount == -1 then
	BalanceAmount = 0
	setPlayerStorageValue(cid, 300, 0)
end
----End Stuff


----Messages

----Basic Replies
if msgcontains(string.lower(msg), 'job') then
	selfSay('I work in this bank. I can change money for you and help you with your bank account.')


elseif string.lower(msg) == 'bank' or msgcontains(string.lower(msg), 'money') then
        selfSay('We can change money for you. You can also access your bank account.')


elseif msgcontains(string.lower(msg), 'bank account') then
	selfSay('From now on every Tibian has one. The big advantage is that you can access your money in every branch of the Tibian Bank! ...')
	selfSay('Would you like to know more about the basic functions of your bank account or are you already bored, perhaps?')


elseif msgcontains(string.lower(msg), 'basic') then
	selfSay('You can check the balance of your bank account, deposit money or withdraw it. You can also transfer money to other characters, provided that they have a vocation.')
----End Basic Replies



----Deposit
elseif string.lower(msg) == 'deposit' then
	selfSay('Please tell me how much gold it is you would like to deposit.')
	talk_state = 1

elseif string.lower(msg) == 'deposit all' then
	if PlayerTotalMoney == 0 then
		selfSay('You do not have any gold.')
		talk_state = 0
	else
		DepositAmount = PlayerTotalMoney
		selfSay('Would you really like to deposit '..DepositAmount..' gold?')
		talk_state = 2
	end

elseif talk_state == 1 then
	talk_state = 0
	if isNumber(msg) == TRUE then
		DepositAmount = getCount(msg)
		if DepositAmount == 0 then
			selfSay('You are joking, aren\'t you??')
		elseif DepositAmount > 0 then
			if PlayerTotalMoney < DepositAmount then
				selfSay('You do not have enough gold.')
			else
				selfSay('Would you really like to deposit '..DepositAmount..' gold?')
				talk_state = 2
			end
		end
	else
		selfSay('As you wish. Is there something else I can do for you?')
	end


elseif talk_state == 2 then
	talk_state = 0
	if string.lower(msg) == 'yes' then
		selfSay('Alright, we have added the amount of '..DepositAmount..' gold to your balance. You can withdraw your money anytime you want to.')
		doPlayerRemoveMoney(cid, DepositAmount)
		setPlayerStorageValue(cid, 300, BalanceAmount + DepositAmount)
	elseif string.lower(msg) == 'no' then
		selfSay('As you wish. Is there something else I can do for you?')
	end
----End Deposit




----Balance
elseif string.lower(msg) == 'balance' then
	selfSay('Your account balance is '..BalanceAmount..' gold.')
----End Balance



----Withdraw
elseif string.lower(msg) == 'withdraw' then
	selfSay('Please tell me how much gold you would like to withdraw.')
	talk_state = 3


elseif talk_state == 3 then
	talk_state = 0
	if isNumber(msg) == TRUE then
		WithdrawAmount = getCount(msg)
		if WithdrawAmount == 0 then
			selfSay('Sure, you want nothing you get nothing!')
		elseif WithdrawAmount > 0 then
			if BalanceAmount < WithdrawAmount then
				selfSay('There is not enough gold on your account.')
			else
				selfSay('Are you sure you wish to withdraw '..WithdrawAmount..' gold from your bank account?')
				talk_state = 4
			end
		end
	else
		selfSay('As you wish. Is there something else I can do for you?')
	end


elseif talk_state == 4 then
	talk_state = 0
	if string.lower(msg) == 'yes' then
		selfSay('Here you are, '..WithdrawAmount..' gold. Please let me know if there is something else I can do for you.')
		setPlayerStorageValue(cid, 300, BalanceAmount - WithdrawAmount)
		doPlayerAddMoney(cid, WithdrawAmount)
	elseif string.lower(msg) == 'no' then
		selfSay('The customer is king! Come back anytime you want to if you wish to withdraw your money.')
	end
----End Withdraw



----Transfer
elseif string.lower(msg) == 'transfer' then
	selfSay('Please tell me the amount of gold you would like to transfer.')
	talk_state = 5


elseif talk_state == 5 then
	talk_state = 0
	if isNumber(msg) == TRUE then
		TransferAmount = getCount(msg)
		if TransferAmount == 0 then
			selfSay('Please think about it. Okay?')
		elseif TransferAmount > 0 then
			if BalanceAmount < TransferAmount then
				selfSay('There is not enough gold on your account.')
			else
				selfSay('Who would you like to transfer '..TransferAmount..' gold to?')
				talk_state = 6
			end
		end
	else
		selfSay('As you wish. Is there something else I can do for you?')
	end


elseif talk_state == 6 then
	talk_state = 0
	Player = msg
	PlayerBalance = getBA(msg)
	if PlayerBalance == -1 then
		selfSay('This player does not exist.')
	else
		selfSay('So you would like to transfer '..TransferAmount..' gold to '..Player..'?')
		talk_state = 7
	end


elseif talk_state == 7 then
	talk_state = 0
	if string.lower(msg) == 'yes' then
		selfSay('You have transferred '..TransferAmount..' gold to '..Player..'.')
		setBA(Player, PlayerBalance + TransferAmount)
		setPlayerStorageValue(cid, 300, BalanceAmount - TransferAmount)
	elseif string.lower(msg) == 'no' then
		selfSay('Ok. What is next?')
	end
----End Transfer



end
----End Messages



return true
end
----End Function



----Set Player Balance
function setBA(name, nvalue) --save bank account value for online and offline players
	local playerid = getPlayerByName(name)
	set_status = -1
	if isPlayer(playerid) == TRUE then
		--player is online 
		setPlayerStorageValue(playerid,300,nvalue)
		set_status = 1
		return 1
	else
		--player is offline, load DB connection info and connect
		dofile("./config.lua")
	    if sqlType == "mysql" then 
	         env = assert(luasql.mysql()) 
	         con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort)) 
	    else -- sqlite 
	         env = assert(luasql.sqlite3()) 
	         con = assert(env:connect(sqliteDatabase)) 
	    end 
		--check is player exist
		local nametodb = escapeString(name)
		result_plr = assert(con:execute("SELECT `id` FROM `players` WHERE `name` = '" .. nametodb .. "';"))
		player = result_plr:fetch({}, "a")
		local players = 0
		local guid = 0
		while player do
			players = players + 1
			guid = tonumber(player.id)
			player = result_plr:fetch (player, "a")
		end
		if players > 0 then
			if guid > 0 then
			--player exist, check his account status
				storageqry = assert(con:execute("SELECT `value` FROM `player_storage` WHERE `player_id` = '" .. guid .. "' AND `key` = 300;"))
				storage = storageqry:fetch({}, "a")
				local whiles = 0
				while storage do
					whiles = whiles + 1
					storage = storageqry:fetch (storage, "a")
				end
				if whiles < 1 then
					--if player hasn't account, create account and set account balance value 'nvalue'
					assert(con:execute("INSERT INTO `player_storage` (`player_id` ,`key` ,`value`) VALUES ('" .. guid .. "', '300', '" .. nvalue .. "');"))
					set_status = 1
				else
					assert(con:execute("UPDATE `player_storage` SET `value` = '" .. nvalue .. "' WHERE `player_id` = '" .. guid .. "' AND `key` = 300;"))
					set_status = 1
				end
			end
		else
			--player with this name doesn't exist
			set_status = -1
		end
		con:close()
		env:close()
	end
	--if player not exist return -1
	--if player exist return his bank account value
	return set_status
end
----End Set Player Balance



----Get Player Balance
function getBA(name) -- check account balance for offline and online players
    local playerid = getPlayerByName(name)
    if isPlayer(playerid) == TRUE then
        --player is online 
        local player_cash_str = getPlayerStorageValue(playerid, 300)
        --create bank account if not exist
        if player_cash_str < 0 then
            setPlayerStorageValue(playerid,300,0)
            player_cash = 0
        else
            player_cash = player_cash_str
        end
    else
        --player is offline, load DB connection info and connect
        dofile("./config.lua")
        if sqlType == "mysql" then 
             env = assert(luasql.mysql()) 
             con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort)) 
        else -- sqlite 
             env = assert(luasql.sqlite3()) 
             con = assert(env:connect(sqliteDatabase)) 
        end 
        --check is player exist
        local nametodb = escapeString(name)
        result_plr = assert(con:execute("SELECT `id` FROM `players` WHERE `name` = '" .. nametodb .. "';"))
        player = result_plr:fetch({}, "a")
        local players = 0
        local guid = 0
        while player do
            players = players + 1
            guid = tonumber(player.id)
            player = result_plr:fetch (player, "a")
        end
        if players > 0 then
            if guid > 0 then
            --player exist, check his account status
                storageqry = assert(con:execute("SELECT `value` FROM `player_storage` WHERE `player_id` = '" .. guid .. "' AND `key` = 300;"))
                storage = storageqry:fetch({}, "a")
                local whiles = 0
                while storage do
                    whiles = whiles + 1
                    player_cash = tonumber(storage.value)
                    storage = storageqry:fetch (storage, "a")
                end
                if whiles < 1 then
                    --if player hasn't account, create account and set account balance value to 0
                    assert(con:execute("INSERT INTO `player_storage` (`player_id` ,`key` ,`value`) VALUES ('" .. guid .. "', '300', '0');"))
                    player_cash = 0
                end
            end
        else
            --player with this name doesn't exist
            player_cash = -1
        end
        con:close()
        env:close()
    end
    --if player not exist return -1
    --if player exist return his bank account value
    return player_cash
end
----End Get Player Balance



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
