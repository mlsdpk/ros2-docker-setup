# ROS 2 Docker Setup

Minimal Docker setup for running ROS 2 on Apple Silicon devices with visualization and graphical interface support.

## Features
- Visualization support with Foxglove
- Remote access to the graphical interface using noVNC server (coming soon)

## Building
1. Clone this repository:
    ```sh
    $ git clone https://github.com/mlsdpk/ros2-docker-setup.git
    $ cd ros2-docker-setup
    ```

2. Update the `.env` file with your configuration:
    ```env
    RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    CYCLONEDDS_URI=/root/.ros/cyclonedds.xml
    USER_PROVIDED_DIR=/path/to/your/directory
    ```

3. Build and run the Docker container:
    ```sh
    docker-compose up -d --build
    ```
