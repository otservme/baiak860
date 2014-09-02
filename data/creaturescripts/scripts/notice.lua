--- Script by esK~---
--- Notice System 0.1 Beta ---
function onLogin(cid, words, param)
file = io.open('noticias.txt','r')
notice = file:read(-1)
doShowTextDialog(cid,7528,notice)
file:close()
end