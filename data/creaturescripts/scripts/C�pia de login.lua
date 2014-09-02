local message = [[Para ver as novidades se quiser é so digitar !notice

Para maiores informações sobre o OT visite o blog:
www.sotserv.blogspot.com
Ou o Fórum
www.supertibia.com
 
Enjoy xD]]

 
function onLogin(cid)

 registerCreatureEvent(cid, "PlayerKill")
    if (InitArenaScript ~= 0) then
    InitArenaScript = 1
    -- make arena rooms free
        for i = 42300, 42309 do
            setGlobalStorageValue(i, 0)
            setGlobalStorageValue(i+100, 0)
        end
    end
    -- if he did not make full arena 1 he must start from zero
    if getPlayerStorageValue(cid, 42309) < 1 then
        for i = 42300, 42309 do
            setPlayerStorageValue(cid, i, 0)
        end
    end
    -- if he did not make full arena 2 he must start from zero
    if getPlayerStorageValue(cid, 42319) < 1 then
        for i = 42310, 42319 do
            setPlayerStorageValue(cid, i, 0)
        end
    end
    -- if he did not make full arena 3 he must start from zero
    if getPlayerStorageValue(cid, 42329) < 1 then
        for i = 42320, 42329 do
            setPlayerStorageValue(cid, i, 0)
        end
    end
    if getPlayerStorageValue(cid, 42355) == -1 then
        setPlayerStorageValue(cid, 42355, 0) -- did not arena level
    end
    setPlayerStorageValue(cid, 42350, 0) -- time to kick 0
    setPlayerStorageValue(cid, 42352, 0) -- is not in arena  

	doPlayerPopupFYI(cid, message)
	registerCreatureEvent(cid, "PlayerDeath")
	--registerCreatureEvent(cid, "MEDALS") This is Nahruto's Metal System for killing someone, Dont add this unless you use it.--
	registerCreatureEvent(cid, "KilledMonstersCounter")
	registerCreatureEvent(cid, "playeradvance")
return TRUE

end