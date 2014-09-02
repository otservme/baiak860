function onSay(cid, words, param)

centerpos = getPlayerPosition(cid)

                tilepos1 = {x=centerpos.x-1, y=centerpos.y-1, z=centerpos.z, stackpos=1}
                tilepos2 = {x=centerpos.x, y=centerpos.y-1, z=centerpos.z, stackpos=1}
                tilepos3 = {x=centerpos.x+1, y=centerpos.y-1, z=centerpos.z, stackpos=1}
                tilepos4 = {x=centerpos.x-1, y=centerpos.y, z=centerpos.z, stackpos=1}
                tilepos5 = {x=centerpos.x, y=centerpos.y, z=centerpos.z, stackpos=1}
                tilepos6 = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z, stackpos=1}
                tilepos7 = {x=centerpos.x-1, y=centerpos.y+1, z=centerpos.z, stackpos=1}
                tilepos8 = {x=centerpos.x, y=centerpos.y+1, z=centerpos.z, stackpos=1}
                tilepos9 = {x=centerpos.x+1, y=centerpos.y+1, z=centerpos.z, stackpos=1}

wall1 = getThingfromPos(tilepos1)
wall2 = getThingfromPos(tilepos2)
wall3 = getThingfromPos(tilepos3)
wall4 = getThingfromPos(tilepos4)
wall5 = getThingfromPos(tilepos5)
wall6 = getThingfromPos(tilepos6)
wall7 = getThingfromPos(tilepos7)
wall8 = getThingfromPos(tilepos8)
wall9 = getThingfromPos(tilepos9)



storageplayer = getPlayerStorageValue(cid,1234)
acess = 3 --  1 pra players 3 pra gm 5 pra god 


if storageplayer == -1 or storageplayer == 0 and getPlayerAccess(cid) >= acess then


setPlayerStorageValue(cid,1234,1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "tapete Ativado.")
doSendAnimatedText(centerpos, 'Activaded', TEXTCOLOR_RED)

        doCreateItem(1794, 1, tilepos1)
        doCreateItem(1795, 1, tilepos2)
        doCreateItem(1796, 1, tilepos3)
        doCreateItem(1797, 1, tilepos4)
        doCreateItem(1798, 1, tilepos5)
        doCreateItem(1799, 1, tilepos6)
        doCreateItem(1800, 1, tilepos7)
        doCreateItem(1801, 1, tilepos8)
        doCreateItem(1802, 1, tilepos9)


elseif storageplayer == 1 and getPlayerAccess(cid) >= acess then

setPlayerStorageValue(cid,1234,0)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "tapete Desativado.")
doSendAnimatedText(centerpos, 'Deactivade', TEXTCOLOR_RED)

doRemoveItem(wall1.uid,1)
doRemoveItem(wall2.uid,1)
doRemoveItem(wall3.uid,1)
doRemoveItem(wall4.uid,1)
doRemoveItem(wall5.uid,1)
doRemoveItem(wall6.uid,1)
doRemoveItem(wall7.uid,1)
doRemoveItem(wall8.uid,1)
doRemoveItem(wall9.uid,1)

end

end