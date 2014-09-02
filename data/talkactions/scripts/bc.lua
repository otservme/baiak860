function onSay(cid, words, param)
if getPlayerGroupId(cid) == 2 or getPlayerGroupId(cid) == 3 and param ~= nil then
local textColor = MESSAGE_EVENT_ADVANCE
local setColor = FALSE
if string.find(param," ",string.find(param,"[red,white,white2,orange,green,small,blue,red2]")+1) ~= nil then 
color = string.sub(param,0,string.find(param," ")-1)
if color == "red" then
textColor = MESSAGE_STATUS_WARNING
setColor = TRUE
elseif color == "white" then
textColor = MESSAGE_EVENT_ADVANCE
setColor = TRUE
elseif color == "white2" then
textColor = MESSAGE_EVENT_DEFAULT
setColor = TRUE
elseif color == "orange" then
textColor = 17
setColor = TRUE
elseif color == "green" then
textColor = MESSAGE_INFO_DESCR
setColor = TRUE
elseif color == "small" then
textColor = MESSAGE_STATUS_SMALL
setColor = TRUE
elseif color == "blue" then
textColor = MESSAGE_STATUS_CONSOLE_BLUE
setColor = TRUE
elseif color == "red2" then
textColor = MESSAGE_STATUS_CONSOLE_RED
setColor = TRUE
end
end
if setColor == TRUE then
broadcastMessage(string.sub(param,string.find(param,",")+1,string.len(param)),textColor)
else
broadcastMessage(param,textColor)
end
end
end