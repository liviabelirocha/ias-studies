# Fazendo deploy de uma máquina

Uma vez na pasta com o arquivo `main.tf`, devemos executar `$ terraform init`, para o terraform poder obter os plugins de comunicação com o provider. Só é necessário executar esse comando se alterarmos algo no bloco terraform {}, já que o comando vai atualizar verificar e atualizar as configurações e plugins.

Após a mensagem de sucesso, podemos verificar as mudanças que serão feitas utilizando o comando `$ terraform plan`, que retornará uma lista com as configurações da instância e um resumo, onde podemos ver a quantidade de máquinas a serem criadas, modificadas ou destruídas.

Assim que confirmamos que todas as alterações serão como planejamos, nesse caso, será uma máquina t2.micro, com a ami correta e na região escolhida, podemos usar o `$ terraform apply`, que irá trazer mais uma vez todo o planejamento e perguntará se está tudo de acordo com o que queremos, se estiver tudo certo, digitamos “yes” e o terraform irá pressionar toda a máquina.

# Configurando grupo de segurança

Vamos começar indo para o painel da EC2 para acessar as configurações do grupo de segurança. Nós podemos acessar essas configurações através da seção “Recursos” e em seguida “Grupos de segurança”, ou através do menu lateral na seção “Rede e segurança” e em seguida “Security groups".

Vamos selecionar o único item da lista. Ele tem um campo chamado “Nome do grupo de segurança” e esse campo deve ter o valor “default”. Na parte inferior da tela aparecerá uma aba com as configurações do grupo de segurança, nesta aba temos informações de “Regras de entrada” e “Regras de saída”, que são as configurações de conexão das máquinas que estão nesse grupo.

Vamos em “Regras de entrada” e em seguida em “Edit inbound rules” (Editar regras de entrada). Na nova janela, podemos criar novas regras clicando em "Adicionar regra”. Lembrando que cada regra só contempla 1 endereço, então não podemos colocar todos em uma única regra. Assim que criarmos uma nova regra temos que selecionar o “Tipo”, que no nosso caso é “Todo o tráfego” e a “Origem” que é “anywhere-IPv4”, vamos fazer o mesmo processo de criar uma nova regra para o “anywhere-IPv6”.

Agora podemos seguir o mesmo caminho para as “Regras de saída”. As diferenças são que ao invés de “Edit inbound rules” será “Edit outbound rules” e no lugar de “Origem” teremos “Destino”.