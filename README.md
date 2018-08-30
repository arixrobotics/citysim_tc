**citysim for ROS Kinetic & Gazebo 9**

To launch:

Terminal 1:  
$ source catkin_ws/devel/setup.bash  
$ roslaunch citysim_tc citysim_demo.launch  

If using gzclient, Terminal 2:  
$ source catkin_ws/devel/setup.bash  
$ roslaunch citysim_tc citysim_gzclient.launch  

To launch rviz, in Terminal 3:  
$ source catkin_ws/devel/setup.bash  
$ roslaunch citysim_tc view_rviz.launch  

To control using keyboard, in Terminal 4:
$ source catkin_ws/devel/setup.bash  
$ rosrun citysim_tc prius_teleop_keyboard.py

To change traffic lights, in Terminal 5:
$ source catkin_ws/devel/setup.bash  
$ rostopic pub -1 /gazebo/keypress 'data:"q"'
Change the value of data depending on which trafficlights:
Intersection 1: q/a
Intersection 1: w/s
Intersection 1: e/d
Intersection 1: r/f
