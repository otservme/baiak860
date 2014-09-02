function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Voce Nao tem vip.",
msgWelcome = "Seja Bem Vindo a Area vip."
}

if getPlayerStorageValue(cid, 13540) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
return TRUE
end