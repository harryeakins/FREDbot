import sys
import time

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
    i = 1
    while i<1500 :
        #client.setHappiness(i)
        client.setFocus(Location(x=i, y=100,z=8))
        i = (i + 15)
        time.sleep(0.1)
    #client.setHappiness(-1, -1, -1, int(sys.argv[2]))
        print "move eyes"

except Thrift.TException, tx:
    print "%s" % (tx.message)

except IndexError, e:
    print "Usage: python FredEyesClient.py [ip_address]/n"
finally:
    transport.close()