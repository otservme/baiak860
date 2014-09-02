local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local moneyTo = {}
local playerTo = {}

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

local function isValidMoney(money)
    if isNumber(money) == TRUE and money > 0 and money < 999999999 then
        return TRUE
    end
    return FALSE
end

function creatureSayCallback(cid, type, msg)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if msgcontains(msg, 'help') or msgcontains(msg, 'offer') then
        selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Balance ----------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'balance') or msgcontains(msg, 'Balance') then
        selfSay('Your account balance is '..getPlayerBalance(cid)..' gold.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Help -------------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'basic functions') then
        selfSay('You can check the {balance{ of your bank account, Pdeposit{ money or Pwithdraw{ it. You can also {transfer} money to othercharacters, provided that they have a vocation.', cid)
        talkState[cid] = 0
    elseif msgcontains(msg, 'advanced functions') then
        selfSay('Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you haveenough money.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Deposit ----------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'deposit all') then
        moneyTo[cid] = getPlayerMoney(cid)
        if moneyTo[cid] < 1 then
            selfSay('You don\'t have any money to deposit in you inventory..', cid)
            talkState[cid] = 0
        else
            selfSay('Would you really like to deposit '..moneyTo[cid]..' gold?', cid)
            talkState[cid] = 2
        end
    elseif msgcontains(msg, 'deposit') then
        selfSay("Please tell me how much gold it is you would like to deposit.", cid)
        talkState[cid] = 1
    elseif talkState[cid] == 1 then
        moneyTo[cid] = tonumber(msg)
        if isValidMoney(moneyTo[cid]) == TRUE then
            selfSay('Would you really like to deposit '..moneyTo[cid]..' gold?', cid)
            talkState[cid] = 2
        else
            selfSay('Is isnt valid amount of gold to deposit.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 2 then
        if msgcontains(msg, 'yes') then
            if doPlayerDepositMoney(cid, moneyTo[cid], 1) ~= TRUE then
                selfSay('You do not have enough gold.', cid)
            else
                selfSay('Alright, we have added the amount of '..moneyTo[cid]..' gold to your balance. You can withdraw your money anytime you want to. Your account balance is ' .. getPlayerBalance(cid) .. '.', cid)
            end
        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
        end
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Withdraw ---------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'withdraw') then
        selfSay("Please tell me how much gold you would like to withdraw.", cid)
        talkState[cid] = 6
    elseif talkState[cid] == 6 then
        moneyTo[cid] = tonumber(msg)
        if isValidMoney(moneyTo[cid]) == TRUE then
            selfSay('Are you sure you wish to withdraw '..moneyTo[cid]..' gold from your bank account?', cid)
            talkState[cid] = 7
        else
            selfSay('Is isnt valid amount of gold to withdraw.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 7 then
        if msgcontains(msg, 'yes') then
            if doPlayerWithdrawMoney(cid, moneyTo[cid]) ~= TRUE then
                selfSay('There is not enough gold on your account. Your account balance is '..getPlayerBalance(cid)..'. Please tell me the amount of gold coins you would like to withdraw.', cid)
            else
                selfSay('Here you are, ' .. moneyTo[cid] .. ' gold. Please let me know if there is something else I can do for you.', cid)
                talkState[cid] = 0
            end
        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
            talkState[cid] = 0
        end
-----------------------------------------------------------------
---------------------------- Transfer ---------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'transfer') then
        selfSay("Please tell me the amount of gold you would like to transfer.", cid)
        talkState[cid] = 11
    elseif talkState[cid] == 11 then
        moneyTo[cid] = tonumber(msg)
        if isValidMoney(moneyTo[cid]) == TRUE then
            selfSay('Who would you like transfer '..moneyTo[cid]..' gold to?', cid)
            talkState[cid] = 12
        else
            selfSay('Is isnt valid amount of gold to transfer.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 12 then
        playerTo[cid] = msg

        if getCreatureName(cid) == playerTo[cid] then
            selfSay('Ehm, You want transfer money to yourself? Its impossible!', cid)
            talkState[cid] = 0
            return TRUE
        end

        if playerExists(playerTo[cid]) then
            selfSay('So you would like to transfer ' .. moneyTo[cid] .. ' gold to "' .. playerTo[cid] .. '" ?', cid)
            talkState[cid] = 13
        else
            selfSay('Player with name "' .. playerTo[cid] .. '" doesnt exist.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 13 then
        if msgcontains(msg, 'yes') then
            if getPlayerBalance(cid) < moneyTo[cid] then
                selfSay('You dont have enought money on your bank account.', cid)
                return TRUE
            end

            if doPlayerTransferMoneyTo(cid, playerTo[cid], moneyTo[cid]) ~= TRUE then
                selfSay('This player does not exist on this world or have no vocation.', cid)
            else
                selfSay('You have transferred ' .. moneyTo[cid] .. ' gold to "' .. playerTo[cid] ..' ".', cid)
                playerTo[cid] = nil
            end
        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
        end
        talkState[cid] = 0
    end
    return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  