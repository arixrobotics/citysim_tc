**citysim for ROS Kinetic & Gazebo 9**

To launch:

Terminal 1:  
$ roslaunch citysim_tc citysim_demo.launch  

Or for a (bit) lighter version of the simulation,
$ roslaunch citysim_tc citysim_demo_no_trees.launch  

If using gzclient, Terminal 2:  
$ roslaunch citysim_tc view_gzclient.launch  

To launch rviz, in Terminal 3:  
$ roslaunch citysim_tc view_rviz.launch  

To control using keyboard, in Terminal 4:
$ rosrun citysim_tc prius_teleop_keyboard.py

To change traffic lights, in Terminal 5:
$ rostopic pub -1 /gazebo/keypress 'data:"q"'
Change the value of data depending on which trafficlights:
Intersection 1: q/a
Intersection 1: w/s
Intersection 1: e/d
Intersection 1: r/f

