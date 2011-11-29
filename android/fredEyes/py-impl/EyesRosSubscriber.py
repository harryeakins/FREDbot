import sys
import time

from data import FredEyes
from data.ttypes import *
from data.constants import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def listener():
    try:
        # Make socket
        transport = TSocket.TSocket(sys.argv[1], 9090)

        # Buffering is critical. Raw sockets are very slow
        transport = TTransport.TBufferedTransport(transport)

        # Wrap in a protocol
        protocol = TBinaryProtocol.TBinaryProtocol(transport)

        # Create a client to use the protocol encoder
        client = FredEyes.Client(protocol)

        # Connect!
        transport.open()
        
        # ROS code
        rospy.init_node('FredEyes', anonymous=True)
        rospy.Subscriber("setHappiness", int , client.setHappiness)
        rospy.Subscriber("setFocus", Location , client.setFocus)
        rospy.spin()
    
    except Thrift.TException, tx:
        print "%s" % (tx.message)
    except IndexError, e:
        print "Usage: python FredEyesClient.py [ip_address]/n"
    finally:
        transport.close()

if __name__ == '__main__':
    listener()