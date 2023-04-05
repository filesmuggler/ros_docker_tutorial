# ros_docker_tutorial
Simple docker solution for starting with ROS 1 


## Install
Install docker engine and docker compose plugin from [this site](https://docs.docker.com/engine/install/)

## Settings for Mac users

Install [XQuartz](https://www.xquartz.org/), restart computer and make sure it's on.

Set network forwarding to xquartz.

## Use

Open 5 terminal shells and type in each 
```zsh
xhost +${hostname}
```
It will allow the connection of GUI from docker container to display windows in native environment.

## Terminal 1 (DOCKER CONTAINER)
Build and run the docker container

Clone the repo:
```zsh
git clone https://github.com/filesmuggler/ros_docker_tutorial
```
Enter the directory:
```zsh
cd ros_docker_tutorial
```
Build and run docker container
```zsh
docker compose up --build
```
It will run Dockerfile building as specified in docker-compose.yml and run autmatically.
As a result you should see `Attached to running container...`


## Terminal 2 (ROSCORE)
Make sure `xhost +${hostname}` is executed before proceeding.
Enter the docker container by:
```zsh
docker exec -it ros_docker_tutorial-user-ros-1 bash
```
Source needed env variables:
```bash
source export.sh
```

Run:
```bash
roscore
```
It will run the core software for ROS.


## Terminal 3 (BEGINNER NODE)
Make sure `xhost +${hostname}` is executed before proceeding.
Enter the docker container by:
```zsh
docker exec -it ros_docker_tutorial-user-ros-1 bash
```
Source needed env variables:
```bash
source export.sh
```
Run:
```bash
mkdir -p ~catkin_ws/src
cd ~catkin_ws/src/
git clone https://github.com/filesmuggler/ros_docker_tutorial.git
cd ..
source /opt/ros/noetic/setup.bash
catkin_make
source ~/catkin_ws/devel/setup.bash
rosrun beginner_tutorials talker.py
```
It will run the node with talking on the screen.



## Terminal 5 (ROSTOPIC TOOLS)
Make sure `xhost +${hostname}` is executed before proceeding.
Enter the docker container by:
```zsh
docker exec -it ros_docker_tutorial-user-ros-1 bash
```
Source needed env variables:
```bash
source export.sh
```
Run:
```bash
rostopic list
```
It will print available topics. 



---
OUTDATED - check new topics


You can see `/turtle1/pose` which is responsible for holding info about position of the turtle on the screen.
Try:
```bash
rostopic echo /turtle1/pose
```
and move it with arrows in terminal no 4. See it changing? Cool, now try other topics and see how they change the values.

You can also see the type of message of the topics by executing the `info` command:
```bash
rostopic info /turtle1/pose
```
and you will see the info about subscribers and publishers, and the type of the _message_ like in this case it is [Pose Message](http://docs.ros.org/en/noetic/api/geometry_msgs/html/msg/Pose.html)


## Final
Congrats! YOu mastered quick tutorial on ROS on MAC in DOCKER :) 

## Ref

- [Install XQuartz](https://www.xquartz.org/)
- [turtlesim](http://wiki.ros.org/turtlesim)
- [turtlesim tutorial](https://automaticaddison.com/launch-turtlesim-robot-simulation-in-ros/)
- [Pose Message](http://docs.ros.org/en/noetic/api/geometry_msgs/html/msg/Pose.html)
- [ROS](http://wiki.ros.org/noetic)
