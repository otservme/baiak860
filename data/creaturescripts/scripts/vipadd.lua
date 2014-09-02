function onAdvance(cid, oldlevel, newlevel)

days = 2
daysvalue = days*3600*24
storageplayer = getPlayerStorageValue(player,13540)
timenow = os.time()
if storageplayer == -1 or storageplayer == 0 then
time = timenow+daysvalue
else
time = storageplayer+daysvalue
end

if getPlayerLevel(cid) == 180 and getPlayerStorageValue(cid,9090) == -1 then
setPlayerStorageValue(cid,13540,time)
setPlayerStorageValue(cid,9090,1)
doPlayerSendTextMessage(cid,22, "Você recebeu dois dias de Vip.")
end
return TRUE
end 
