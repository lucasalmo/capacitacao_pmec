## Observação 

- Topico exclusivo para usuários Arch Linux

O processo foi feito utilizando o sistema, eu tive um problema quanto aos comandos do docker precisando serem executados como super usuário. Mesmo conseguindo rodar os comandos sem sudo quando o docker-desktop estava rodando o processo não funciona na hora de usar aplicações locais através do container.

## Instalação

Instale o docker no seu computador

[Confira no site como é feito de acordo com a sua distribuição Linux e realize a instalação](https://docs.docker.com/get-started/get-docker/)

## Criando uma imagem para subir o container

Dentro do diretório capacitacao_pmec

Entre no diretório docker

```bash
cd docker
```

Criando a imagem

```bash
docker build -f docker/Dockerfile -t turtlebot3 .
```

Lembrando que o nome turtlebot3 poderia ser qualquer nome aqui vou usar este para referenciar esta imagem

## Rodando o script para entrar de fato no container

Para executar o script precisamos voltar um diretório acima e entrar no diretório scripts

```bash
cd ../scripts
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
./entrypoint.sh turtlebot3
```

Feito isso vamos entrar no container já com as devidas configurações para usarmos o ROS com turtlesim

## Testando 

[Para testarmos podemos seguir o manual do ROS2](https://docs.ros.org/en/humble/Tutorials/Beginner-CLI-Tools/Recording-And-Playing-Back-Data/Recording-And-Playing-Back-Data.html)
