#!/bin/bash

# Verificar se um argumento foi passado
if [ -z "$1" ]; then
    echo "Uso: ./entrypoint.sh <nome_da_imagem>"
    exit 1
fi

# Nome da imagem do Docker a partir do argumento
IMAGE_NAME=$1

# Armazenar o diretório raiz do projeto
#ROOT_DIR=$(pwd)

# Permitir conexão com o servidor X
xhost +local:docker

# Criar o arquivo .docker.xauth e adicionar as permissões necessárias
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -


# Rodar o container com as configurações necessárias
docker run \
  --rm \
  --name stf \
  --privileged \
  --user=root \
  --network=host \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
  --env="XAUTHORITY=$XAUTH" \
  --volume="$XAUTH:$XAUTH" \
  -it $IMAGE_NAME /bin/bash
