function onUse(cid, item, frompos, item2, pos)

wall1 = {x=pos.x-1, y=pos.y, z=pos.z, stackpos=1}
wall1s1 = {x=pos.x-1, y=pos.y, z=pos.z, stackpos=2}
getwall1 = getThingfromPos(wall1)
getwall1s1 = getThingfromPos(wall1s1)
wall2 = {x=pos.x, y=pos.y-1, z=pos.z, stackpos=1}
wall2s1 = {x=pos.x, y=pos.y-1, z=pos.z, stackpos=2}
getwall2 = getThingfromPos(wall2)
getwall2s1 = getThingfromPos(wall2s1)

player = getPlayerPosition(cid)


if item.itemid == 1857 or item.itemid == 1860 or item.itemid == 1863 or item.itemid == 1866 or item.itemid == 1869 or item.itemid == 1872 or item.itemid == 1880 or item.itemid == 5616 then  --flat tapestry
    if getwall1.itemid == 1036 or getwall1.itemid == 1040 or getwall1.itemid == 1041 or getwall1.itemid == 1042 or getwall1.itemid == 1043 or getwall1.itemid == 1044 or getwall1.itemid == 1046 or getwall1.itemid == 1049 or getwall1.itemid == 1053 or getwall1.itemid == 1054 or getwall1.itemid == 1055 or getwall1.itemid == 1056 or getwall1.itemid == 1057 or getwall1.itemid == 1059 or getwall1.itemid == 1100 or getwall1.itemid == 1104 or getwall1.itemid == 1105 or getwall1.itemid == 1106 or getwall1.itemid == 1107 or getwall1.itemid == 1108 or getwall1.itemid == 1110 or getwall1.itemid == 1111 or getwall1.itemid == 1115 or getwall1.itemid == 1116 or getwall1.itemid == 1117 or getwall1.itemid == 1119 or getwall1.itemid == 3361 or getwall1.itemid == 3365 or getwall1.itemid == 3366 or getwall1.itemid == 3367 or getwall1.itemid == 3369 or getwall1.itemid == 5261 or getwall1.itemid == 5265 or getwall1.itemid == 5266 or getwall1.itemid == 5267 or getwall1.itemid == 5268 or getwall1.itemid == 5269 or getwall1.itemid == 5271 then  --west facing
        if getwall1s1.itemid > 0 then
if getwall2.itemid == 1037 or getwall2.itemid == 1039 or getwall2.itemid == 1040 or getwall2.itemid == 1042 or getwall2.itemid == 1044 or getwall2.itemid == 1045 or getwall2.itemid == 1046 or getwall2.itemid == 1050 or getwall2.itemid == 1052 or getwall2.itemid == 1053 or getwall2.itemid == 1055 or getwall2.itemid == 1057 or getwall2.itemid == 1058 or getwall2.itemid == 1059 or getwall2.itemid == 1061 or getwall2.itemid == 1064 or getwall2.itemid == 1066 or getwall2.itemid == 1068 or getwall2.itemid == 1069 or getwall2.itemid == 1070 or getwall2.itemid == 1039 or getwall2.itemid == 1101 or getwall2.itemid == 1103 or getwall2.itemid == 1104 or getwall2.itemid == 1106 or getwall2.itemid == 1108 or getwall2.itemid == 1109 or getwall2.itemid == 1110 or getwall2.itemid == 1112 or getwall2.itemid == 1114 or getwall2.itemid == 1115 or getwall2.itemid == 1117 or getwall2.itemid == 1118 or getwall2.itemid == 1119 or getwall2.itemid == 3362 or getwall2.itemid == 3364 or getwall2.itemid == 3365 or getwall2.itemid == 3367 or getwall2.itemid == 3368 or getwall2.itemid == 3369 or getwall2.itemid == 5262 or getwall2.itemid == 5264 or getwall2.itemid == 5265 or getwall2.itemid == 5267 or getwall2.itemid == 5269 or getwall2.itemid == 5270 or getwall2.itemid == 5271 then   --south facing
                if getwall2s1.itemid > 0 then
                else
                    doRemoveItem(item.uid,1)
                    doCreateItem(item.itemid-2,1,wall2)
                end
            end
        else
            doRemoveItem(item.uid,1)
            doCreateItem(item.itemid-1,1,wall1)
        end
    elseif getwall2.itemid == 1037 or getwall2.itemid == 1039 or getwall2.itemid == 1040 or getwall2.itemid == 1042 or getwall2.itemid == 1044 or getwall2.itemid == 1045 or getwall2.itemid == 1046 or getwall2.itemid == 1050 or getwall2.itemid == 1052 or getwall2.itemid == 1053 or getwall2.itemid == 1055 or getwall2.itemid == 1057 or getwall2.itemid == 1058 or getwall2.itemid == 1059 or getwall2.itemid == 1061 or getwall2.itemid == 1064 or getwall2.itemid == 1066 or getwall2.itemid == 1068 or getwall2.itemid == 1069 or getwall2.itemid == 1070 or getwall2.itemid == 1039 or getwall2.itemid == 1101 or getwall2.itemid == 1103 or getwall2.itemid == 1104 or getwall2.itemid == 1106 or getwall2.itemid == 1108 or getwall2.itemid == 1109 or getwall2.itemid == 1110 or getwall2.itemid == 1112 or getwall2.itemid == 1114 or getwall2.itemid == 1115 or getwall2.itemid == 1117 or getwall2.itemid == 1118 or getwall2.itemid == 1119 or getwall2.itemid == 3362 or getwall2.itemid == 3364 or getwall2.itemid == 3365 or getwall2.itemid == 3367 or getwall2.itemid == 3368 or getwall2.itemid == 3369 or getwall2.itemid == 5262 or getwall2.itemid == 5264 or getwall2.itemid == 5265 or getwall2.itemid == 5267 or getwall2.itemid == 5269 or getwall2.itemid == 5270 or getwall2.itemid == 5271 then  --south facing
        if getwall2s1.itemid > 0 then
        else
            doRemoveItem(item.uid,1)
            doCreateItem(item.itemid-2,1,wall2)
        end
    end
    
elseif item.itemid == 1856 or item.itemid == 1859 or item.itemid == 1862 or item.itemid == 1865 or item.itemid == 1868 or item.itemid == 1871 or item.itemid == 1879 or item.itemid == 5615 then    --west facing
    if (player.x == pos.x+1) then
        doPlayerAddItem(cid, item.itemid+1, 1)
        doRemoveItem(item.uid,1)    
    end        
elseif item.itemid == 1855 or item.itemid == 1858 or item.itemid == 1861 or item.itemid == 1864 or item.itemid == 1867 or item.itemid == 1870 or item.itemid == 1878 or item.itemid == 5614 then  --south facing
    if (player.y == pos.y+1) then    
        doRemoveItem(item.uid,1)
        doPlayerAddItem(cid, item.itemid+2, 1)    
    end    
end
end