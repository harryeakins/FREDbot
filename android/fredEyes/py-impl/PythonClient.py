#!/usr/bin/env python

import sys

from data import FredEyes
from data.ttypes import *
from data.constants import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

try:
    # Make socket
    transport = TSocket.TSocket('192.168.1.91', 9090)
    
    # Buffering is critical. Raw sockets are very slow
    transport = TTransport.TBufferedTransport(transport)
    
    # Wrap in a protocol
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    
    # Create a client to use the protocol encoder
    client = FredEyes.Client(protocol)
    
    # Connect!
    transport.open()
    
    client.setHappiness(3)
    print "happy"
    
    transport.close()

except Thrift.TException, tx:
    print "%s" % (tx.message)