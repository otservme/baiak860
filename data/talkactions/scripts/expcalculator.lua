function onSay(cid, words, param)
-- Made by Xikez
        local futurelevel = getPlayerLevel(cid) + 1
        local lv = getPlayerLevel(cid)

        if lv > 1 then
  equation = (50 * (lv) * (lv) * (lv) - 150 * (lv) * (lv) + 400 * (lv)) / 3
  msg = "Level ".. futurelevel .." requires ".. equation .." experience to achieve."
        else
  msg = "Level 2 requires 100 experience to achieve."
        end
        doPlayerSendTextMessage(cid, 24, msg)
        doPlayerSendTextMessage(cid, 25, words)
        return 0        
end