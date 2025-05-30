# Semana 1 - Git, Docker e Ros

## Observação 

- Topico exclusivo para usuários Arch Linux

O processo foi feito utilizando o sistema, eu tive um problema quanto aos comandos do docker precisando serem executados como super usuário. Mesmo conseguindo rodar os comandos sem sudo quando o docker-desktop estava rodando o processo não funciona na hora de usar aplicações locais através do container.

## Instalação

Instale o docker no seu computador

[Confira no site como é feito de acordo com a sua distribuição Linux e realize a instalação](https://docs.docker.com/get-started/get-docker/)

## Criando uma imagem para subir o container

Dentro do diretório capacitacao_pmec

Criando a imagem

```bash
docker build -f docker/Dockerfile -t turtlebot3 .
```

Lembrando que o nome turtlebot3 poderia ser qualquer nome aqui vou usar este para referenciar esta imagem

## Rodando o script para entrar de fato no container

Para executar o script precisamos voltar um diretório acima e entrar no diretório scripts

```bash
cd scripts
```

Agora verificamos se o arquivo run_container.sh tem permissão de execução

```bash
ls -l
```

##### Saída desejada

```bash
-rwxr-xr-x
```

Se no início da linha do arquivo entrypoint.sh estiver desta forma com um x ao final indica que podemos prosseguir está tudo certo.
Caso contrário precisamos dar esta permissão ao script

```bash
chmod +x run_container.sh
```

Com isso posdemos rodar o script passando a imagem que definimos anteriormente

```bash
./run_container.sh turtlebot3
```

Feito isso vamos entrar no container já com as devidas configurações para usarmos o ROS com turtlesim

## Testando 

[Para testarmos podemos seguir o manual do ROS2](https://docs.ros.org/en/humble/Tutorials/Beginner-CLI-Tools/Recording-And-Playing-Back-Data/Recording-And-Playing-Back-Data.html)

# Semana 2 - Navegação Autônoma e RL

Durante o processo eu aprofundei os conhecimentos sobre ros2 

Aprendendo como funciona as simulações e SLAM
![Brincando um pouco com Ros2 e SLAM](/assets/ros2_slam.png)

Sobre RL [dei uma olhada na documentação recomendada](https://gymnasium.farama.org/environments/toy_text/frozen_lake/), assisti ao vídeo e busquei entender melhor ao código.

Para rodar o programa do FrozenLake é necessário instalar as bibliotecas gymnasium[all] numpy matplotlib pygame

E para rodare é simples só digitar o comando no terminal, no diretório em que o arquivo está salvo

Aqui eu estou utilizando o python3

```bash
python3 frozen_lake.py
```

Esse é o resultado do jogo rodandoi

![imagem rodando](/assets/rl.png)

# Semana 3 - Modelagem e impressão 3D

Assisti ao vídeo disponibilizado, criei uma conta com email institucional na plataforma do autodesk, baixei o Fusion no computado 

![Figura da Tela do Fusion](/assets/fusion.jpg)

Fiz as modelagens propostas seguindo o vídeo

Exemplo 1

![Figura da primeira modelagem](/assets/peca_exemplo1.png)

Exercício Proposto

Construindo a modelagem base

![Figura do modelo base](/assets/processo_construcao_1.png)

Aqui temos o modelo proposto finalizado

![Figura do exercício proposto](/assets/ex_proposto1.png)

Explorando o UltiMaker Cura

Instalando o programa

![Baixando o programa](/assets/ultimaker.png)

Também coloquei a peça que fiz de exemplo seguindo o vídeo no programa para ver como se comportava, achei interessante

![Visualização do modelo no programa](/assets/explorando_ultimaker.png)

# Semana 4 - Machine Learning e Manipuladores

Fiz o clone do repositório INF0429 fiz o checkout na branch feat/manipulator e fui seguindo o [tutorial](https://github.com/pmec-atwork/INF0429/blob/feat/manipulator/tutorials/06-Manipulation/README.md) de navegação autônoma

Controlando o braço robótico

![Braço robótico](/assets/braco_robotico.png)

Visão do braço

![Braço](/assets/braco.png)

Fazendo o mapeamento

![Mapeamento](/assets/mapa_braco.png)


Navegação autônoma

![Navegação](/assets/navegacao.png)

## Deep Learning

Eu rodei os notebooks disponibilizados pelo grupo [go.ias](https://beacons.ai/go.ias) e foi necessário fazer algumas alterações, como:

![Alteração](/assets/alteracao.png)

Eu tive que alterar o path para 

```bash
path_src = '/content/drive/My Drive/hands_on/initial_dataset/'
```

Desta forma eu consegui rodar o código seguinte

![Treino](/assets/treino.png)

Eu não consegui finalizar o processo pois tive problema de utilização de RAM ao chegar no passo abaixo ouve um aviso que tinha utilizado toda a RAM disponível

![Problema de RAM](/assets/problema.png)
