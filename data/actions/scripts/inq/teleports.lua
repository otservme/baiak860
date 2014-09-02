function onUse(cid, item, fromPosition, itemEx, toPosition)





-- tablica z pozycjami lawy 


local Lawa = {


{x=921,y=1259,z=15}, 

{x=921,y=1258,z=15}, 

{x=921,y=1257,z=15}, 

{x=921,y=1256,z=15},

{x=921,y=1255,z=15},

{x=921,y=1254,z=15},

{x=920,y=1254,z=15},

{x=920,y=1255,z=15},

{x=920,y=1256,z=15},

{x=920,y=1257,z=15},

{x=920,y=1258,z=15},

{x=920,y=1259,z=15},


} 






if (itemEx.uid == 12344) then -- unique kamienia

if (getGlobalStorageValue(5544) == -1) then 

local Teleport = doCreateTeleport(1387, {x=0,y=0,z=0}, {x=921,y=1256,z=15}) -- tworzenie teleportu 

doSetItemActionId(Teleport, 12345)


for i = 1, #Lawa do -- petla tworzenia lawy

 doCreateItem(5815, 1, Lawa[i]) -- funkcja tworzenia lawy 
 doSendMagicEffect(Lawa[i], CONST_ME_POFF)


end
end

else 
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It\'s not time yet.") 
end 
end 
