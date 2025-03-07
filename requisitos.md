```
Uma empresa de jogos deseja criar um Banco de Dados para a organização interna de suas atividades de desenvolvimento para uma melhor produção.
A empresa é organizada em setores. Cada setor possui um nome, número e um tema.
Além disto, um setor cria vários projetos, cada um dos quais com um nome, um número de identificação e o objetivo para o qual deve ser desenvolvido.
Vários projetos podem idealizar vários jogos, cada um dos quais precisam de um nome, diretor responsável, requisitos e o tempo de desenvolvimento.
Na mesma empresa, cada projeto somente pode ser desenvolvido por um setor específico.
Existem quatro tipos de funcionários que trabalham na empresa: programador, animador, roteirista e editor.
Para os programadores, é necessário armazenar o nome, o endereço, o sexo, a data de aniversário, o salário, área de atuação.
Para os animadores, deseja-se armazenar: o nome, o endereço, o sexo, a data de aniversário, o salário, estilo de arte e modelo artístico.
Para os roteiristas, deseja-se armazenar: o nome, o endereço, o sexo, a data de aniversário, o salário, a comunicação, nível de língua estrangeira e Produção Textual.
Por último para os editores, deseja-se armazenar: o nome, o endereço, o sexo, a data de aniversário, o salário, produção audiovisual e nível de liderança.
```
```
Os cargos dos editores são hierárquicos.
Assim, deseja-se armazenar também, para cada editor, informações sobre o editor que o gerencia.
Os funcionários da desenvolvedora são identificados por meio de um ID, e podem estar associados a vários setores.
Funcionários que são programadores podem programar diversos jogos e tarefas, independentemente desses projetos estarem sendo desenvolvidos no mesmo setor no qual o empregado está associado.
Deve-se armazenar o número de horas semanais trabalhadas por cada programador em cada jogo que ele está trabalhando no momento, e também a sua progressão, para ter controle de erros e porcentagem do jogo concluído e ter tudo dentro dos prazos.
Para os funcionários que são animadores precisa ser feito uma análise de suas progressões e modelos criados em sua arte, já que um animador pode modelar vários Sprites, deve ser armazenado o tempo necessário de cada modelagem, além de que vários sprites podem ser utilizados em diversos jogos.
Deve-se armazenar também informações sobre os dependentes de cada funcionário para propósitos de contribuição a família e acesso antecipado para futuros lançamentos.
Deve-se armazenar o nome, o sexo e a data de aniversário, além do grau de parentesco com o funcionário, idade e plataforma disponível.
```
