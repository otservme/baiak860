function onSay(cid, words, param, channel)
local cfg = { level = 0, vocs = { 9, 10, 11, 12 }, storage = 13540, cost = 0, msgtype = MESSAGE_STATUS_CONSOLE_BLUE }
    if getPlayerStorageValue(cid, cfg.storage) == -1 then
        if getPlayerLevel(cid) >= cfg.level then
            if isInArray(cfg.vocs, getPlayerVocation(cid)) == true then
                if (getPlayerMoney(cid) >= cfg.cost) then
		    doPlayerRemoveMoney(cid, cfg.cost)
                    setPlayerPromotionLevel(cid, getPlayerPromotionLevel(cid) + 1)
                    doPlayerSendTextMessage(cid, cfg.msgtype, "You have been promoted to ".. getVocationInfo(getPlayerVocation(cid)).name ..".")
                    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
                    setPlayerStorageValue(cid, cfg.storage, 1)
                else
                    doPlayerSendTextMessage(cid, cfg.msgtype, "You need ".. cfg.cost .." gold coins to purchase the second promotion.")
                end
            else
                doPlayerSendTextMessage(cid, cfg.msgtype, "Only players with first promotion may get the second promotion.")
            end
        else
            doPlayerSendTextMessage(cid, cfg.msgtype, "Only characters of level ".. cfg.level .." or above, may purchase the second promotion.")
        end
    else
        doPlayerSendTextMessage(cid, cfg.msgtype, "You have already purchased the second promotion.")
    end
    return true
end