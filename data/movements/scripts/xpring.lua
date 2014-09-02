local config = {
 
        rate            = 20, -- 2.0 = dobro do normal.
        un_equip        = 6300, -- Item ID do UN-Equipped ring.
        equip           = 6301 -- Item ID Equipped ring.
 
}
 
function onDeEquip(cid, item, slot)
        doPlayerSetExperienceRate(cid, 1.0)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua XP voltou ao normal")
        doTransformItem(item.uid, config.un_equip)
        return true
end
 
function onEquip(cid, item, slot)
        if getConfigValue("experienceStages") == "yes" then
           doPlayerSetExperienceRate(cid, getExperienceStage(getPlayerLevel(cid))*1.2)
        else
           doPlayerSetExperienceRate(cid, getConfigValue("rateExperience")*1.2)
        end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Seu Xp aumentou para + " .. config.rate .. " %. ")
        doTransformItem(item.uid, config.equip)
        doDecayItem(item.uid)
        return true
end