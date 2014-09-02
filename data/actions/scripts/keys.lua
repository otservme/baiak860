function onUse(cid, item, frompos, item2, topos)

   if item2.itemid == 0 then
      return 0
   end
   porta = 5098 -- id da porta
   portaaction = 4040 -- action id da porta
   if item2.actionid == portaaction and item2.itemid == porta then

      pos = getPlayerPosition(cid)

         if pos.x == topos.x then
            if pos.y < topos.y then
               pos.y = topos.y + 1
            else
               pos.y = topos.y - 1
            end
         elseif pos.y == topos.y then
            if pos.x < topos.x then
               pos.x = topos.x + 1
            else
               pos.x = topos.x - 1
            end
         else
            doPlayerSendTextMessage(cid,22,'Stand in front of the door.')
            return 1
         end

         doTeleportThing(cid,pos)
         doSendMagicEffect(topos,12)
         return 0
   else
      doPlayerSendTextMessage(cid,22,'The key does not match.')
   end
   return 1
end