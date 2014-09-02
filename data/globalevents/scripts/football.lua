function onThink(interval, lastExecution)
    for m = 1 , #football_positions_uids do
        match = football_positions_uids[m]
        if(getGlobalStorageValue(match[1]) == -1) then
            for t = match[1], match[12] do
                setGlobalStorageValue(t, 0)
            end
        end
        end_time = getGlobalStorageValue(match[1])
        if(end_time > 0 and end_time < os.time()) then
            toPoss = {match[6], match[7]}
            team_players = {"", ""}
            for i = 1, 2 do
                teamPoss = toPoss[i]
                for p = 1, #teamPoss do
                    team_players[i] = team_players[i] .. getCreatureName(getGlobalStorageValue(teamPoss[p]))
                    if p ~= #teamPoss then
                        team_players[i] = team_players[i] .. ", "
                    end
                end
            end
            score = "Team 1 (" .. team_players[1] .. ") - " .. getGlobalStorageValue(match[2]) .. " : " .. getGlobalStorageValue(match[3]) .. " - (" .. team_players[2] .. ") Team 2"
            doBroadcastMessage("Football field " .. m .. ". " .. score, MESSAGE_STATUS_CONSOLE_BLUE)
            for i = 1, 2 do
                teamPoss = toPoss[i]
                exitPos = getThingPos(match[1])
                for p = 1, #teamPoss do
                    doTeleportThing(getGlobalStorageValue(teamPoss[p]), exitPos, TRUE)
                    doPlayerSendTextMessage(getGlobalStorageValue(teamPoss[p]), MESSAGE_STATUS_CONSOLE_ORANGE, "You were in Team " .. i .. " on field " .. m .. ". " .. score)
                end
            end
            for i = match[1], match[12] do
                setGlobalStorageValue(i, 0)
            end
        end
    end
    return true
end  