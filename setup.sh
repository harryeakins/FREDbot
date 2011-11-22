#!/bin/sh
export ROS_ROOT=/opt/ros/electric/ros 
export PATH=$ROS_ROOT/bin:$PATH 
export PYTHONPATH=$ROS_ROOT/core/roslib/src:$PYTHONPATH 
export ROS_PACKAGE_PATH=~/ros_workspace:/opt/ros/electric/stacks:$ROS_PACKAGE_PATH
export ROS_MASTER_URI=http://localhost:11311

