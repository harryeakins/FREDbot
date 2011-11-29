#!/usr/bin/env python
import roslib; roslib.load_manifest('Planner')
import rospy
from std_msgs.msg import String
from Planner.msg import Mood

def publishMood():
    pub = rospy.Publisher("mood", Mood)
    rospy.init_node('Planner')
    while not rospy.is_shutdown():
        str = "hello world %s"%rospy.get_time()
        rospy.loginfo(str)
        pub.publish(rospy.get_time()%100)
        rospy.sleep(1.0)

if __name__ == '__main__':
    try:
        publishMood()
    except rospy.ROSInterruptException: pass
