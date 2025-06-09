# Use the official ROS image as the base image
ARG ROS_DISTRO=jazzy
FROM ros:${ROS_DISTRO}

# Set shell for running commands
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install --no-install-recommends -y \
  build-essential \
  git \
  iputils-ping \
  net-tools \
  python3-colcon-common-extensions \
  python3-colcon-mixin \
  python3-colcon-argcomplete \
  python3-rosdep \
  python3-vcstool  \
  # install common ros stuffs
  ros-$ROS_DISTRO-foxglove-bridge \
  ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
  ros-$ROS_DISTRO-rosbag2-storage-mcap \
  ros-$ROS_DISTRO-demo-nodes-cpp && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# setup colcon argcomplete
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

# setup entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN echo "source entrypoint.sh" >> ~/.bashrc
CMD ["/bin/bash"]
