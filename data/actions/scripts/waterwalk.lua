function onUse(cid, item, frompos, item2, topos)

---------------Edit--------------
water = 4608
walkablewater = 4820
---Dont Edit from here onwards---

player = getPlayerPosition(cid)
floor = {x=player.x, y=player.y, z=player.z}
getplayer = getThingfromPos(player)
getfloor = getThingfromPos(floor)

-------------------Water----------------
---------------------North------------------
watern = {x=player.x, y=player.y-2, z=player.z}
getwatern = getThingfromPos(watern)
waterne = {x=player.x+1, y=player.y-1, z=player.z}
getwaterne = getThingfromPos(waterne)
waternw = {x=player.x-1, y=player.y-1, z=player.z}
getwaternw = getThingfromPos(waternw)
---------------------South--------------------
waters = {x=player.x, y=player.y+2, z=player.z}
getwaters = getThingfromPos(waters)
waterse = {x=player.x+1, y=player.y+1, z=player.z}
getwaterse = getThingfromPos(waterse)
watersw = {x=player.x-1, y=player.y+1, z=player.z}
getwatersw = getThingfromPos(watersw)
---------------------East---------------------
watere = {x=player.x+2, y=player.y, z=player.z}
getwatere = getThingfromPos(watere)
wateren = {x=player.x+1, y=player.y-1, z=player.z}
getwateren = getThingfromPos(wateren)
wateres = {x=player.x+1, y=player.y+1, z=player.z}
getwateres = getThingfromPos(wateres)
----------------------West---------------------
waterw = {x=player.x-2, y=player.y, z=player.z}
getwaterw = getThingfromPos(waterw)
waterwn = {x=player.x-1, y=player.y-1, z=player.z}
getwaterse = getThingfromPos(waterwn)
waterws = {x=player.x-1, y=player.y+1, z=player.z}
getwaterws = getThingfromPos(waterws)

--------------Mate--------------
------------ Walking North---------------
maten = {x=player.x, y=player.y+1, z=player.z, stackpos=253}
getmaten = getThingfromPos(maten)
matenw = {x=player.x-1, y=player.y+1, z=player.z, stackpos=253}
getmatenw = getThingfromPos(matenw)
matene = {x=player.x, y=player.y+1, z=player.z, stackpos=253}
getmatene = getThingfromPos(matene)

------------ Walking South---------------
mates = {x=player.x, y=player.y-1, z=player.z, stackpos=253}
getmates = getThingfromPos(mates)
matesw = {x=player.x-1, y=player.y-1, z=player.z, stackpos=253}
getmatesw = getThingfromPos(matesw)
matese = {x=player.x, y=player.y-1, z=player.z, stackpos=253}
getmatese = getThingfromPos(matese)

------------ Walking West---------------
matew = {x=player.x+1, y=player.y, z=player.z, stackpos=253}
getmatew = getThingfromPos(matew)
matewn = {x=player.x+1, y=player.y-1, z=player.z, stackpos=253}
getmatewn = getThingfromPos(matewn)
matews = {x=player.x+1, y=player.y+1, z=player.z, stackpos=253}
getmatews = getThingfromPos(matews)

------------ Walking East---------------
matee = {x=player.x-1, y=player.y, z=player.z, stackpos=253}
getmatee = getThingfromPos(matee)
mateen = {x=player.x-1, y=player.y-1, z=player.z, stackpos=253}
getmateen = getThingfromPos(mateen)
matees = {x=player.x-1, y=player.y+1, z=player.z, stackpos=253}
getmatees = getThingfromPos(matees)

if doPlayerRemoveItem(cid,6132,1) == 1 then
	doPlayerAddItem(cid,6132,1)		
	if player.y > topos.y then	
		if getwatern.itemid == water then			
			doTransformItem(getwatern.uid,walkablewater)
		elseif getwaterne.itemid == water then			
			doTransformItem(getwaterne.uid,walkablewater)
		elseif getwaternw.itemid == water then			
			doTransformItem(getwaternw.uid,walkablewater)
		end
		if getmaten.itemid > 0 and getmatene.itemid > 0 and getmatenw.itemid > 0 then
		else			
			if item.itemid ~= walkablewater then
				if getfloor.itemid == walkablewater then			
					doTransformItem(getfloor.uid,water)
				end
			end
		end
	end
	if player.y < topos.y then	
		if getwaters.itemid == water then			
			doTransformItem(getwaters.uid,walkablewater)
		elseif getwaterse.itemid == water then			
			doTransformItem(getwaterse.uid,walkablewater)
		elseif getwatersw.itemid == water then			
			doTransformItem(getwatersw.uid,walkablewater)
		end
		if getmates.itemid > 0 and getmatese.itemid > 0 and getmatesw.itemid > 0 then
		else
			if item.itemid ~= walkablewater then			
				if getfloor.itemid == walkablewater then			
					doTransformItem(getfloor.uid,water)
				end
			end
		end
	end	
	if player.x > topos.x then		
		if getwaterw.itemid == water then			
			doTransformItem(getwaterw.uid,walkablewater)	
		elseif getwaterwn.itemid == water then			
			doTransformItem(getwaterwn.uid,walkablewater)
		elseif getwaterws.itemid == water then			
			doTransformItem(getwaterws.uid,walkablewater)		
		end
		if getmatew.itemid > 0 and getmatewn.itemid > 0 and getmatews.itemid > 0 then
		else			
			if item.actionid ~= walkablewater then			
				if getfloor.itemid == walkablewater then			
					doTransformItem(getfloor.uid,water)
				end
			end
		end
	end
	if player.x < topos.x then
		if getwatere.itemid == water then			
			doTransformItem(getwatere.uid,walkablewater)
		elseif getwateren.itemid == water then			
			doTransformItem(getwateren.uid,walkablewater)
		elseif getwateres.itemid == water then			
			doTransformItem(getwateres.uid,walkablewater)			
		end
		if getmatee.itemid > 0 and getmateen.itemid > 0 and getmatees.itemid > 0 then
		else			
			if item.itemid ~= walkablewater then			
				if getfloor.itemid == walkablewater then			
					doTransformItem(getfloor.uid,water)
				end
			end
		end
	end
else
	doPlayerSendTextMessage(cid,22,"You need boots of waterwalking to walk on water.")	
end

end