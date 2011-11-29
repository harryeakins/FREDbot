#!/usr/bin/env python
import roslib; roslib.load_manifest('Planner')
import rospy
from std_msgs.msg import String
from Planner.msg import Mood
from Planner.msg import Bottle

pub = rospy.Publisher("mood", Mood)
rospy.init_node('Planner')

def bottleDetection():
    rospy.Subscriber("bottle", Bottle, publishMood)
    rospy.spin()

def publishMood(msg):
	if msg.obj_detected == 0:
		pub.publish(-100)
		rospy.loginfo(rospy.get_name()+"Detected not bottle")

	if msg.obj_detected == 1:
		pub.publish(100)
		rospy.loginfo(rospy.get_name()+"Bottle detected")


if __name__ == '__main__':
    try:
        bottleDetection()
    except rospy.ROSInterruptException: pass
