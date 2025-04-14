FROM osrf/ros:humble-desktop-full

# Instala dependências
RUN apt update && apt install -y \
  vim \
  git \
  qt5dxcb-plugin \
  python3-colcon-common-extensions \
  ros-humble-gazebo-ros-pkgs \
  ros-humble-cartographer \
  ros-humble-cartographer-ros \
  ros-humble-navigation2 \
  ros-humble-nav2-bringup \
  ros-humble-dynamixel-sdk \
  ros-humble-hls-lfcd-lds-driver \
  ros-humble-moveit-ros-move-group \
  ros-humble-moveit-kinematics \
  ros-humble-moveit-planners \
  ros-humble-moveit-simple-controller-manager \
  ros-humble-joint-state-publisher \
  ros-humble-joint-state-publisher-gui \
  ros-humble-moveit-ros-visualization \
  ros-humble-moveit-ros-warehouse \
  ros-humble-warehouse-ros* \
  ros-humble-srdfdom \
  ros-humble-ros2-control \
  ros-humble-ros2-controllers \
  ros-humble-gripper-controllers \
  ros-humble-tf-transformations \
  ros-humble-hardware-interface \
  ros-humble-control-msgs \
  && rm -rf /var/lib/apt/lists/*

# Ambiente
ENV TURTLEBOT3_MODEL=waffle

RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc && \
  echo "source /root/turtlebot3_ws/install/setup.bash" >> /root/.bashrc && \
  echo "source /usr/share/gazebo/setup.bash" >> /root/.bashrc
