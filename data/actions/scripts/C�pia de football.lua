function onUse(cid, item, fromPosition, itemEx, toPosition)
--script maked by Fare, for otland community.
--position of players when pressing switch, change to yourselfs coordinates
 local pos1 = {x=9, y=50, z=7, stackpos=1}
 local pos2 = {x=9, y=51, z=7, stackpos=1}
 local pos3 = {x=9, y=52, z=7, stackpos=1}
 local pos4 = {x=43, y=50, z=7, stackpos=1}
 local pos5 = {x=43, y=51, z=7, stackpos=1}
 local pos6 = {x=43, y=52, z=7, stackpos=1}
-- end of positions
local player1 = getThingfromPos(pos1)
local player2 = getThingfromPos(pos2)
local player3 = getThingfromPos(pos3)
local player4 = getThingfromPos(pos4)
local player5 = getThingfromPos(pos5)
local player6 = getThingfromPos(pos6)
local teleportpos = {x=26, y=51, z=7, stackpos=1} --middle of your soccer field, ball will spawn here
local getteleport = getThingfromPos(teleportpos)
if getteleport.itemid == 1387 then
        if isPlayer(player1.uid) == TRUE and isPlayer(player2.uid) == TRUE and isPlayer(player3.uid) == TRUE and isPlayer(player4.uid) == TRUE and isPlayer(player5.uid) == TRUE and isPlayer(player6.uid) == TRUE then
        local pos11 = {x=24, y=50, z=7, stackpos=1}
        local pos22 = {x=24, y=51, z=7, stackpos=1}
        local pos33 = {x=24, y=52, z=7, stackpos=1}
        local pos44 = {x=28, y=50, z=7, stackpos=1}
        local pos55 = {x=28, y=51, z=7, stackpos=1}
        local pos66 = {x=28, y=52, z=7, stackpos=1}
        local team1 = getPlayerGUIDByName(getCreatureName(player1.uid))
        local team2 = getPlayerGUIDByName(getCreatureName(player4.uid))
        setGlobalStorageValue(15024, 0) 
        setGlobalStorageValue(15025, 0)
        setGlobalStorageValue(15026, team1)
        setGlobalStorageValue(15027, team2)
        setGlobalStorageValue(15029, 0)
        doBroadcastMessage("Football match with "..getPlayerName(player1.uid).."'s team and "..getPlayerName(player4.uid).."'s team started!", MESSAGE_EVENT_ADVANCE)
        doTeleportThing(player1.uid,pos11,0)
        doTeleportThing(player2.uid,pos22,0)
        doTeleportThing(player3.uid,pos33,0)
        doTeleportThing(player4.uid,pos44,0)
        doTeleportThing(player5.uid,pos55,0)
        doTeleportThing(player6.uid,pos66,0)
        doRemoveItem(getteleport.uid,1)
        doCreateItem(2109,1,teleportpos)
        else
        doPlayerSendTextMessage(cid, 22, "Voce precisa de 2 times, 3 jogadores em cada time, para iniciar a partida!")
        end
else
doPlayerSendTextMessage(cid, 22, "Need wait until previous command will end the match!")
end
end  