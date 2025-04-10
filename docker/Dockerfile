FROM osrf/ros:humble-desktop-full

# Example of installing programs
RUN apt-get update && apt-get install -y \
  vim \
  qt5dxcb-plugin \ #pacote para rodar interface gráfica no host pelo container
  git \
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

# Create a non-root user
ARG USERNAME=lucas
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config


# Set up sudo
RUN apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint and bashrc scripts so we have 
# our container's environment set up correctly
COPY entrypoint.sh /entrypoint.sh
COPY bashrc .bashrc


# Set up entrypoint and default command
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["bash"]
