 function onThink(interval, lastExecution)
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={[[Pagar Super-vip e extremamente seguro.
Porem jamais esqueca de confirmar no Email: dustvip@gmail.com!
Para ser Super-vip e comprar o Super-set vip so por deposito bancario! R$ 3,00 reais = 10 dias!
]] , "Conheça as Promoções vips e os itens exclusivos do Dust Ot ..  use !sejavip" , [[Banco: Brasil
Agencia : 0313-1
conta corrente : 45210-6
Pode ser feito em lotericas, bancos ou caixas eletronicos.
Apos o deposito basta confirmar os dados do comprovante pelo o email.]]}
  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end