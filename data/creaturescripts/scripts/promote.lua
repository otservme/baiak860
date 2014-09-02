--[[ by vodkart ]]--
function onLogin(cid)  
 
if vip.hasVip(cid) == TRUE then
if(isInArray({5, 6, 7, 8}, getPlayerVocation(cid))) then  
doPlayerSetVocation(cid,getPlayerVocation(cid)+4)  
end

elseif vip.hasVip(cid) == FALSE and vip.getVip(cid) == 0 then 
if(isInArray({9, 10, 11, 12}, getPlayerVocation(cid))) then  -- id das vocation epic
doPlayerSetVocation(cid,getPlayerVocation(cid)-4)
end
end   
return TRUE 
end