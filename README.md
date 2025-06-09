# ROS 2 Docker Setup

Minimal Docker setup for running ROS 2 on Apple Silicon devices with visualization and multiple machines discovery support.

## Features

- ROS2 discovery across multiple machines
- Visualization support with Foxglove

## Building

1. Clone this repository:

   ```sh
   $ git clone https://github.com/mlsdpk/ros2-docker-setup.git
   $ cd ros2-docker-setup
   ```

2. Update the `.env` file with your configuration:
   ```env
   ROS_DISTRO=jazzy
   ROS_DOMAIN_ID=0
   RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
   HOST_IP=0.0.0.0
   UDP_PORT_RANGE=7400-7500
   USER_PROVIDED_DIR=/path/to/your/directory
   CYCLONEDDS_URI_FILE=cyclonedds.xml
   ```

   Note on multiple machines setup:
   - `HOST_IP` must be your actual local network IP address (e.g., 192.168.x.xxx) for inter-machine communication. On macOS, `network=host` mode is not supported, so here we will explicitly map ROS 2 UDP ports. The default port range (7400-7500) supports typical setups with ROS_DOMAIN_ID=0. But, if you need to use more domain IDs or participants, extend this range accordingly. See more details on this [here](https://docs.ros.org/en/jazzy/Concepts/Intermediate/About-Domain-ID.html).

3. Build the Docker container:
   ```sh
   docker compose build
   ```

## Running the container

Start the container in the background:
```sh
docker compose up -d
```

To connect to the running container:

```sh
docker exec -it <container-name> /bin/bash
```
> You can find the container name by running:
> ```sh
> docker ps
> ```