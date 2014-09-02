local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

stime = 300 -- em segundos)

time = os.clock()
function onThink()
		if (time + stime) < os.clock() then
			time = os.clock()
			var = math.random(1,5)
			if var == 1 then
				doBroadcastMessage([[ Experimente os comandos !sejavip]])
			end
			if var == 2 then
				doBroadcastMessage([[ Conheça nossas promoções!!]])
			end
			if var == 3 then
				doBroadcastMessage([[ Quanto mais amigos vc trouxer para o ot mais forte voce vai ser!!]])
			end
			if var == 4 then
				doBroadcastMessage([[ Doe, ajude o server e ganhe items incriveis!! ]])
			end
			if var == 5 then
				doBroadcastMessage([[ Obrigado por jogar no Dust OT !! ]])
			end
		end
end