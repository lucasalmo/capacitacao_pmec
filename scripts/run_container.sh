#!/bin/bash

# Verificar se um argumento foi passado
if [ -z "$1" ]; then
    echo "Uso: ./scripts/run_container.sh <nome_da_imagem>"
    exit 1
fi

# Nome da imagem do Docker a partir do argumento
IMAGE_NAME=$1

# Armazenar o diretório raiz do projeto
ROOT_DIR=$(pwd)

# Permitir conexão com o servidor X
xhost +local:docker

# Criar o arquivo .docker.xauth e adicionar as permissões necessárias
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod a+r /tmp/.docker.xauth

# Definir o diretório de trabalho do container
HOST_WORK_PATH="$ROOT_DIR/ros_packages"
CONTAINER_WORK_PATH="/root/ros2_ws/src"

# Definir o diretório de dados compartilhado entre o host e o container
HOST_DATA_PATH="$ROOT_DIR/shared_folder"
CONTAINER_DATA_PATH="/root/shared_folder"

# Rodar o container com as configurações necessárias
docker run -it \
  --rm \
  --name turtlebot3_container \
  --privileged \
  --user=root \
  --network=host \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --env="XAUTHORITY=$XAUTH" \
  --volume="$XAUTH:$XAUTH" \
  --volume="$HOST_WORK_PATH:$CONTAINER_WORK_PATH:rw" \
  --volume="$HOST_DATA_PATH:$CONTAINER_DATA_PATH:rw" \
  --volume="$(pwd)/ros_packages:/root/turtlebot3_ws/src" \
  $IMAGE_NAME
