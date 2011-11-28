#!/usr/bin/env python
import roslib; roslib.load_manifest('FredChest')
import rospy
import pygame.display
from std_msgs.msg import String
pygame.display.init()
#screen resolution (0,0) is screen res, flags: pygame.FULLSCREEN for fullscreen, depth.
screen = pygame.display.set_mode((0,0),0,0)

def callback(msg):
    rospy.loginfo(rospy.get_name()+"I heard %s",msg.data)
    screen.fill((int(msg.data[0:2]),int(msg.data[3:5]),int(msg.data[6:8])))
    pygame.display.update()

def screen():
    rospy.init_node('screen', anonymous=True)
    rospy.Subscriber("mood",, callback)
    rospy.spin()

if __name__ == '__main__':
    screen()
	
