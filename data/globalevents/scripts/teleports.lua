--- Script By RookWar ---
function onThink(interval, lastExecution)
pos = {x = 160, y = 54, z = 7} -- Coordenadas do teleport
pos1 = {x = 166, y = 50, z = 7} -- /\
pos2 = {x = 158, y = 51, z = 4} -- /\
pos3 = {x = 158, y = 47, z = 7} -- /\
doSendAnimatedText(pos, 'Baiak', 140) -- Ira mandar Texto animado na pos
doSendAnimatedText(pos1, 'Vip City', 140) -- /\, porém na pos1
doSendAnimatedText(pos2, 'Welcome', 130) -- /\, porem na pos2
doSendAnimatedText(pos3, 'Treiners', 130) -- /\, porem na pos3
