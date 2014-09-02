  --- Perfect refine system by Mock the bear (MTB).
--- Email: [email]mock_otnet@hotmail.com[/email]
local gain = {
gainArmor='&p+1',loseArmor='&p-1',
gainShield='&s+#',loseShield='&s-(#+1)',
gainAttack='&a+#+1',loseAttack='&a-(#+1)-1',
gainDefense='&d+#+2',loseDefense='&d-(#+1)-2',
chance='100/((#*(1/(@/2)))*(@/2))',  -- This equation its good to use items 0-7.
--- This equation must need return chance in % (0-100) 100 = always, 0 = never.
maxlvl = 7,
blocked_ids = {2488,8881}
}
-- &a = weapon attack
-- &d = weapon defense
-- &s = shield defense
-- &p = armor defense
-- # = weapon curr level
-- @ = max level
function isArmor(uid) -- Function by Mock the bear.
         uid = uid or 0
         if getItemArmor(uid) > 0 and getItemAttack(uid) == 0 and getItemDefense(uid) == 0 and getItemWeaponType(uid) == 0 then
             return TRUE
         end
         return FALSE
end
function isWeapon(uid) -- Function by Mock the bear.
         uid = uid or 0
         local f = getItemWeaponType(uid)
         if f == 1 or f == 2 or f == 3 then
             return TRUE
         end
         return FALSE        
end
function isShield(uid) -- Function by Mock the bear.
         uid = uid or 0
         if getItemWeaponType(uid) == 4 then
             return TRUE
         end
         return FALSE        
end

function getWeaponLevel(uid) -- Function by Mock the bear.
   uid = uid or 0
   local name = getItemName(uid)
   local _,_,lvl = string.find(name,'+(%d+)')
   return tonumber(lvl) or 0
end
function doTransform(s,uid) -- Function by Mock the bear.
    local c = string.gsub(s,'@',gain.maxlvl)
    local c = string.gsub(c,'&a',getItemAttack(uid))
    local c = string.gsub(c,'&d',getItemDefense(uid))
    local c = string.gsub(c,'&s',getItemDefense(uid))
    local c = string.gsub(c,'&p',getItemArmor(uid))
    local c = string.gsub(c,'#',getWeaponLevel(uid))
    local q,err = loadstring('return '..c)
    assert(q,err)
    return assert(q())
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
         toPosition.stackpos = 255
         if isInArray(gain.blocked_ids, itemEx.itemid) == TRUE
          or getItemWeaponType(itemEx.uid) > 4
           or (getItemWeaponType(itemEx.uid) == 0
            and isArmor(itemEx.uid) == FALSE)
             or itemEx.itemid == 0 then
                doPlayerSendTextMessage(cid, 24,"You cant refine this item.")
                return TRUE
         end
         if isCreature(itemEx.uid) == TRUE then
            return FALSE
         end
        local level = getWeaponLevel(itemEx.uid)
        local chance = doTransform(gain.chance,itemEx.uid)
        if chance >= math.random(0,100) or item.actionid >= 1000 then
           if level+1 > gain.maxlvl then
              doSendMagicEffect(toPosition, 2)
              return doPlayerSendTextMessage(cid, 24,"Your item is on max level, you can't upgrade it.")
           else
              setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1))
              doPlayerSendTextMessage(cid, 24,"Your item has been upgrated to +"..(level+1)..".")
              doSendMagicEffect(toPosition, 12)
              if isArmor(itemEx.uid) == TRUE then
                 local get = doTransform(gain.gainArmor,itemEx.uid)
                 setItemArmor(itemEx.uid,get)
              elseif isWeapon(itemEx.uid) == TRUE then
                  setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx.uid))
                  setItemDefense(itemEx.uid, doTransform(gain.gainDefense,itemEx.uid))              
              elseif isShield(itemEx.uid) == TRUE then
                  setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx.uid))  
              end
           end
        else
           
           if level == 0 then
               doPlayerSendTextMessage(cid, 24,"No effect.")
               doSendMagicEffect(toPosition, 2)
           elseif level == gain.maxlvl then
                  doSendMagicEffect(toPosition, 2)
                  return doPlayerSendTextMessage(cid, 24,"Your item is on max level, you can't upgrade it.")
           elseif level > 0 then
               if level == 1 then
                   setItemName(itemEx.uid, getItemNameById(itemEx.itemid))
                   doPlayerSendTextMessage(cid, 24,"Your item back to normal.")
               else
                   setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level-1))
                   doPlayerSendTextMessage(cid, 24,"Your item back to +"..(level-1)..".")
               end
              if isArmor(itemEx.uid) == TRUE then
                 setItemArmor(itemEx.uid,doTransform(gain.loseArmor,itemEx.uid))
              elseif isWeapon(itemEx.uid) == TRUE then
                  setItemAttack(itemEx.uid, doTransform(gain.loseAttack,itemEx.uid))
                  setItemDefense(itemEx.uid, doTransform(gain.loseDefense,itemEx.uid))              
              elseif isShield(itemEx.uid) == TRUE then
                  setItemDefense(itemEx.uid, doTransform(gain.loseShield,itemEx.uid))  
              end
           end
           doSendMagicEffect(toPosition, 9)
        end
     doRemoveItem(item.uid,1)  
     return TRUE
end 