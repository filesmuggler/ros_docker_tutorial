#!/bin/bash
export ROS_IP=$(hostname -I |  awk '{print $NF}')
export ROS_HOSTNAME=$(hostname -I |  awk '{print $NF}')
export ROS_MASTER_URI=http://$(hostname -I |  awk '{print $NF}'):11311
printenv | grep ROS