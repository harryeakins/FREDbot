#!/usr/bin/env python
import roslib; roslib.load_manifest('Planner')
import rospy
from std_msgs.msg import String
from std_msgs.msg import Int32
from Planner.msg import Mood
from Planner.msg import Bottle

mood_value = 0
pub = rospy.Publisher("mood", Mood)
just_mood_pub = rospy.Publisher("just_mood", Int32)

def initPlanner():
	rospy.init_node('Planner')
	rospy.Subscriber("bottle", Bottle, objectDetected)
	while not rospy.is_shutdown():
		rospy.sleep(20.0)
		neutraliseMood(1)

def updateMood(change, detection):
	global mood_value
	mood_value += change
	if mood_value > 100:
		mood_value = 100
	elif mood_value < -100:
		mood_value = -100
	pub.publish(mood_value, detection)
	just_mood_pub.publish(mood_value)

def neutraliseMood(change):
	global mood_value
	if mood_value > 0:
		rospy.loginfo("Neutralising mood by %i",change)
		updateMood(-change, -1)
	elif mood_value < 0:
		rospy.loginfo("Neutralising mood by %i",change)
		updateMood(change, -1)


def objectDetected(msg):
	if msg.obj_detected == 0:
		updateMood(-15,0)
		rospy.loginfo(rospy.get_name()+"Detected not bottle")
	elif msg.obj_detected == 1:
		updateMood(20,1)
		rospy.loginfo(rospy.get_name()+"Bottle detected")


if __name__ == '__main__':
    try:
		initPlanner()
    except rospy.ROSInterruptException: pass
