#!/bin/sh

#find where 'citysim' is
pack_path=$(rospack find citysim)
# export all Gazebo paths
export GAZEBO_RESOURCE_PATH=$pack_path/:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=$pack_path/models:$GAZEBO_MODEL_PATH
export GAZEBO_PLUGIN_PATH=$pack_path/plugins:$GAZEBO_PLUGIN_PATH

#find where 'car_demo' is
pack_path=$(rospack find car_demo)
# export all Gazebo paths
export GAZEBO_RESOURCE_PATH=$pack_path/:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=$pack_path/models:$GAZEBO_MODEL_PATH
export GAZEBO_PLUGIN_PATH=$pack_path/plugins:$GAZEBO_PLUGIN_PATH

gzclient-9.3.0 --verbose
