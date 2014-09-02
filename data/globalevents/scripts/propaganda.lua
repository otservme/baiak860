function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens = {"O SITE SÓ OTSERV FAZ 1 ANO! Confira Scripts, Mapas, Otservers, Tutoriais em WWW.SOTSERV.BLOGSPOT.COM !", ""} -- Defina as mensagens de propaganda
  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end