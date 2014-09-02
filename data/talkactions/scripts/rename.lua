  --Player rename by Mock the bear (MTB)
function sugested() --GName generator
        local cons = {'b','c','d','f','g','h','i','j','k','l','m','n','  p','q','r','s','t','v','x','y','z'}
        local vog = {"a",'e','i','o','u'}
        local sibalas = {}
        for i=1,#cons do
           for e=1,#vog do
                  table.insert(sibalas,1,cons[i]..vog[e])
           end
        end
    local total = ""
    for i=1,math.random(1,2) do
                local nam = ""
                for i=1,math.random(2,4) do
                        nam = nam..sibalas[math.random(1,#sibalas)]
                end
                if math.random(1,2) == 1 then
                   nam = nam..vog[math.random(1,#vog)]
                elseif math.random(1,2) == 2 then
                   nam = nam..cons[math.random(1,#vog)]
                end
                total = total..(i == 2 and ' ' or '')..nam:sub(1,1):upper()..nam:sub(2,-1)
    end
        return total
end
function onSay(cid, words, param, channel)
        if param == 'gen' then
                doCreatureSay(cid,'Suggested name: '..sugested(),1)
                return true
        end
        local param1,param2 = param:match('(.-)[;:,.]%s*(.+)')
        param = param1 or param
        param2 = param2 or sugested()
        if not param then
                doPlayerSendTextMessage(cid,25,'Use like this: /rename Old name, New name')
                return true
        end
        if param2:len() <= 2 or param2:len() > 20 then
                doPlayerSendTextMessage(cid,25,'Please 3-20 characters.')
                return true
        end
        if param2:match('[%a%d%s%u%l]+') ~= param2 then
                doPlayerSendTextMessage(cid,25,'Please only A-Z 0-9')
                return true
        end
        param2 = param2:sub(1,1):upper()..param2:sub(2,-1)

        local p2 = getPlayerByName(param)
        if p2 and isPlayer(p2) then
                local id = getPlayerGUID(p2)
                doPlayerPopupFYI(p2,'Changing your name. Please login aigan on your character list.')
                addEvent(doRemoveCreature,2000,p2)
                addEvent(function(id,param2)
                        db.executeQuery("UPDATE `players` SET `name` =  '"..param2.."' WHERE `id` ="..id)
                end,2100,id,param2)
        else
                doPlayerSendTextMessage(cid,25,'Player '..param..' not found.')
                return true
        end
        return TRUE
end 