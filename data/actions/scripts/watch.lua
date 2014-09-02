function onUse(cid, item, frompos, item2, topos)
 -- Working watch - by Alreth (v1.32)
     twentyfour = false -- Set to true to use 24-hour clock and false to use 12-hour clock
     tibiantime = true -- Set to true to show Tibian ingame time and false to show the time on the server computer.
     
     if (tibiantime == false) then
         if (twentyfour == true) then
             time = os.date('%H:%M')
         else
             time = os.date('%I:%M %p')
         end
     else
         time = rl2tib(os.date('%M'), os.date('%S'), twentyfour)
     end
     doPlayerSendTextMessage(cid, 22, "The time is "..time..".")
     return 1
 end
 
 function rl2tib(min, sec, twentyfour)
 -- Convert RL time to ingame Tibia time - by Alreth (v1.13)
     suffix = ''
     varh = (min*60+sec)/150
     tibH = math.floor(varh)             -- Tibian hour
     tibM = math.floor(60*(varh-tibH))   -- Tibian minute
     
     if (twentyfour == false) then
         if (tonumber(tibH) > 11) then
             tibH = tonumber(tibH) - 12
             suffix = ' pm'
         else
             suffix = ' am'
         end
         if (tibH == 0) then
             tibH = 12
         end
     end
     if (tibH < 10) then
         tibH = '0'..tibH
     end
     if (tibM < 10) then
         tibM = '0'..tibM
     end
     return (tibH..':'..tibM..suffix)
 end