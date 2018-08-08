----UNDER DEVELOPMENT----

citysim for ROS Kinetic & Gazebo 9

To launch:

Terminal 1:  
$ source catkin_ws/devel/setup.bash  
$ roslaunch citysim_tc citysim_demo.launch  

Terminal 2:  
$ source catkin_ws/devel/setup.bash  
$ roslaunch citysim_tc citysim_gzclient.launch  

Then open the desktop to view gzclient.  

To launch rviz, in Terminal 3:  
$ source catkin_ws/devel/setup.bash  
$ roslaunch citysim_tc view_rviz.launch  

To control:  
Publish to topic `/prius` to move the car.  