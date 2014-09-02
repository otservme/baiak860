  function onThink(interval, lastExecution)
voices = {
"Hrrrrrrr...",
"The tree is burning with wild fire!",
"Szzzzzzzzzzzzz...",
"Krcz, krcz, krczcz...!",
"Help me!",
"This tree was 'burned alive!'",
}
pos = {x=118,y=105,z=7,stackpos=3}
ids = {
5067,
5066,
5065
}
animacje = {
6,
15,
5
}
doRemoveItem(getThingfromPos(pos).uid, 1)
doCreateItem(ids[math.random(1,3)],1,pos)
doSendMagicEffect(pos, animacje[math.random(1,3)])
doCreatureSay(getCreatureByName("bat"), voices[math.random(1,6)], TALKTYPE_ORANGE_1, pos)
return TRUE
end 