function onStepIn(cid, item, pos)

-- Start tree removal set
StartTreePos = {x=159, y=106, z=7, stackpos=1} --- Coodenada da árvore que bloqueia a entrada pra o Demon Oak, é obrigatoriamente que seja igual à coordenada do arquivo dotile.lua.
StartTreeChk = getThingfromPos(StartTreePos)
-- end of check

if isPlayer(cid) == TRUE then
doRemoveItem(StartTreeChk.uid)	
end
return TRUE
end