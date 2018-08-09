#!/usr/bin/env python

from __future__ import print_function

import roslib; roslib.load_manifest('citysim_tc')
import rospy

#from geometry_msgs.msg import Twist
from prius_msgs.msg import Control

import sys, select, termios, tty

msg = """
Reading from the keyboard  and Publishing to Prius Control!
---------------------------
Moving around:
   u    i    o
        k    
   m    ,    .

For Holonomic mode (strafing), hold down the shift key:
---------------------------
   U    I    O
   J    K    L
   M    <    >

t : up (+z)
b : down (-z)

anything else : stop

q/z : increase/decrease max speeds by 10%
w/x : increase/decrease only linear speed by 10%
e/c : increase/decrease only angular speed by 10%

CTRL-C to quit
"""

moveBindings = {
        'i':(1,0,0,0),
        'o':(1,0,0,-1),
        'j':(0,0,0,1),
        'l':(0,0,0,-1),
        'u':(1,0,0,1),
        ',':(-1,0,0,0),
        '.':(-1,0,0,1),
        'm':(-1,0,0,-1),
        'O':(1,-1,0,0),
        'I':(1,0,0,0),
        'J':(0,1,0,0),
        'L':(0,-1,0,0),
        'U':(1,1,0,0),
        '<':(-1,0,0,0),
        '>':(-1,-1,0,0),
        'M':(-1,1,0,0),
        't':(0,0,1,0),
        'b':(0,0,-1,0),
           }

speedBindings={
        'q':(1.1,1.1),
        'z':(.9,.9),
        'w':(1.1,1),
        'x':(.9,1),
        'e':(1,1.1),
        'c':(1,.9),
          }

def getKey():
    tty.setraw(sys.stdin.fileno())
    select.select([sys.stdin], [], [], 0)
    key = sys.stdin.read(1)
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


def vels(speed,turn):
    return "currently:\tspeed %s\tturn %s " % (speed,turn)

if __name__=="__main__":
    settings = termios.tcgetattr(sys.stdin)
    
    pub = rospy.Publisher('prius', Control, queue_size = 1)
    rospy.init_node('teleop_twist_keyboard')

    speed = rospy.get_param("~speed", 0.5)
    turn = rospy.get_param("~turn", 1.0)
    x = 0
    y = 0
    z = 0
    th = 0
    status = 0
    command = Control()
    try:
        print(msg)
        print(vels(speed,turn))
        while(1):
            #command = Control()
            key = getKey()
            # if key == 'i': throttle +, steering 0, gear FORWARD, braking 0
            if key == 'i':
                command.throttle = speed 
                command.steer = 0.0 
                command.shift_gears = Control.FORWARD
                command.brake = 0.0
            # if key == 'u': throttle +, steering +, gear FORWARD, braking 0
            elif key == 'u':
                command.throttle = speed 
                command.steer = turn 
                command.shift_gears = Control.FORWARD
                command.brake = 0.0
            # if key == 'o': throttle +, steering -, gear FORWARD, braking 0
            elif key == 'o':
                command.throttle = speed 
                command.steer = -turn 
                command.shift_gears = Control.FORWARD
                command.brake = 0.0
            # if key == 'k': throttle 0, steering 0, gear NEUTRAL, braking +
            elif key == 'k':
                command.throttle = 0.0
                command.steer = 0.0
                command.shift_gears = Control.NEUTRAL
                command.brake = 5.0
            # if key == ',': throttle +, steering 0, gear REVERSE, braking 0
            elif key == ',':
                command.throttle = speed 
                command.steer = 0.0 
                command.shift_gears = Control.REVERSE
                command.brake = 0.0
            # if key == 'm': throttle +, steering +, gear REVERSE, braking 0
            elif key == 'm':
                command.throttle = speed 
                command.steer = turn 
                command.shift_gears = Control.REVERSE
                command.brake = 0.0
            # if key == '.': throttle +, steering -, gear REVERSE, braking 0
            elif key == '.':
                command.throttle = speed 
                command.steer = -turn 
                command.shift_gears = Control.REVERSE
                command.brake = 0.0
            # if key == 'q'/'z'/'w'/'x'/'e'/'c'
            elif key in speedBindings.keys():
                speed = speed * speedBindings[key][0]
                turn = turn * speedBindings[key][1]

                print(vels(speed,turn))
                if (status == 14):
                    print(msg)
                status = (status + 1) % 15
            # else: : throttle 0, steering 0, gear NEUTRAL, braking 0
            else:
                command.throttle = 0.0 
                command.steer = 0.0 
                command.shift_gears = Control.NO_COMMAND
                command.brake = 0.0
                if (key == '\x03'):
                    break

            pub.publish(command)


    except Exception as e:
        print(e)

    finally:
        command.throttle = 0.0 
        command.steer = 0.0 
        command.shift_gears = Control.NO_COMMAND
        command.brake = 0.0
        pub.publish(command)

        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
