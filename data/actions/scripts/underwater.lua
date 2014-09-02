--Sistema de Underwater Automatico--
--Este sistema hace que un jugador pueda entrar en el agua namas que usando bordes de playa o bordes de rio--


   function onUse(cid, item, frompos, item2, topos)
    npos = {x=frompos.x, y=frompos.y, z=frompos.z}

--lados izq, der, arr, abj de los bordes de playa y rio--   

if item.itemid == 4634 or item.itemid == 4646 then
     npos.y = npos.y + 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4632 or item.itemid == 4644 then
     npos.y = npos.y - 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4635 or item.itemid == 4645 then
     npos.x = npos.x + 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4647 or item.itemid == 4633 then
     npos.x = npos.x - 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)

--esquinas convexas--

    elseif item.itemid == 4655 or item.itemid == 4640 then
     npos.x = npos.x + 1
     npos.y = npos.y + 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4654 or item.itemid == 4641 then
     npos.x = npos.x - 1
     npos.y = npos.y + 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4652 or item.itemid == 4643 then
     npos.x = npos.x - 1
     npos.y = npos.y - 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4653 or item.itemid == 4642 then
     npos.x = npos.x + 1
     npos.y = npos.y - 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)

--esquinas concavas--

    elseif item.itemid == 4636 or item.itemid == 4651 then
     npos.x = npos.x + 1
     npos.y = npos.y + 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4650 or item.itemid == 4637 then
     npos.x = npos.x - 1
     npos.y = npos.y + 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4648 or item.itemid == 4639 then
     npos.x = npos.x - 1
     npos.y = npos.y - 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)
    elseif item.itemid == 4649 or item.itemid == 4638 then
     npos.x = npos.x + 1
     npos.y = npos.y - 1
     npos.z = npos.z + 1
     doTeleportThing(cid,npos)

--en excepcion, si es otro item no especificado lo que sucederia. En este caso solo bajaria el piso sin mover hacia ningun lado--

    else
     npos.z = npos.z - 1
     doTeleportThing(cid,npos)
    end

    return 1
   end