function executeClean()
	doCleanMap()
	doBroadcastMessage("CLEAN")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("CLEAN")
	addEvent(executeClean, 50000)
	return true
end
