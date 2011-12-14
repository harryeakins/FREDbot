#!/usr/bin/env python
import roslib; roslib.load_manifest('turnhead')
import rospy
from std_msgs.msg import Int32
from freduino.msg import Angle
from people_tracker.msg import personLocation

import sys
import time

class neckturner:

	def __init__(self):
		rospy.init_node('FredEyes', anonymous=True)
		#rospy.Subscriber("personAngle", Int32, self.neckcallback, queue_size=1)
		rospy.Subscriber("personLocation", personLocation, self.mouthcallback, queue_size=1)
		self.neckpub = rospy.Publisher("neck_angle", Angle)
		self.mouthpub = rospy.Publisher("mouth_angle", Angle)
		
	def neckcallback(self, data):
		a = Angle()
		a.angle = (-1*data.data)/2+50
		print "Neck: ", a.angle
		#self.neckpub.publish(a)
		#time.sleep(0.1)

	def mouthcallback(self, data):
		am = Angle()
		an = Angle()
		am.angle = self.distToMouthAngle(data.Distance)
		an.angle = self.angleToNeckAngle(data.Angle)
		print "Mouth:", am.angle, " | Neck :", an.angle
		self.mouthpub.publish(am)
		self.neckpub.publish(an)
		#time.sleep(

	def distToMouthAngle(self,dist):
		if(dist > 1000):
			return 99
		elif(dist > 500):
			return (dist-500)/5 - 1
		else:
			return 0;
	def angleToNeckAngle(self, angle):
		angle = -1 * angle
		if(angle > 0):
			return angle/3 + 70;
		else:
			return angle*7/9 + 70;
			

	def run(self):
		rospy.spin()


if __name__ == '__main__':
	n = neckturner()
	n.run()
		
