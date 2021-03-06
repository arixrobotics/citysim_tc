#!/bin/sh

#find where the 'citysim' is
pack_path=$(rospack find citysim)

# export all Gazebo paths
export GAZEBO_RESOURCE_PATH=$pack_path/:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=$pack_path/models:$GAZEBO_MODEL_PATH
export GAZEBO_PLUGIN_PATH=$pack_path/plugins:$GAZEBO_PLUGIN_PATH

#roslaunch citysim_tc main_simple.launch 
roslaunch citysim_tc main_no_trees.launch 
