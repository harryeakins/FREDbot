#!/usr/bin/env python
import roslib; roslib.load_manifest('FredEyes')
import rospy
from std_msgs.msg import Int32
from geometry_msgs.msg import Vector3


import sys
import time

from data import FredEyes
from data.ttypes import *
from data.constants import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

import threading
	
class Listener():
	def __init__(self):
		self.mutex = threading.Lock()
	def connect(self):
		transport = TSocket.TSocket(rospy.get_param("/FredEyes/tablet_ip"), 9090)
		try:
			# Buffering is critical. Raw sockets are very slow
			transport = TTransport.TBufferedTransport(transport)

			# Wrap in a protocol
			protocol = TBinaryProtocol.TBinaryProtocol(transport)

			# Create a client to use the protocol encoder
			self.client = FredEyes.Client(protocol)

			# Connect!
			transport.open()

		except Thrift.TException, tx:
			print "%s" % (tx.message)
		
	def run(self):
		if(not hasattr(self, "client")):
			self.connect()

		rospy.init_node('FredEyes', anonymous=True)
		rospy.Subscriber("setHappiness", Int32, self.setHappiness, queue_size=1)
		rospy.Subscriber("setFocus", Vector3, self.setFocus, queue_size=1)
		print "Spinning!"
		rospy.spin() 

	def setFocus(self, data):
		loc = Location(data.x, data.y, data.z)
		self.mutex.acquire()
		try:
			print "setFocus!", time.asctime()
			self.client.setFocus(loc)
			print "setFocus finished!", time.asctime()
		except:
			print "setFocus failed!", time.asctime()
			self.connect()
		self.mutex.release()

	def setHappiness(self, data):
		happiness = data.data
		self.mutex.acquire()
		try:
			print "setHappiness!", time.asctime()
			self.client.setHappiness(happiness)
			print "setHappiness finished!", time.asctime()
		except:
			print "setHappiness Failed", time.asctime()
			self.connect()
		self.mutex.release()

if __name__ == '__main__':
	l = Listener()
	l.run()

