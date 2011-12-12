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

    
class Listener():
    def run(self):
        try:
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
                
        ################### ROS code ######################################
                rospy.init_node('FredEyes', anonymous=True)
                rospy.Subscriber("setHappiness", Int32, self.setHappiness, queue_size=1)
                rospy.Subscriber("setFocus", Vector3, self.setFocus, queue_size=1)
                print "Spinning!"
                rospy.spin() 
        ##################################################################

            except Thrift.TException, tx:
                print "%s" % (tx.message)
            finally:
		print "Problem!"
                transport.close()

        except IndexError, e:
            print "Usage: python FredEyesClient.py [ip_address]\n"

    def setFocus(self, data):
        loc = Location(data.x, data.y, data.z)
        self.client.setFocus(loc)

    def setHappiness(self, data):
        happiness = data.data
        self.client.setHappiness(happiness)

if __name__ == '__main__':
    l = Listener()
    l.run()

