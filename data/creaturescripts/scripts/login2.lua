-- Script made by Huggen --
-- Make players can´t log in if it haven´t gone 2 sec from last player --
-- Config --
storage = 9876
seconds = 2
-- Config --
function onLogin(cid)
    gone = os.time()
    if getGlobalStorageValue(storage)+seconds < gone then
        setGlobalStorageValue(storage, os.time())
        return TRUE
    else
        return FALSE
    end
return TRUE
end