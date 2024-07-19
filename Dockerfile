# Use the official ROS image as the base image
FROM ros:humble

# Set shell for running commands
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install --no-install-recommends -y \
  build-essential \
  git \
  python3-colcon-common-extensions \
  python3-colcon-mixin \
  python3-rosdep \
  python3-vcstool  \
  ros-humble-desktop \
  ros-humble-foxglove-bridge \
  ros-humble-rmw-cyclonedds-cpp \
  ros-humble-rosbag2-storage-mcap \
  && rm -rf /var/lib/apt/lists/*

# Copy the cyclonedds.xml configuration file
RUN echo '<?xml version="1.0" encoding="UTF-8" ?>\
<CycloneDDS xmlns="https://cdds.io/config" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://cdds.io/config https://raw.githubusercontent.com/eclipse-cyclonedds/cyclonedds/master/etc/cyclonedds.xsd">\
  <Domain id="any">\
      <General>\
          <NetworkInterfaceAddress>lo</NetworkInterfaceAddress>\
          <AllowMulticast>false</AllowMulticast>\
      </General>\
      <Discovery>\
          <ParticipantIndex>auto</ParticipantIndex>\
          <Peers>\
              <Peer Address="localhost"/>\
          </Peers>\
          <MaxAutoParticipantIndex>120</MaxAutoParticipantIndex>\
      </Discovery>\
  </Domain>\
</CycloneDDS>' > /root/.ros/cyclonedds.xml

# Source the ROS environment setup script and set default entrypoint
RUN echo "source ros_entrypoint.sh" >> ~/.bashrc
CMD ["/bin/bash"]
