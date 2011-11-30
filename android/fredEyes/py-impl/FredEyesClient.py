import sys
import time
from math import sin, cos
from data import FredEyes
from data.ttypes import *
from data.constants import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

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
    
    #client.setFocus(Location(int(sys.argv[2]),int(sys.argv[3]),int(sys.argv[4])))
    #print "focus moved"

    for i in range (10):
        client.setHappiness(int(sys.argv[2]))
        time.sleep(0.3)
    
    if int(sys.argv[2])>0:
        print "happy"
    else:
        print "sad"
        

except Thrift.TException, tx:
    print "%s" % (tx.message)

except IndexError, e:
    print "Usage: python FredEyesClient.py [ip_address][happinessIndex]"
finally:
    transport.close()