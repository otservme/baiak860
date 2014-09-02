function onDeath(killer, monster, corpse, damage, totaldamage) 
-- Configuracao
  local fromArea = {x =168, y = 735, z = 7} -- Area que o incendio aconteceu
  local toArea =  {x = 200, y = 772, z = 7}-- Area que o incendio aconteceu
  local FFID = {1487,1488,1489} -- ID dos Fire Fields
  local FWID = {5063} -- ID dos FireWalls
-- Fim de Configuracao

addEvent(doRemoveIncendio, math.random(5,15)*1000, fromArea, toArea, FFID, FWID)
return TRUE
end 

function doRemoveIncendio(fromArea, toArea, FFID, FWID)
  local posNow = {x = 0, y = 0, z = 0, stackpos = 2}
  local itemRemover = 0

  for t = fromArea.z, toArea.z do -- Area
    for n = fromArea.y, toArea.y do
      for i = fromArea.x, toArea.x do

        for it = 1, table.maxn(FFID) do
          for st = 1, 3 do
            posNow = {x = i, y = n, z = t, stackpos = st}
	        itemRemover = getThingFromPos(posNow)
            if itemRemover.itemid == FFID[it] then
              doRemoveItem(itemRemover.uid)
            end
          end
        end
        for it = 1, table.maxn(FWID) do
          for st = 1, 3 do
            posNow = {x = i, y = n, z = t, stackpos = st}
	        itemRemover = getThingFromPos(posNow)
            if itemRemover.itemid == FWID[it] then
              doRemoveItem(itemRemover.uid)
            end
          end
        end

      end
    end
  end

return TRUE
end