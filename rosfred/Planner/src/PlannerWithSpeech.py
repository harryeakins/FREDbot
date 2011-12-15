#!/usr/bin/env python
import roslib; roslib.load_manifest('Planner')
import rospy
import pygame
from std_msgs.msg import String
from Planner.msg import Mood
from Planner.msg import Bottle

from Speaker import Speaker

class Planner:
    def __init__(self):
        rospy.init_node('Planner')
        rospy.Subscriber("bottle", Bottle, objectDetected)
        self.pub = rospy.Publisher("mood", Mood)
        self.mood_value = 0
        self.speaker = Speaker()
        while not rospy.is_shutdown():
            rospy.sleep(20.0)
            neutraliseMood(1)

    def updateMood(self, change, detection):
        self.mood_value += change
        if self.mood_value > 100:
            self.mood_value = 100
        elif self.mood_value < -100:
            self.mood_value = -100
        self.pub.publish(self.mood_value, detection)

    def objectDetected(self, msg):
        if msg.obj_detected == 0: # Not bottle
            self.updateMood(-15,0)
            rospy.loginfo(rospy.get_name()+"Detected not bottle")
        elif msg.obj_detected == 1: # Bottle
            self.updateMood(20,1)
            rospy.loginfo(rospy.get_name()+"Bottle detected")


if __name__ == '__main__':
    try:
		p = Planner()
    except rospy.ROSInterruptException: pass
