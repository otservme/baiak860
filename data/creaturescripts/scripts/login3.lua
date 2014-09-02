local message = [[Seja bem vindo ao Alissow OTs!
 
Utilize o canal help para maiores informações.
 
Enjoy xD]]


function onLogin(cid)

local msg = string.lower(param)
if message[msg] ~= nil then
str = getPlayerPopupFYI((message[msg][1]))
else
str = getPlayerPopupFYI((8))
end


doPlayerPopupFYI(cid, message)
return TRUE

end