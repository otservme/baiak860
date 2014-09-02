function onThink(interval, lastExecution)
	saveserver()
	doBroadcastMessage("Server salvo.")
	return TRUE
end

function onThink(interval, lastExecution)
	doBroadcastMessage("O server será salvo em 10 segundos e pode haver um pequeno travamento.")
	addEvent(executeSave, 10000)
	return TRUE
end