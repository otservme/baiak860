function onLogin(cid)

timenow = os.time()
quantity = math.floor((getPlayerStorageValue(cid,13540) - timenow)/(3600*24))
if isPlayer(cid) then
if quantity > 0 then
message = "Você tem "..quantity.." dias VIP."
else
doPlayerPopupFYI(cid,"Seus dias VIP acabaram.")
end
end
return TRUE
end